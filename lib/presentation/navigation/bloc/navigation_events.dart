part of 'navigation_bloc.dart';

@freezed
class BottomNavigationEvent with _$BottomNavigationEvent {
  const factory BottomNavigationEvent.onTabSelected({required int index}) = OnTabSelected;
}