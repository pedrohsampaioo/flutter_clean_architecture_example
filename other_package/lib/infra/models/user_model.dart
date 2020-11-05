import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(String uid) : super(uid);

  factory UserModel.fromFirebaseUser(User firebaseUser) {
    return UserModel(firebaseUser.uid);
  }
}
