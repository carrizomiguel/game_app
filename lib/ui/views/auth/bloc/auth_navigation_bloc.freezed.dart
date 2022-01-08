// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_navigation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthNavigationEventTearOff {
  const _$AuthNavigationEventTearOff();

  _ChangeView changeView(AuthView view) {
    return _ChangeView(
      view,
    );
  }
}

/// @nodoc
const $AuthNavigationEvent = _$AuthNavigationEventTearOff();

/// @nodoc
mixin _$AuthNavigationEvent {
  AuthView get view => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthView view) changeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthView view)? changeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthView view)? changeView,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeView value) changeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeView value)? changeView,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeView value)? changeView,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthNavigationEventCopyWith<AuthNavigationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthNavigationEventCopyWith<$Res> {
  factory $AuthNavigationEventCopyWith(
          AuthNavigationEvent value, $Res Function(AuthNavigationEvent) then) =
      _$AuthNavigationEventCopyWithImpl<$Res>;
  $Res call({AuthView view});
}

/// @nodoc
class _$AuthNavigationEventCopyWithImpl<$Res>
    implements $AuthNavigationEventCopyWith<$Res> {
  _$AuthNavigationEventCopyWithImpl(this._value, this._then);

  final AuthNavigationEvent _value;
  // ignore: unused_field
  final $Res Function(AuthNavigationEvent) _then;

  @override
  $Res call({
    Object? view = freezed,
  }) {
    return _then(_value.copyWith(
      view: view == freezed
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as AuthView,
    ));
  }
}

/// @nodoc
abstract class _$ChangeViewCopyWith<$Res>
    implements $AuthNavigationEventCopyWith<$Res> {
  factory _$ChangeViewCopyWith(
          _ChangeView value, $Res Function(_ChangeView) then) =
      __$ChangeViewCopyWithImpl<$Res>;
  @override
  $Res call({AuthView view});
}

/// @nodoc
class __$ChangeViewCopyWithImpl<$Res>
    extends _$AuthNavigationEventCopyWithImpl<$Res>
    implements _$ChangeViewCopyWith<$Res> {
  __$ChangeViewCopyWithImpl(
      _ChangeView _value, $Res Function(_ChangeView) _then)
      : super(_value, (v) => _then(v as _ChangeView));

  @override
  _ChangeView get _value => super._value as _ChangeView;

  @override
  $Res call({
    Object? view = freezed,
  }) {
    return _then(_ChangeView(
      view == freezed
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as AuthView,
    ));
  }
}

/// @nodoc

class _$_ChangeView implements _ChangeView {
  const _$_ChangeView(this.view);

  @override
  final AuthView view;

  @override
  String toString() {
    return 'AuthNavigationEvent.changeView(view: $view)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeView &&
            const DeepCollectionEquality().equals(other.view, view));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(view));

  @JsonKey(ignore: true)
  @override
  _$ChangeViewCopyWith<_ChangeView> get copyWith =>
      __$ChangeViewCopyWithImpl<_ChangeView>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthView view) changeView,
  }) {
    return changeView(view);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthView view)? changeView,
  }) {
    return changeView?.call(view);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthView view)? changeView,
    required TResult orElse(),
  }) {
    if (changeView != null) {
      return changeView(view);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeView value) changeView,
  }) {
    return changeView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeView value)? changeView,
  }) {
    return changeView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeView value)? changeView,
    required TResult orElse(),
  }) {
    if (changeView != null) {
      return changeView(this);
    }
    return orElse();
  }
}

abstract class _ChangeView implements AuthNavigationEvent {
  const factory _ChangeView(AuthView view) = _$_ChangeView;

