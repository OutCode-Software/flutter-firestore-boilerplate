import 'dart:convert';

import 'package:bloc_demo/data/firestore/auth_service.dart';
import 'package:bloc_demo/data/model/response/basic_response.dart';
import 'package:bloc_demo/data/model/user_model.dart';
import 'package:bloc_demo/data/request/user_request_model.dart';
import 'package:bloc_demo/services/local_storage_service/local_storage_service.dart';

import '../../base/network/resource/resource.dart';

abstract class AuthRepository {
  Future<Resource<UserModel>> registerUser(UserRequestModel userRequestModel);

  Future<Resource<UserModel>> loginUser(String email, String password);

  Future<Resource<BasicResponse>> logout();

  String getCurrentUserId();

  Future<void> clearCache();
}

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required AuthService authService,
  }) {
    _localStorageService = localStorageService;
    _authService = authService;
  }

  late final AuthService _authService;
  late final LocalStorageService _localStorageService;

  @override
  Future<Resource<UserModel>> registerUser(
      UserRequestModel userRequestModel) async {
    var response = await _authService.firebaseRegister(userRequestModel);
    return response.when(successResponse: (body) async {
      var parsedUserModel = UserModel.fromJson(jsonDecode(body));
      var storeUser = await _authService.storeRegisteredUser(parsedUserModel);
      return storeUser.when(successResponse: (body) {
        return Resource.successState(parsedUserModel);
      }, errorResponse: (error) {
        return Resource.errorState(error);
      });
    }, errorResponse: (error) {
      return Resource.errorState(error);
    });
  }

  @override
  Future<Resource<UserModel>> loginUser(String email, String password) async {
    var response = await _authService.firebaseLogin(email, password);
    return response.when(successResponse: (body) {
      return Resource.successState(UserModel.fromJson(jsonDecode(body)));
    }, errorResponse: (error) {
      return Resource.errorState(error);
    });
  }

  @override
  String getCurrentUserId() {
    var userId = _authService.getCurrentUserId();
    _localStorageService.setCurrentUserId(userId);
    return userId;
  }

  @override
  Future<Resource<BasicResponse>> logout() async {
    var response = await _authService.firebaseLogout();
    return response.when(successResponse: (body) {
      return Resource.successState(BasicResponse(message: body));
    }, errorResponse: (error) {
      return Resource.errorState(error);
    });
  }

  @override
  Future<void> clearCache() async {
    await _localStorageService.clearCache();
  }
}
