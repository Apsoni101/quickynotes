import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:quicky_notes/core/constants/app_assets.dart';
import 'package:quicky_notes/core/services/error/failure.dart';
import 'package:quicky_notes/core/services/notification_service.dart';

class FCMService implements NotificationService {
  FCMService({required this.projectId});

  final Dio _dio = Dio();
  final String projectId;

  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  Future<void> initialize() async {
    await _requestPermission();
    await _initializeLocalNotifications();
    _setupFCMListeners();
  }

  Future<void> _requestPermission() async {
    await FirebaseMessaging.instance.requestPermission();
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _localNotificationsPlugin.initialize(settings);
  }

  void _setupFCMListeners() {
    FirebaseMessaging.onMessage.listen(_showLocalNotification);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      final RemoteMessage message,
      ) async {
    await _showLocalNotification(message);
  }

  static Future<void> _showLocalNotification(
      final RemoteMessage message,
      ) async {
    final RemoteNotification? notification = message.notification;
    final AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      await _localNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'default_channel_id',
            'Default Channel',
            channelDescription:
            'Used for displaying FCM notifications in foreground',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> sendNotification({
    required final String title,
    required final String body,
    required final String topic,
  }) async {
    final String url =
        'https://fcm.googleapis.com/v1/projects/$projectId/messages:send';

    try {
      final String accessToken = await _getAccessToken();

      final Map<String, dynamic> payload = <String, Object>{
        'message': <String, Object>{
          'topic': topic,
          'notification': <String, String>{'title': title, 'body': body},
        },
      };

      await _dio.post(
        url,
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
        data: json.encode(payload),
      );

      return right(unit);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<String> _getAccessToken() async {
    final String jsonStr = await rootBundle.loadString(AppAssets.serviceAcc);
    final Map<String, dynamic> serviceAccount = json.decode(jsonStr);

    final ServiceAccountCredentials credentials =
    ServiceAccountCredentials.fromJson(serviceAccount);

    final List<String> scopes = <String>[
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final AutoRefreshingAuthClient authClient = await clientViaServiceAccount(
      credentials,
      scopes,
    );

    return authClient.credentials.accessToken.data;
  }
}
