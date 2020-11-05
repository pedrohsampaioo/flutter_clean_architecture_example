import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:other_package/core/exceptions/auth_exception.dart';

import '../../core/failures/auth_failure.dart';
import '../../domain/entities/phone_verification_id_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/services/auth_service.dart';
import '../models/phone_verification_id_model.dart';
import '../models/user_model.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  const AuthServiceImpl(
    this._firebaseAuth,
    this._googleSignIn,
  )   : assert(_firebaseAuth != null),
        assert(_googleSignIn != null);

  @override
  Future<Either<AuthFailure, UserEntity>> signInAnonymous() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      final user = UserModel.fromFirebaseUser(userCredential.user);
      return right(user);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'operation-not-allowed') {
        return left(AuthFailure.operationNotAllowed(exception));
      } else if (exception.code == 'admin-restricted-operation') {
        return left(AuthFailure.adminRestrictedOperation(exception));
      }
      return left(AuthFailure.serverFailure(exception));
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> signInGoogleAccount() async {
    try {
      final googleAccount = await _googleSignIn.signIn();
      final signInWasAborted = googleAccount == null;
      if (signInWasAborted) {
        final exception = SignInWithGoogleWasAbortedException(
          'Sign in with google was aborted',
        );
        return left(AuthFailure.signInWithGoogleWasAborted(exception));
      }
      final googleAuth = await googleAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final firebaseUser = await _firebaseAuth.signInWithCredential(credential);
      final user = UserModel.fromFirebaseUser(firebaseUser.user);
      return right(user);
    } on PlatformException catch (exception) {
      return left(AuthFailure.serverFailure(exception));
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'account-exists-with-different-credential') {
        return left(AuthFailure.accountExistWithDifferentCredential(exception));
      } else if (exception.code == 'invalid-credential') {
        return left(AuthFailure.invalidCredential(exception));
      } else if (exception.code == 'user-disabled') {
        return left(AuthFailure.userDisabled(exception));
      }
      return left(AuthFailure.serverFailure(exception));
    }
  }

  @override
  Future<Either<AuthFailure, Option<UserEntity>>> currentUser() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final loggedOutUser = currentUser == null;
      if (loggedOutUser) {
        return right(none());
      }
      final user = UserModel.fromFirebaseUser(currentUser);
      return right(optionOf(user));
    } catch (_) {
      return left(AuthFailure.errorGettingCurrentUser());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return right(unit);
    } catch (_) {
      return left(AuthFailure.errorLoggingOutCurrentUser());
    }
  }

  @override
  Future<void> sendPhoneVerificationCode(
    String phoneNumber,
    void Function(AuthFailure) failureHasOccurred,
    void Function(UserEntity) loggingInSuccess,
    void Function(PhoneVerificationIdEntity) updateVerificationId, [
    Duration timeout = const Duration(minutes: 2),
  ]) async {
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: _tryAutomaticSignInWithPhoneNumber(
        loggingInSuccess,
      ),
      verificationFailed: _verificationFailed(failureHasOccurred),
      codeSent: _codeSent(updateVerificationId),
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout(updateVerificationId),
      timeout: timeout,
    );
  }

  @override
  Future<Either<AuthFailure, UserEntity>> signInPhoneNumber(
    String verificationId,
    String smsCode,
  ) async {
    try {
      final phoneAuthCredential = PhoneAuthProvider.credential(
        smsCode: smsCode,
        verificationId: verificationId,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(
        phoneAuthCredential,
      );
      final user = UserModel.fromFirebaseUser(userCredential.user);
      return right(user);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'invalid-verification-code') {
        return left(AuthFailure.invalidVerificationCode(exception));
      } else if (exception.code == 'invalid-verification-id') {
        return left(AuthFailure.invalidVerificationId(exception));
      }
      return left(AuthFailure.serverFailure(exception));
    }
  }

  /// how this attempt should take place in the [background]
  /// will only trigger the [completer] if it is successful.
  ///
  void Function(PhoneAuthCredential) _tryAutomaticSignInWithPhoneNumber(
    void Function(UserEntity) loggingInSuccess,
  ) {
    final verificationCompleted = (PhoneAuthCredential phoneAuthCredential) {
      print('automatic sign in phone number called');
      _firebaseAuth.signInWithCredential(phoneAuthCredential).then(
        (userCredential) {
          final user = UserModel.fromFirebaseUser(userCredential.user);
          loggingInSuccess(user);
        },
      );
    };
    return verificationCompleted;
  }

  void Function(FirebaseAuthException) _verificationFailed(
    void Function(AuthFailure) failureHasOccurred,
  ) {
    final verificationFailed = (FirebaseAuthException exception) {
      AuthFailure failure;
      if (exception.code == 'invalid-phone-number') {
        failure = AuthFailure.invalidPhoneNumber(exception);
      } else if (exception.code == 'operation-not-allowed') {
        failure = AuthFailure.operationNotAllowed(exception);
      } else if (exception.code == 'admin-restricted-operation') {
        failure = AuthFailure.adminRestrictedOperation(exception);
      } else if (exception.code == "too-many-requests") {
        failure = AuthFailure.manyRequests(exception);
      } else if (exception.code == 'app-not-authorized') {
        failure = AuthFailure.appNotAuthorized(exception);
      } else if (exception.code == 'quota-exceeded') {
        failure = AuthFailure.quotaExceeded(exception);
      }
      failureHasOccurred(failure ?? AuthFailure.serverFailure(exception));
    };
    return verificationFailed;
  }

  void Function(String, int) _codeSent(
    void Function(PhoneVerificationIdEntity) updateVerificationId,
  ) {
    print('codeSent');
    final codeSent = (String verificationId, int resendToken) {
      final phoneVerificationId = PhoneVerificationIdModel(verificationId);
      updateVerificationId(phoneVerificationId);
    };
    return codeSent;
  }

  void Function(String) _codeAutoRetrievalTimeout(
    void Function(PhoneVerificationIdEntity) updateVerificationId,
  ) {
    print('codeAutoRetrievalTimeout');
    final codeSent = (String verificationId) {
      final phoneVerificationId = PhoneVerificationIdModel(verificationId);
      updateVerificationId(phoneVerificationId);
    };
    return codeSent;
  }
}
