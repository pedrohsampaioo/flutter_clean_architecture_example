import 'package:flutter_modular/flutter_modular.dart';
import 'package:other_package/domain/usecases/sign_in_anonymous.dart';
import 'package:other_package/other_package.dart';

import 'cubits/sign_in_anonymous/sign_in_anonymous_cubit.dart';
import 'sign_in_anonymous_page.dart';

class SignInAnonymousModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => i.get<OtherPackage>().signInAnonymous()),
        Bind((i) => SignInAnonymousCubit(i.get<SignInAnonymous>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, __) => SignInAnonymousPage()),
      ];
}
