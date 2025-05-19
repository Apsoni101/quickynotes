import 'package:firebase_auth/firebase_auth.dart';
import 'package:quicky_notes/feature/auth/domain/entities/user_entity.dart';

///responsible for converting firebase user to UserEntity
class UserModel extends UserEntity {
  ///creates an instance of userModel
  UserModel({required super.uid, required super.email});

  ///responsible for converting firebase user to UserEntity
  factory UserModel.fromFirebaseUser(final User user) =>
      UserModel(uid: user.uid, email: user.email ?? '');
}
