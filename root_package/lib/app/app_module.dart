import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:other_package/other_package.dart';

import 'app_widget.dart';
import 'features/home/home_module.dart';
import 'features/sign_in_anonymous/sign_in_anonymous_module.dart';
import 'features/sign_in_google/sign_in_google_module.dart';
import 'features/sign_in_phone_number/sign_in_phone_number_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Firebase.app()),
        Bind((i) => OtherPackage(i.get<FirebaseApp>())),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/sign-in-anonymous', module: SignInAnonymousModule()),
        ModularRouter('/sign-in-phone-number',
            module: SignInPhoneNumberModule()),
        ModularRouter('/sign-in-google', module: SignInGoogleModule()),
      ];
}