  @override
  AuthView get view;
  @override
  @JsonKey(ignore: true)
  _$ChangeViewCopyWith<_ChangeView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AuthNavigationStateTearOff {
  const _$AuthNavigationStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Google google() {
    return const _Google();
  }

  _Email email() {
    return const _Email();
  }

  _Guest guest() {
    return const _Guest();
  }
}

/// @nodoc
const $AuthNavigationState = _$AuthNavigationStateTearOff();

/// @nodoc
mixin _$AuthNavigationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() google,
    required TResult Function() email,
    required TResult Function() guest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Google value) google,
    required TResult Function(_Email value) email,
    required TResult Function(_Guest value) guest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthNavigationStateCopyWith<$Res> {
  factory $AuthNavigationStateCopyWith(
          AuthNavigationState value, $Res Function(AuthNavigationState) then) =
      _$AuthNavigationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthNavigationStateCopyWithImpl<$Res>
    implements $AuthNavigationStateCopyWith<$Res> {
  _$AuthNavigationStateCopyWithImpl(this._value, this._then);

  final AuthNavigationState _value;
  // ignore: unused_field
  final $Res Function(AuthNavigationState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$AuthNavigationStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AuthNavigationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() google,
    required TResult Function() email,
    required TResult Function() guest,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Google value) google,
    required TResult Function(_Email value) email,
    required TResult Function(_Guest value) guest,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthNavigationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$GoogleCopyWith<$Res> {
  factory _$GoogleCopyWith(_Google value, $Res Function(_Google) then) =
      __$GoogleCopyWithImpl<$Res>;
}

/// @nodoc
class __$GoogleCopyWithImpl<$Res>
    extends _$AuthNavigationStateCopyWithImpl<$Res>
    implements _$GoogleCopyWith<$Res> {
  __$GoogleCopyWithImpl(_Google _value, $Res Function(_Google) _then)
      : super(_value, (v) => _then(v as _Google));

  @override
  _Google get _value => super._value as _Google;
}

/// @nodoc

class _$_Google implements _Google {
  const _$_Google();

  @override
  String toString() {
    return 'AuthNavigationState.google()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Google);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() google,
    required TResult Function() email,
    required TResult Function() guest,
  }) {
    return google();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
  }) {
    return google?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Google value) google,
    required TResult Function(_Email value) email,
    required TResult Function(_Guest value) guest,
  }) {
    return google(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
  }) {
    return google?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(this);
    }
    return orElse();
  }
}

abstract class _Google implements AuthNavigationState {
  const factory _Google() = _$_Google;
}

/// @nodoc
abstract class _$EmailCopyWith<$Res> {
  factory _$EmailCopyWith(_Email value, $Res Function(_Email) then) =
      __$EmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmailCopyWithImpl<$Res> extends _$AuthNavigationStateCopyWithImpl<$Res>
    implements _$EmailCopyWith<$Res> {
  __$EmailCopyWithImpl(_Email _value, $Res Function(_Email) _then)
      : super(_value, (v) => _then(v as _Email));

  @override
  _Email get _value => super._value as _Email;
}

/// @nodoc

class _$_Email implements _Email {
  const _$_Email();

  @override
  String toString() {
    return 'AuthNavigationState.email()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Email);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() google,
    required TResult Function() email,
    required TResult Function() guest,
  }) {
    return email();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
  }) {
    return email?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
    required TResult orElse(),
  }) {
    if (email != null) {
      return email();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Google value) google,
    required TResult Function(_Email value) email,
    required TResult Function(_Guest value) guest,
  }) {
    return email(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
  }) {
    return email?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
    required TResult orElse(),
  }) {
    if (email != null) {
      return email(this);
    }
    return orElse();
  }
}

abstract class _Email implements AuthNavigationState {
  const factory _Email() = _$_Email;
}

/// @nodoc
abstract class _$GuestCopyWith<$Res> {
  factory _$GuestCopyWith(_Guest value, $Res Function(_Guest) then) =
      __$GuestCopyWithImpl<$Res>;
}

/// @nodoc
class __$GuestCopyWithImpl<$Res> extends _$AuthNavigationStateCopyWithImpl<$Res>
    implements _$GuestCopyWith<$Res> {
  __$GuestCopyWithImpl(_Guest _value, $Res Function(_Guest) _then)
      : super(_value, (v) => _then(v as _Guest));

  @override
  _Guest get _value => super._value as _Guest;
}

/// @nodoc

class _$_Guest implements _Guest {
  const _$_Guest();

  @override
  String toString() {
    return 'AuthNavigationState.guest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Guest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() google,
    required TResult Function() email,
    required TResult Function() guest,
  }) {
    return guest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
  }) {
    return guest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? google,
    TResult Function()? email,
    TResult Function()? guest,
    required TResult orElse(),
  }) {
    if (guest != null) {
      return guest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Google value) google,
    required TResult Function(_Email value) email,
    required TResult Function(_Guest value) guest,
  }) {
    return guest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
  }) {
    return guest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Google value)? google,
    TResult Function(_Email value)? email,
    TResult Function(_Guest value)? guest,
    required TResult orElse(),
  }) {
    if (guest != null) {
      return guest(this);
    }
    return orElse();
  }
}

abstract class _Guest implements AuthNavigationState {
  const factory _Guest() = _$_Guest;
}
