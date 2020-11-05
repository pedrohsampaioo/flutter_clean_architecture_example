import 'package:dartz/dartz.dart';

import '../../core/failures/auth_failure.dart';
import '../../core/usecase/use_case.dart';
import '../services/auth_service.dart';

class SignOut extends UseCase<AuthFailure, Unit, NoParams> {
  final AuthService _authService;

  const SignOut(this._authService) : assert(_authService != null);
  @override
  Future<Either<AuthFailure, Unit>> call(NoParams params) async {
    return _authService.signOut();
  }
}
