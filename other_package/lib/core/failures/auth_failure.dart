import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'auth_failure.freezed.dart';

/// most of the errors listed here are representations to replicate
/// an exception status [FirebaseAuthException],
/// they are listed at the following
/// URL [https://cloud.google.com/identity-platform/docs/error-codes?hl=en ]
///
@freezed
abstract class AuthFailure with _$AuthFailure implements Failure {
  const factory AuthFailure.operationNotAllowed(
    Exception exception,
  ) = OperationNotAllowed;
  const factory AuthFailure.serverFailure(
    Exception exception,
  ) = ServerFailure;
  const factory AuthFailure.adminRestrictedOperation(
    Exception exception,
  ) = AdminRestrictedOperation;
  const factory AuthFailure.invalidPhoneNumber(
    Exception exception,
  ) = InvalidPhoneNumber;
  const factory AuthFailure.manyRequests(
    Exception exception,
  ) = ManyRequests;
  const factory AuthFailure.appNotAuthorized(
    Exception exception,
  ) = AppNotAuthorized;
  const factory AuthFailure.quotaExceeded(
    Exception exception,
  ) = QuotaExceeded;
  const factory AuthFailure.invalidVerificationCode(
    Exception exception,
  ) = InvalidVerificationCode;
  const factory AuthFailure.invalidVerificationId(
    Exception exception,
  ) = InvalidVerificationId;
  const factory AuthFailure.signInWithGoogleWasAborted(
    Exception exception,
  ) = SignInWithGoogleWasAborted;
  const factory AuthFailure.accountExistWithDifferentCredential(
    Exception exception,
  ) = AccountExistsWithDifferentCredential;
  const factory AuthFailure.invalidCredential(
    Exception exception,
  ) = InvalidCredential;
  const factory AuthFailure.userDisabled(
    Exception exception,
  ) = UserDisabled;
  const factory AuthFailure.errorGettingCurrentUser() = ErrorGettingCurrentUser;

  const factory AuthFailure.errorLoggingOutCurrentUser() =
      ErrorLoggingOutCurrentUser;
}
