import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:other_package/core/failures/auth_failure.dart';
import 'package:other_package/domain/entities/phone_verification_id_entity.dart';
import 'package:other_package/domain/entities/user_entity.dart';
import 'package:other_package/domain/usecases/send_phone_verification_code.dart';
import 'package:other_package/domain/usecases/sign_in_phone_number.dart';

part 'sign_in_phone_number_cubit.freezed.dart';
part 'sign_in_phone_number_state.dart';

class SignInPhoneNumberCubit extends Cubit<SignInPhoneNumberState> {
  final SignInPhoneNumber _signInPhoneNumberUsecase;
  final SendPhoneVerificationCode _sendPhoneVerificationCodeUsecase;

  SignInPhoneNumberCubit(
    this._signInPhoneNumberUsecase,
    this._sendPhoneVerificationCodeUsecase,
  ) : super(SignInPhoneNumberState.initialized());

  Future<void> sendVerificationCode(String phoneNumber) async {
    final params = PhoneVerificationCodeParams(
      phoneNumber,
      _loggingInSuccess,
      _failureHasOccurred,
      _updateVerificationId,
    );
    emit(SignInPhoneNumberState.initialized());
    emit(state.setLoadInProgress(true));
    await _sendPhoneVerificationCodeUsecase(params);
    emit(state.setLoadInProgress(false));
  }

  Future<void> signIn(String smsCode) async {
    emit(state.setLoadInProgress(true));
    state.verificationIdEntity.fold(
      () {},
      (verificationId) async {
        final params = SignInPhoneNumberParams(verificationId.id, smsCode);
        final failureOrSuccess = await _signInPhoneNumberUsecase(params);
        failureOrSuccess.fold(
          (failure) => emit(state.setFailure(failure)),
          (user) => emit(state.setUser(user)),
        );
      },
    );
    emit(state.setLoadInProgress(false));
  }

  void _loggingInSuccess(UserEntity user) {
    if (state.user.isNone()) {
      emit(state.setUser(user));
    }
  }

  void _failureHasOccurred(AuthFailure failure) {
    emit(state.setFailure(failure));
  }

  void _updateVerificationId(PhoneVerificationIdEntity verificationId) {
    emit(state.setVerificationId(verificationId));
  }
}
