part of 'guest_bloc.dart';

@freezed
class GuestState with _$GuestState {
  const factory GuestState.initial() = _Initial;
  const factory GuestState.loading() = _Loading;
  const factory GuestState.success() = _Success;
  const factory GuestState.failed() = _Failed;
}
