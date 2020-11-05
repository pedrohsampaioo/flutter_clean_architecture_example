
import '../../core/failures/auth_failure.dart';
import '../../core/usecase/use_case.dart';
import '../entities/phone_verification_id_entity.dart';
import '../entities/user_entity.dart';
import '../services/auth_service.dart';

class SendPhoneVerificationCode
    extends UseCaseNoReturn<PhoneVerificationCodeParams> {
  final AuthService _authService;

  const SendPhoneVerificationCode(this._authService)
      : assert(_authService != null);

  @override
  Future<void> call(
    PhoneVerificationCodeParams params,
  ) {
    return _authService.sendPhoneVerificationCode(
      params.phoneNumber,
      params.failureHasOccurred,
      params.loggingInSuccess,
      params.updateVerificationId,
      params.timeout,
    );
  }
}

class PhoneVerificationCodeParams {
  final String phoneNumber;
  final void Function(UserEntity) loggingInSuccess;
  final Duration timeout;
  final void Function(AuthFailure) failureHasOccurred;
  final void Function(PhoneVerificationIdEntity) updateVerificationId;

  const PhoneVerificationCodeParams(
    this.phoneNumber,
    this.loggingInSuccess,
    this.failureHasOccurred,
    this.updateVerificationId, [
    this.timeout = const Duration(minutes: 2),
  ])  : assert(phoneNumber != null),
        assert(loggingInSuccess != null),
        assert(timeout != null),
        assert(failureHasOccurred != null),
        assert(updateVerificationId != null);
}
