import 'package:dartz/dartz.dart';
import 'package:quicky_notes/core/error/failure.dart';

abstract class NotificationService {
  Future<void> initialize();

  Future<Either<Failure, Unit>> sendNotification({
    required final String title,
    required final String body,
    required final String topic,
  });
}
