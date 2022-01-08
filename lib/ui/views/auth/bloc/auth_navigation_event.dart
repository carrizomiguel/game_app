part of 'auth_navigation_bloc.dart';

@freezed
class AuthNavigationEvent with _$AuthNavigationEvent {
  const factory AuthNavigationEvent.changeView(
    AuthView view
  ) = _ChangeView;
}