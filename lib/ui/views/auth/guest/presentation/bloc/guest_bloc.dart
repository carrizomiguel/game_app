import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:games_app/ui/views/auth/guest/domain/repositories/guest_repository.dart';

part 'guest_event.dart';
part 'guest_state.dart';
part 'guest_bloc.freezed.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  final GuestRepository repository;

  GuestBloc({
    required this.repository
  }) : super(const GuestState.initial()) {
    on<_NameSubmitted>(_onNameSubmitted);
  }

  void _onNameSubmitted(
    _NameSubmitted event,
    Emitter emit
  ) async {
    emit(const GuestState.loading());
    debugPrint('name ====> ${event.userName}');
    final either = await repository.saveGuestInfo(event.userName);
    either.fold(
      (failure) => emit(const GuestState.failed()),
      (response) => emit(const GuestState.success())
    );
  }
}
