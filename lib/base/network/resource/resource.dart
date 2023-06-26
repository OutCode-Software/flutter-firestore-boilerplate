import 'package:freezed_annotation/freezed_annotation.dart';
part 'resource.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class Resource<T> with _$Resource<T> {
  const factory Resource.successState(T data) = _SuccessState<T>;
  const factory Resource.errorState(String errorMessage) = _ErrorState;
}