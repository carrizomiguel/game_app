import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_navigation_event.dart';
part 'auth_navigation_state.dart';
part 'auth_navigation_bloc.freezed.dart';

class AuthNavigationBloc extends Bloc<AuthNavigationEvent, AuthNavigationState> {

  AuthView viewIs = AuthView.initial;

  AuthNavigationBloc() : super(const AuthNavigationState.initial()) {
    on<_ChangeView>(_onChangeView);
  }

  void _onChangeView(
    _ChangeView event,
    Emitter<AuthNavigationState> emit
  ) {
    viewIs = event.view;
    switch (event.view) {
      case AuthView.initial:
        emit(const AuthNavigationState.initial());
        break;
      case AuthView.google:
        emit(const AuthNavigationState.google());
        break;
      case AuthView.email:
        emit(const AuthNavigationState.email());
        break;
      case AuthView.guest:
        emit(const AuthNavigationState.guest());
        break;
      default:
        emit(const AuthNavigationState.initial());
        break;
    }
  }
}
