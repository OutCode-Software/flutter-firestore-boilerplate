// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BottomNavigationEvent {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) onTabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? onTabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? onTabSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnTabSelected value) onTabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnTabSelected value)? onTabSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnTabSelected value)? onTabSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomNavigationEventCopyWith<BottomNavigationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavigationEventCopyWith<$Res> {
  factory $BottomNavigationEventCopyWith(BottomNavigationEvent value,
          $Res Function(BottomNavigationEvent) then) =
      _$BottomNavigationEventCopyWithImpl<$Res, BottomNavigationEvent>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$BottomNavigationEventCopyWithImpl<$Res,
        $Val extends BottomNavigationEvent>
    implements $BottomNavigationEventCopyWith<$Res> {
  _$BottomNavigationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnTabSelectedCopyWith<$Res>
    implements $BottomNavigationEventCopyWith<$Res> {
  factory _$$OnTabSelectedCopyWith(
          _$OnTabSelected value, $Res Function(_$OnTabSelected) then) =
      __$$OnTabSelectedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$OnTabSelectedCopyWithImpl<$Res>
    extends _$BottomNavigationEventCopyWithImpl<$Res, _$OnTabSelected>
    implements _$$OnTabSelectedCopyWith<$Res> {
  __$$OnTabSelectedCopyWithImpl(
      _$OnTabSelected _value, $Res Function(_$OnTabSelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$OnTabSelected(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnTabSelected implements OnTabSelected {
  const _$OnTabSelected({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'BottomNavigationEvent.onTabSelected(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnTabSelected &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnTabSelectedCopyWith<_$OnTabSelected> get copyWith =>
      __$$OnTabSelectedCopyWithImpl<_$OnTabSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) onTabSelected,
  }) {
    return onTabSelected(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? onTabSelected,
  }) {
    return onTabSelected?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? onTabSelected,
    required TResult orElse(),
  }) {
    if (onTabSelected != null) {
      return onTabSelected(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnTabSelected value) onTabSelected,
  }) {
    return onTabSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnTabSelected value)? onTabSelected,
  }) {
    return onTabSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnTabSelected value)? onTabSelected,
    required TResult orElse(),
  }) {
    if (onTabSelected != null) {
      return onTabSelected(this);
    }
    return orElse();
  }
}

abstract class OnTabSelected implements BottomNavigationEvent {
  const factory OnTabSelected({required final int index}) = _$OnTabSelected;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$OnTabSelectedCopyWith<_$OnTabSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BottomNavigationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int index, BottomNavigationStates navigationState)
        onTabLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int index, BottomNavigationStates navigationState)?
        onTabLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int index, BottomNavigationStates navigationState)?
        onTabLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DashboardLoading value) loading,
    required TResult Function(OnTabLoaded value) onTabLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DashboardLoading value)? loading,
    TResult? Function(OnTabLoaded value)? onTabLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DashboardLoading value)? loading,
    TResult Function(OnTabLoaded value)? onTabLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavigationStateCopyWith<$Res> {
  factory $BottomNavigationStateCopyWith(BottomNavigationState value,
          $Res Function(BottomNavigationState) then) =
      _$BottomNavigationStateCopyWithImpl<$Res, BottomNavigationState>;
}

