import 'package:dartz/dartz.dart';

import '../../core/failures/auth_failure.dart';
import '../../core/usecase/use_case.dart';
import '../entities/user_entity.dart';
import '../services/auth_service.dart';

class SignInPhoneNumber
    extends UseCase<AuthFailure, UserEntity, SignInPhoneNumberParams> {
  final AuthService _authService;

  const SignInPhoneNumber(this._authService) : assert(_authService != null);
  @override
  Future<Either<AuthFailure, UserEntity>> call(
    SignInPhoneNumberParams params,
  ) {
    return _authService.signInPhoneNumber(
      params.verificationId,
      params.smsCode,
    );
  }
}

class SignInPhoneNumberParams {
  final String verificationId;
  final String smsCode;

  const SignInPhoneNumberParams(this.verificationId, this.smsCode)
      : assert(verificationId != null),
        assert(smsCode != null);
}
