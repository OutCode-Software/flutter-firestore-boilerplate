part of 'application_bloc.dart';

@freezed
class ApplicationEvent with _$ApplicationEvent {
  const factory ApplicationEvent.loaded() = ApplicationLoaded;
  const factory ApplicationEvent.localeChanged({
    required String locale,
  }) = ApplicationLocaleChanged;
}
