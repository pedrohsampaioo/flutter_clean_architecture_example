import 'package:flutter_modular/flutter_modular.dart';
import 'package:other_package/domain/usecases/sign_in_google.dart';
import 'package:other_package/other_package.dart';
import 'package:root_package/app/features/sign_in_google/sign_in_google_page.dart';

import 'cubits/sign_in_google/sign_in_google_cubit.dart';

class SignInGoogleModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => i.get<OtherPackage>().signInGoogle()),
        Bind((i) => SignInGoogleCubit(i.get<SignInGoogle>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, __) => SignInGooglePage()),
      ];
}
