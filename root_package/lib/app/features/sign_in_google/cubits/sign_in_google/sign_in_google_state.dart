part of 'sign_in_google_cubit.dart';

@freezed
abstract class SignInGoogleState with _$SignInGoogleState {
  const factory SignInGoogleState.initialized() = SignInGoogleInitialized;
  const factory SignInGoogleState.loadInProgress() =
      SignInGoogleLoadInProgress;
  const factory SignInGoogleState.loadSuccess(UserEntity userEntity) =
      SignInGoogleLoadSuccess;
  const factory SignInGoogleState.loadFailure(AuthFailure failure) =
      SignInGoogleLoadFailure;
}
