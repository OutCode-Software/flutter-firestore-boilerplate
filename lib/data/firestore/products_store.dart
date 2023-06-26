import 'dart:convert';

import 'package:bloc_demo/data/constants.dart';
import 'package:bloc_demo/data/model/products/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../base/network/exception/exception_handler.dart';

abstract class ProductsStore {
  Future<ExceptionHandler> getAllProducts(String firebaseUser);

  Future<ExceptionHandler> addProduct(ProductModel model);

  Future<ExceptionHandler> deleteProduct(String productId);
}

class ProductsStoreImpl extends ProductsStore {
  ProductsStoreImpl();

  @override
  Future<ExceptionHandler> getAllProducts(String firebaseUser) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseConstants.products)
        .where(FirebaseConstants.userId, isEqualTo: firebaseUser)
        .get()
        .then((value) {
      final allProducts = value.docs.map((doc) {
        dynamic jsonDocument = doc.data();
        return ProductModel.fromJson(jsonDocument);
      }).toList();
      return ExceptionHandler.successResponse(jsonEncode(allProducts));
    }).catchError((error) {
      return ExceptionHandler.errorResponse(error);
    });
  }

  @override
  Future<ExceptionHandler> addProduct(ProductModel model) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseConstants.products)
        .doc()
        .set(model.toJson(), SetOptions(merge: true))
        .then((value) {
      return const ExceptionHandler.successResponse("Upload Success");
    }).catchError((error) {
      return ExceptionHandler.errorResponse(error);
    });
  }

  @override
  Future<ExceptionHandler> deleteProduct(String productId) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseConstants.products)
        .doc(productId)
        .delete()
        .then((value) {
      return const ExceptionHandler.successResponse("Product Deleted");
    }).catchError((error) {
      return ExceptionHandler.errorResponse(error);
    });
  }
}
