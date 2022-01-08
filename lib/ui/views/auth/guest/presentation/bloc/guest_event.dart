part of 'guest_bloc.dart';

@freezed
class GuestEvent with _$GuestEvent {
  const factory GuestEvent.nameSubmitted(String userName) = _NameSubmitted;
}