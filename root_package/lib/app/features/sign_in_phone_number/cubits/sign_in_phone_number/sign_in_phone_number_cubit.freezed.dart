// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_in_phone_number_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SignInPhoneNumberStateTearOff {
  const _$SignInPhoneNumberStateTearOff();

// ignore: unused_element
  _SignInPhoneNumberState call(
      {@required Option<PhoneVerificationIdEntity> verificationIdEntity,
      @required Option<UserEntity> user,
      @required Option<AuthFailure> failure,
      @required bool loadInProgress}) {
    return _SignInPhoneNumberState(
      verificationIdEntity: verificationIdEntity,
      user: user,
      failure: failure,
      loadInProgress: loadInProgress,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SignInPhoneNumberState = _$SignInPhoneNumberStateTearOff();

/// @nodoc
mixin _$SignInPhoneNumberState {
  Option<PhoneVerificationIdEntity> get verificationIdEntity;
  Option<UserEntity> get user;
  Option<AuthFailure> get failure;
  bool get loadInProgress;

  $SignInPhoneNumberStateCopyWith<SignInPhoneNumberState> get copyWith;
}

/// @nodoc
abstract class $SignInPhoneNumberStateCopyWith<$Res> {
  factory $SignInPhoneNumberStateCopyWith(SignInPhoneNumberState value,
          $Res Function(SignInPhoneNumberState) then) =
      _$SignInPhoneNumberStateCopyWithImpl<$Res>;
  $Res call(
      {Option<PhoneVerificationIdEntity> verificationIdEntity,
      Option<UserEntity> user,
      Option<AuthFailure> failure,
      bool loadInProgress});
}

/// @nodoc
class _$SignInPhoneNumberStateCopyWithImpl<$Res>
    implements $SignInPhoneNumberStateCopyWith<$Res> {
  _$SignInPhoneNumberStateCopyWithImpl(this._value, this._then);

  final SignInPhoneNumberState _value;
  // ignore: unused_field
  final $Res Function(SignInPhoneNumberState) _then;

  @override
  $Res call({
    Object verificationIdEntity = freezed,
    Object user = freezed,
    Object failure = freezed,
    Object loadInProgress = freezed,
  }) {
    return _then(_value.copyWith(
      verificationIdEntity: verificationIdEntity == freezed
          ? _value.verificationIdEntity
          : verificationIdEntity as Option<PhoneVerificationIdEntity>,
      user: user == freezed ? _value.user : user as Option<UserEntity>,
      failure:
          failure == freezed ? _value.failure : failure as Option<AuthFailure>,
      loadInProgress: loadInProgress == freezed
          ? _value.loadInProgress
          : loadInProgress as bool,
    ));
  }
}

/// @nodoc
abstract class _$SignInPhoneNumberStateCopyWith<$Res>
    implements $SignInPhoneNumberStateCopyWith<$Res> {
  factory _$SignInPhoneNumberStateCopyWith(_SignInPhoneNumberState value,
          $Res Function(_SignInPhoneNumberState) then) =
      __$SignInPhoneNumberStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<PhoneVerificationIdEntity> verificationIdEntity,
      Option<UserEntity> user,
      Option<AuthFailure> failure,
      bool loadInProgress});
}

/// @nodoc
class __$SignInPhoneNumberStateCopyWithImpl<$Res>
    extends _$SignInPhoneNumberStateCopyWithImpl<$Res>
    implements _$SignInPhoneNumberStateCopyWith<$Res> {
  __$SignInPhoneNumberStateCopyWithImpl(_SignInPhoneNumberState _value,
      $Res Function(_SignInPhoneNumberState) _then)
      : super(_value, (v) => _then(v as _SignInPhoneNumberState));

  @override
  _SignInPhoneNumberState get _value => super._value as _SignInPhoneNumberState;

  @override
  $Res call({
    Object verificationIdEntity = freezed,
    Object user = freezed,
    Object failure = freezed,
    Object loadInProgress = freezed,
  }) {
    return _then(_SignInPhoneNumberState(
      verificationIdEntity: verificationIdEntity == freezed
          ? _value.verificationIdEntity
          : verificationIdEntity as Option<PhoneVerificationIdEntity>,
      user: user == freezed ? _value.user : user as Option<UserEntity>,
      failure:
          failure == freezed ? _value.failure : failure as Option<AuthFailure>,
      loadInProgress: loadInProgress == freezed
          ? _value.loadInProgress
          : loadInProgress as bool,
    ));
  }
}

/// @nodoc
class _$_SignInPhoneNumberState extends _SignInPhoneNumberState {
  const _$_SignInPhoneNumberState(
      {@required this.verificationIdEntity,
      @required this.user,
      @required this.failure,
      @required this.loadInProgress})
      : assert(verificationIdEntity != null),
        assert(user != null),
        assert(failure != null),
        assert(loadInProgress != null),
        super._();

  @override
  final Option<PhoneVerificationIdEntity> verificationIdEntity;
  @override
  final Option<UserEntity> user;
  @override
  final Option<AuthFailure> failure;
  @override
  final bool loadInProgress;

  @override
  String toString() {
    return 'SignInPhoneNumberState(verificationIdEntity: $verificationIdEntity, user: $user, failure: $failure, loadInProgress: $loadInProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInPhoneNumberState &&
            (identical(other.verificationIdEntity, verificationIdEntity) ||
                const DeepCollectionEquality().equals(
                    other.verificationIdEntity, verificationIdEntity)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality()
                    .equals(other.failure, failure)) &&
            (identical(other.loadInProgress, loadInProgress) ||
                const DeepCollectionEquality()
                    .equals(other.loadInProgress, loadInProgress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(verificationIdEntity) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(failure) ^
      const DeepCollectionEquality().hash(loadInProgress);

  @override
  _$SignInPhoneNumberStateCopyWith<_SignInPhoneNumberState> get copyWith =>
      __$SignInPhoneNumberStateCopyWithImpl<_SignInPhoneNumberState>(
          this, _$identity);
}

abstract class _SignInPhoneNumberState extends SignInPhoneNumberState {
  const _SignInPhoneNumberState._() : super._();
  const factory _SignInPhoneNumberState(
      {@required Option<PhoneVerificationIdEntity> verificationIdEntity,
      @required Option<UserEntity> user,
      @required Option<AuthFailure> failure,
      @required bool loadInProgress}) = _$_SignInPhoneNumberState;

  @override
  Option<PhoneVerificationIdEntity> get verificationIdEntity;
  @override
  Option<UserEntity> get user;
  @override
  Option<AuthFailure> get failure;
  @override
  bool get loadInProgress;
  @override
  _$SignInPhoneNumberStateCopyWith<_SignInPhoneNumberState> get copyWith;
}
