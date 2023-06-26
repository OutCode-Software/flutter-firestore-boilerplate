import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_response.freezed.dart';

part 'basic_response.g.dart';

@freezed
class BasicResponse with _$BasicResponse {
  factory BasicResponse({String? message}) = _BasicResponse;

  factory BasicResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicResponseFromJson(json);
}
