import 'dart:convert';

import 'package:bloc_demo/data/constants.dart';
import 'package:bloc_demo/data/model/user_model.dart';
import 'package:bloc_demo/data/request/user_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../base/network/exception/exception_handler.dart';

abstract class AuthService {
  Future<ExceptionHandler> firebaseRegister(UserRequestModel userRequestModel);

  Future<ExceptionHandler> firebaseLogin(String email, String password);

  Future<ExceptionHandler> storeRegisteredUser(UserModel userModel);

  String getCurrentUserId();

  Future<ExceptionHandler> firebaseLogout();
}

class AuthServiceImpl extends AuthService {
  AuthServiceImpl();

  @override
  Future<ExceptionHandler> firebaseRegister(
      UserRequestModel userRequestModel) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userRequestModel.email, password: userRequestModel.password)
        .then((userCredential) {
      var user = userCredential.user!;
      var parsedModel = UserModel(
          id: user.uid,
          firstName: userRequestModel.firstName,
          lastName: userRequestModel.lastName,
          email: userRequestModel.email);
      return ExceptionHandler.successResponse(jsonEncode(parsedModel.toJson()));
    }).onError((error, message) {
      return ExceptionHandler.errorResponse((error as FirebaseAuthException).message ?? 'Unknown Error');
    });
  }

  @override
  Future<ExceptionHandler> firebaseLogin(String email, String password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userCredential) {
      var user = userCredential.user!;
      var parsedModel = UserModel(
        id: user.uid,
      );
      return ExceptionHandler.successResponse(jsonEncode(parsedModel.toJson()));
    }).onError((error, message) {
      return ExceptionHandler.errorResponse((error as FirebaseAuthException).message ?? 'Unknown Error');
    });
  }

  @override
  String getCurrentUserId() {
    var currentUser = FirebaseAuth.instance.currentUser;
    var currentUserId = "";
    if (currentUser != null) {
      currentUserId = currentUser.uid;
    }
    return currentUserId;
  }

  @override
  Future<ExceptionHandler> storeRegisteredUser(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseConstants.users)
        .doc(userModel.id)
        .set(userModel.toJson(), SetOptions(merge: true))
        .then((_) {
      return const ExceptionHandler.successResponse('Registered Successful');
    }).onError((error, message) {
      return ExceptionHandler.errorResponse((error as FirebaseException).message ?? 'Unknown error');
    });
  }

  @override
  Future<ExceptionHandler> firebaseLogout() async {
    return await FirebaseAuth.instance.signOut().then((_) {
      return const ExceptionHandler.successResponse('Logout Successful');
    }).onError((error, message) {
      return ExceptionHandler.errorResponse((error as FirebaseAuthException).message ?? 'Unknown Error');
    });
  }
}
