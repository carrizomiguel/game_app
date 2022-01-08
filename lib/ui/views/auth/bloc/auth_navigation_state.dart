part of 'auth_navigation_bloc.dart';

enum AuthView { initial, google, email, guest }

@freezed
class AuthNavigationState with _$AuthNavigationState {
  const factory AuthNavigationState.initial() = _Initial;
  const factory AuthNavigationState.google() = _Google;
  const factory AuthNavigationState.email() = _Email;
  const factory AuthNavigationState.guest() = _Guest;
}
