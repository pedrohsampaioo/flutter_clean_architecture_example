import 'package:dartz/dartz.dart';

import '../../core/failures/auth_failure.dart';
import '../../core/usecase/use_case.dart';
import '../entities/user_entity.dart';
import '../services/auth_service.dart';

class SignInAnonymous extends UseCase<AuthFailure, UserEntity, NoParams> {
  final AuthService _authService;

  const SignInAnonymous(this._authService): assert(_authService != null);

  @override
  Future<Either<AuthFailure, UserEntity>> call(NoParams params) {
    return _authService.signInAnonymous();
  }
  
}

