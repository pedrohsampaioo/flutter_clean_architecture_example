library other_package;

import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:other_package/dependency_injection.dart' as di;
import 'package:other_package/domain/usecases/get_currently_logged_user.dart';
import 'package:other_package/domain/usecases/send_phone_verification_code.dart';
import 'package:other_package/domain/usecases/sign_in_anonymous.dart';
import 'package:other_package/domain/usecases/sign_in_google.dart';
import 'package:other_package/domain/usecases/sign_in_phone_number.dart';
import 'package:other_package/domain/usecases/sign_out.dart';

class OtherPackage {
  final FirebaseApp _firebaseApp;
  final GetIt _di;

  OtherPackage(this._firebaseApp) : _di = GetIt.asNewInstance() {
    assert(_firebaseApp != null);

    di.configDependencyInject(
      firebaseAppConfigured: _firebaseApp,
      dependencyInject: _di,
    );
  }

  SignInAnonymous signInAnonymous() {
    return _di.get<SignInAnonymous>();
  }

  SendPhoneVerificationCode sendPhoneVerificationCode() {
    return _di.get<SendPhoneVerificationCode>();
  }

  SignInPhoneNumber signInPhoneNumber() {
    return _di.get<SignInPhoneNumber>();
  }

  SignInGoogle signInGoogle() {
    return _di.get<SignInGoogle>();
  }

  GetCurrentlyLoggedUser getCurrentlyLoggedUser() {
    return _di.get<GetCurrentlyLoggedUser>();
  }

  SignOut signOut() {
    return _di.get<SignOut>();
  }
}
