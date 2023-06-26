import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../services/local_storage_service/local_storage_service.dart';

part 'navigation_bloc.freezed.dart';

part 'navigation_events.dart';

part 'navigation_states.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc({
    required LocalStorageService localStorageService,
  }) : super(const Initial()) {
    _localStorageService = localStorageService;
    on<OnTabSelected>(_onSelectTab);
  }

  late LocalStorageService _localStorageService;

  int currentIndex = 0;

  FutureOr<void> _onSelectTab(
    OnTabSelected event,
    Emitter<BottomNavigationState> emit,
  ) {
    event.whenOrNull(
      onTabSelected: (index) {
        currentIndex = index;
        switch (index) {
          case 0:
            emit(OnTabLoaded(
              index,
              BottomNavigationStates.homePageLoaded,
            ));
            break;
          case 1:
            emit(OnTabLoaded(
              index,
              BottomNavigationStates.cartPageLoaded,
            ));
            break;
          case 2:
            emit(OnTabLoaded(
              index,
              BottomNavigationStates.profilePageLoaded,
            ));
            break;
          default:
            emit(OnTabLoaded(
              index,
              BottomNavigationStates.homePageLoaded,
            ));
        }
      },
    );
  }
}
