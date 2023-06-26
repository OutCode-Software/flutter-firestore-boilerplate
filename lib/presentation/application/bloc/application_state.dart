part of 'application_bloc.dart';

@freezed
class ApplicationState with _$ApplicationState {
  const factory ApplicationState({
    @Default(UIStatus.loading) UIStatus status,
    @Default('en') String locale,
  }) = _ApplicationState;
}

enum UIStatus {
  initial,
  loading,
  loadSuccess,
  loadFailed,
}