/// @nodoc
class _$BottomNavigationStateCopyWithImpl<$Res,
        $Val extends BottomNavigationState>
    implements $BottomNavigationStateCopyWith<$Res> {
  _$BottomNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$BottomNavigationStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'BottomNavigationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int index, BottomNavigationStates navigationState)
        onTabLoad,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int index, BottomNavigationStates navigationState)?
        onTabLoad,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int index, BottomNavigationStates navigationState)?
        onTabLoad,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DashboardLoading value) loading,
    required TResult Function(OnTabLoaded value) onTabLoad,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DashboardLoading value)? loading,
    TResult? Function(OnTabLoaded value)? onTabLoad,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DashboardLoading value)? loading,
    TResult Function(OnTabLoaded value)? onTabLoad,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements BottomNavigationState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$DashboardLoadingCopyWith<$Res> {
  factory _$$DashboardLoadingCopyWith(
          _$DashboardLoading value, $Res Function(_$DashboardLoading) then) =
      __$$DashboardLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardLoadingCopyWithImpl<$Res>
    extends _$BottomNavigationStateCopyWithImpl<$Res, _$DashboardLoading>
    implements _$$DashboardLoadingCopyWith<$Res> {
  __$$DashboardLoadingCopyWithImpl(
      _$DashboardLoading _value, $Res Function(_$DashboardLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardLoading implements DashboardLoading {
  const _$DashboardLoading();

  @override
  String toString() {
    return 'BottomNavigationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashboardLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int index, BottomNavigationStates navigationState)
        onTabLoad,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int index, BottomNavigationStates navigationState)?
        onTabLoad,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int index, BottomNavigationStates navigationState)?
        onTabLoad,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DashboardLoading value) loading,
    required TResult Function(OnTabLoaded value) onTabLoad,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DashboardLoading value)? loading,
    TResult? Function(OnTabLoaded value)? onTabLoad,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DashboardLoading value)? loading,
    TResult Function(OnTabLoaded value)? onTabLoad,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DashboardLoading implements BottomNavigationState {
  const factory DashboardLoading() = _$DashboardLoading;
}

/// @nodoc
abstract class _$$OnTabLoadedCopyWith<$Res> {
  factory _$$OnTabLoadedCopyWith(
          _$OnTabLoaded value, $Res Function(_$OnTabLoaded) then) =
      __$$OnTabLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, BottomNavigationStates navigationState});
}

/// @nodoc
class __$$OnTabLoadedCopyWithImpl<$Res>
    extends _$BottomNavigationStateCopyWithImpl<$Res, _$OnTabLoaded>
    implements _$$OnTabLoadedCopyWith<$Res> {
  __$$OnTabLoadedCopyWithImpl(
      _$OnTabLoaded _value, $Res Function(_$OnTabLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? navigationState = null,
  }) {
    return _then(_$OnTabLoaded(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == navigationState
          ? _value.navigationState
          : navigationState // ignore: cast_nullable_to_non_nullable
              as BottomNavigationStates,
    ));
  }
}

/// @nodoc

class _$OnTabLoaded implements OnTabLoaded {
  const _$OnTabLoaded(this.index, this.navigationState);

  @override
  final int index;
  @override
  final BottomNavigationStates navigationState;

  @override
  String toString() {
    return 'BottomNavigationState.onTabLoad(index: $index, navigationState: $navigationState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnTabLoaded &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.navigationState, navigationState) ||
                other.navigationState == navigationState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, navigationState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnTabLoadedCopyWith<_$OnTabLoaded> get copyWith =>
      __$$OnTabLoadedCopyWithImpl<_$OnTabLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int index, BottomNavigationStates navigationState)
        onTabLoad,
  }) {
    return onTabLoad(index, navigationState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int index, BottomNavigationStates navigationState)?
        onTabLoad,
  }) {
    return onTabLoad?.call(index, navigationState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int index, BottomNavigationStates navigationState)?
        onTabLoad,
    required TResult orElse(),
  }) {
    if (onTabLoad != null) {
      return onTabLoad(index, navigationState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DashboardLoading value) loading,
    required TResult Function(OnTabLoaded value) onTabLoad,
  }) {
    return onTabLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(DashboardLoading value)? loading,
    TResult? Function(OnTabLoaded value)? onTabLoad,
  }) {
    return onTabLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DashboardLoading value)? loading,
    TResult Function(OnTabLoaded value)? onTabLoad,
    required TResult orElse(),
  }) {
    if (onTabLoad != null) {
      return onTabLoad(this);
    }
    return orElse();
  }
}

abstract class OnTabLoaded implements BottomNavigationState {
  const factory OnTabLoaded(
          final int index, final BottomNavigationStates navigationState) =
      _$OnTabLoaded;

  int get index;
  BottomNavigationStates get navigationState;
  @JsonKey(ignore: true)
  _$$OnTabLoadedCopyWith<_$OnTabLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
