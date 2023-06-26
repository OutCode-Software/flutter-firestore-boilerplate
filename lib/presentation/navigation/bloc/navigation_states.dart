part of 'navigation_bloc.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState.initial() = Initial;
  const factory BottomNavigationState.loading() = DashboardLoading;
  const factory BottomNavigationState.onTabLoad(
      int index,
      BottomNavigationStates navigationState,
      ) = OnTabLoaded;
}

enum BottomNavigationStates {
  pageLoading,
  homePageLoaded,
  cartPageLoaded,
  profilePageLoaded
}