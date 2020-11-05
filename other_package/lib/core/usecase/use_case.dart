import 'package:dartz/dartz.dart';

import '../failures/failure.dart';

abstract class UseCase<F extends Failure, Type, Params> {
  const UseCase();
  Future<Either<F, Type>> call(Params params);
}

abstract class UseCaseNoReturn<Params> {
  const UseCaseNoReturn();
  Future<void> call(Params params);
}

class NoParams {
  const NoParams();
}
