import 'package:dartz/dartz.dart';

import '../../core/failures/auth_failure.dart';
import '../../core/usecase/use_case.dart';
import '../entities/user_entity.dart';
import '../services/auth_service.dart';

class GetCurrentlyLoggedUser
    extends UseCase<AuthFailure, Option<UserEntity>, NoParams> {
  final AuthService _authService;

  const GetCurrentlyLoggedUser(this._authService)
      : assert(_authService != null);
  @override
  Future<Either<AuthFailure, Option<UserEntity>>> call(NoParams params) async {
    return _authService.currentUser();
  }
}
