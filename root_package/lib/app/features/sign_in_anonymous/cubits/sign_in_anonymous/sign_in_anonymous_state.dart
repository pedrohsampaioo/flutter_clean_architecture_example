part of 'sign_in_anonymous_cubit.dart';

@freezed
abstract class SignInAnonymousState with _$SignInAnonymousState {
  const factory SignInAnonymousState.initialized() = SignInAnonymousInitialized;
  const factory SignInAnonymousState.loadInProgress() =
      SignInAnonymousLoadInProgress;
  const factory SignInAnonymousState.loadSuccess(UserEntity userEntity) =
      SignInAnonymousLoadSuccess;
  const factory SignInAnonymousState.loadFailure(AuthFailure failure) =
      SignInAnonymousLoadFailure;
}
