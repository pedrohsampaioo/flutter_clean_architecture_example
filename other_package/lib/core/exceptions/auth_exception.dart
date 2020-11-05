class SignInWithGoogleWasAbortedException implements Exception {
  final String message;

  const SignInWithGoogleWasAbortedException([this.message]);

  @override
  String toString() {
    return "Exception: $message";
  }
}
