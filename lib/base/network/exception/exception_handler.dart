import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception_handler.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class ExceptionHandler with _$ExceptionHandler {
  const factory ExceptionHandler.successResponse(String body) = _SuccessState;
  const factory ExceptionHandler.errorResponse(String errorMessage) = _ErrorState;
}
