import 'package:dartz/dartz.dart';

import '../../core/failures/auth_failure.dart';
import '../entities/phone_verification_id_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthService {
  const AuthService();

  Future<Either<AuthFailure, UserEntity>> signInAnonymous();

  Future<Either<AuthFailure, UserEntity>> signInGoogleAccount();

  Future<Either<AuthFailure, Unit>> signOut();

  Future<Either<AuthFailure, Option<UserEntity>>> currentUser();

  Future<Either<AuthFailure, UserEntity>> signInPhoneNumber(
    String verificationId,
    String smsCode,
  );

  Future<void> sendPhoneVerificationCode(
    String phoneNumber,
    void Function(AuthFailure) failureHasOccurred,
    void Function(UserEntity) loggingInSuccess,
    void Function(PhoneVerificationIdEntity) updateVerificationId, [
    Duration timeout = const Duration(minutes: 2),
  ]);
}
