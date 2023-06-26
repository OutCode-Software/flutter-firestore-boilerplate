import 'dart:convert';

import 'package:bloc_demo/base/network/exception/exception_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

extension ResponseHandler on http.Response {
  ExceptionHandler handleException() {
    if (statusCode == 200) {
      dev.log("Response: ${jsonDecode(body)}");
      return ExceptionHandler.successResponse(body);
    } else if (statusCode == 401 || statusCode == 403) {
      dev.log(body);
      var errorResponse = BaseErrorResponse.fromJson(jsonDecode(body));
      var errorMessage = errorResponse.message ??
          errorResponse.detail ??
          errorResponse.error?.first.toString() ??
          '';
      dev.log(errorMessage);
      return ExceptionHandler.errorResponse(errorMessage);
    } else if (statusCode == 500) {
      dev.log(body);
      return const ExceptionHandler.errorResponse(
          'Something went wrong on server side please try again later.');
    } else if (statusCode == 404) {
      dev.log(body);
      return const ExceptionHandler.errorResponse(
          'Something went wrong on server side please try again later.');
    } else {
      var errorResponse = BaseErrorResponse.fromJson(jsonDecode(body));
      var errorMessage = errorResponse.message ??
          errorResponse.detail ??
          errorResponse.error?.first.toString() ??
          '';
      return ExceptionHandler.errorResponse(errorMessage);
    }
  }
}

class BaseErrorResponse {
  String? message;
  String? status;
  String? detail;
  List<dynamic>? error;

  BaseErrorResponse({this.message, this.status, this.detail, this.error});

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) =>
      BaseErrorResponse(
        message: json['message'],
        status: json['status'],
        detail: json['detail'],
        error: json['error'],
      );
}

class BaseResponseEntity {
  String? message;

  BaseResponseEntity({this.message});

  factory BaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      BaseResponseEntity(message: json['message']);
}
