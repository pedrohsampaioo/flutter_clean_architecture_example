import 'package:flutter_modular/flutter_modular.dart';
import 'package:other_package/domain/usecases/send_phone_verification_code.dart';
import 'package:other_package/domain/usecases/sign_in_phone_number.dart';
import 'package:other_package/other_package.dart';

import 'sign_in_phone_number_page.dart';
import 'cubits/sign_in_phone_number/sign_in_phone_number_cubit.dart';

class SignInPhoneNumberModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => i.get<OtherPackage>().sendPhoneVerificationCode()),
        Bind((i) => i.get<OtherPackage>().signInPhoneNumber()),
        Bind((i) => SignInPhoneNumberCubit(
              i.get<SignInPhoneNumber>(),
              i.get<SendPhoneVerificationCode>(),
            )),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, __) => SignInPhoneNumberPage()),
      ];
}
