part of 'sign_in_phone_number_cubit.dart';

@freezed
abstract class SignInPhoneNumberState with _$SignInPhoneNumberState {
  const SignInPhoneNumberState._();
  const factory SignInPhoneNumberState({
    @required Option<PhoneVerificationIdEntity> verificationIdEntity,
    @required Option<UserEntity> user,
    @required Option<AuthFailure> failure,
    @required bool loadInProgress,
  }) = _SignInPhoneNumberState;

  factory SignInPhoneNumberState.initialized() => SignInPhoneNumberState(
        failure: none(),
        user: none(),
        verificationIdEntity: none(),
        loadInProgress: false,
      );

  SignInPhoneNumberState setVerificationId(
    PhoneVerificationIdEntity phoneVerificationId,
  ) =>
      SignInPhoneNumberState(
        failure: none(),
        user: none(),
        verificationIdEntity: optionOf(phoneVerificationId),
        loadInProgress: loadInProgress,
      );

  SignInPhoneNumberState setUser(UserEntity userEntity) =>
      SignInPhoneNumberState(
        failure: none(),
        user: optionOf(userEntity),
        verificationIdEntity: verificationIdEntity,
        loadInProgress: loadInProgress,
      );

  SignInPhoneNumberState setFailure(AuthFailure failure) =>
      SignInPhoneNumberState(
        failure: optionOf(failure),
        user: user,
        verificationIdEntity: verificationIdEntity,
        loadInProgress: loadInProgress,
      );

  SignInPhoneNumberState setLoadInProgress(bool loadInProgress) =>
      SignInPhoneNumberState(
        failure: failure,
        user: user,
        verificationIdEntity: verificationIdEntity,
        loadInProgress: loadInProgress ?? false,
      );
}
