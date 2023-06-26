import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_demo/services/local_storage_service/local_storage_service.dart';

import 'package:bloc_demo/generated/l10n.dart';

part 'application_event.dart';
part 'application_state.dart';
part 'application_bloc.freezed.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc({
    required LocalStorageService localStorageService,
  }) : super(const ApplicationState()) {
    _localStorageService = localStorageService;
    on<ApplicationLoaded>(_onLoaded);
    on<ApplicationLocaleChanged>(_onLocaleChanged);
  }
  late LocalStorageService _localStorageService;

  FutureOr<void> _onLoaded(
      ApplicationLoaded event, Emitter<ApplicationState> emit) {
    emit(state.copyWith(
      status: UIStatus.loading,
    ));
    final String locale = _localStorageService.locale;
    emit(state.copyWith(
      status: UIStatus.loadSuccess,
      locale: locale,
    ));
  }

  FutureOr<void> _onLocaleChanged(
    ApplicationLocaleChanged event,
    Emitter<ApplicationState> emit,
  ) async {
    if (state.locale != event.locale) {
      emit(state.copyWith(
        status: UIStatus.loading,
      ));
      await S.load(Locale(event.locale));

      _localStorageService.setLocale(event.locale);

      emit(state.copyWith(
        status: UIStatus.loadSuccess,
        locale: event.locale,
      ));
    }
  }
}
