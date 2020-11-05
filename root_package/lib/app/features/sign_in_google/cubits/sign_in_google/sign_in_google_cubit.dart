import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:other_package/core/failures/auth_failure.dart';
import 'package:other_package/core/usecase/use_case.dart';
import 'package:other_package/domain/entities/user_entity.dart';
import 'package:other_package/domain/usecases/sign_in_google.dart';

part 'sign_in_google_cubit.freezed.dart';
part 'sign_in_google_state.dart';

class SignInGoogleCubit extends Cubit<SignInGoogleState> {
  final SignInGoogle _usecase;
  SignInGoogleCubit(this._usecase) : super(SignInGoogleState.initialized());

  Future<void> signIn() async {
    emit(SignInGoogleState.loadInProgress());
    final failureOrSuccess = await _usecase(NoParams());
    failureOrSuccess.fold(
      (failure) => emit(SignInGoogleState.loadFailure(failure)),
      (user) => emit(SignInGoogleState.loadSuccess(user)),
    );
  }
}
