import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:other_package/domain/usecases/get_currently_logged_user.dart';
import 'package:other_package/domain/usecases/sign_in_google.dart';
import 'package:other_package/domain/usecases/sign_out.dart';

import 'domain/services/auth_service.dart';
import 'domain/usecases/send_phone_verification_code.dart';
import 'domain/usecases/sign_in_anonymous.dart';
import 'domain/usecases/sign_in_phone_number.dart';
import 'infra/services/auth_service_impl.dart';

void configDependencyInject({
  @required FirebaseApp firebaseAppConfigured,
  @required GetIt dependencyInject,
}) {
  assert(firebaseAppConfigured != null);
  assert(dependencyInject != null);

  // factories
  dependencyInject.registerFactory<SignInAnonymous>(
    () => SignInAnonymous(dependencyInject.get<AuthService>()),
  );
  dependencyInject.registerFactory<SignOut>(
    () => SignOut(dependencyInject.get<AuthService>()),
  );
  dependencyInject.registerFactory<GetCurrentlyLoggedUser>(
    () => GetCurrentlyLoggedUser(dependencyInject.get<AuthService>()),
  );
  dependencyInject.registerFactory<SignInPhoneNumber>(
    () => SignInPhoneNumber(dependencyInject.get<AuthService>()),
  );
  dependencyInject.registerFactory<SendPhoneVerificationCode>(
    () => SendPhoneVerificationCode(dependencyInject.get<AuthService>()),
  );
  dependencyInject.registerFactory<SignInGoogle>(
    () => SignInGoogle(dependencyInject.get<AuthService>()),
  );

  // services
  dependencyInject.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(
      dependencyInject.get<FirebaseAuth>(),
      dependencyInject.get<GoogleSignIn>(),
    ),
  );

  // external
  dependencyInject.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instanceFor(app: firebaseAppConfigured),
  );

  dependencyInject.registerLazySingleton<GoogleSignIn>(
    () => GoogleSignIn(),
  );
}
