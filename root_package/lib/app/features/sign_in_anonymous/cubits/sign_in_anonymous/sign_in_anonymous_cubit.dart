import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:other_package/core/failures/auth_failure.dart';
import 'package:other_package/core/usecase/use_case.dart';
import 'package:other_package/domain/entities/user_entity.dart';
import 'package:other_package/domain/usecases/sign_in_anonymous.dart';

part 'sign_in_anonymous_cubit.freezed.dart';
part 'sign_in_anonymous_state.dart';

class SignInAnonymousCubit extends Cubit<SignInAnonymousState> {
  final SignInAnonymous _usecase;
  SignInAnonymousCubit(this._usecase)
      : super(SignInAnonymousState.initialized());

  Future<void> signIn() async {
    emit(SignInAnonymousState.loadInProgress());
    final failureOrSuccess = await _usecase(NoParams());
    failureOrSuccess.fold(
      (failure) => emit(SignInAnonymousState.loadFailure(failure)),
      (user) => emit(SignInAnonymousState.loadSuccess(user)),
    );
  }
}
