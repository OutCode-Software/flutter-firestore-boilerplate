import 'dart:convert';

import 'package:bloc_demo/data/firestore/products_store.dart';
import 'package:bloc_demo/data/model/products/product_model.dart';
import 'package:bloc_demo/data/model/response/basic_response.dart';

import '../../base/network/resource/resource.dart';
import '../../services/local_storage_service/local_storage_service.dart';

abstract class ProductRepository {
  Future<Resource<List<ProductModel>>> getAllProducts();

  Future<Resource<BasicResponse>> addProduct(ProductModel model);

  Future<Resource<BasicResponse>> deleteProduct(String productId);
}

class ProductRepositoryImpl extends ProductRepository {
  late final ProductsStore _productsStore;
  late final LocalStorageService _localStorageService;

  ProductRepositoryImpl(
      {required ProductsStore productsStore,
      required LocalStorageService localStorageService}) {
    _productsStore = productsStore;
    _localStorageService = localStorageService;
  }

  @override
  Future<Resource<BasicResponse>> addProduct(ProductModel model) async {
    var response = await _productsStore.addProduct(model);
    return response.when(successResponse: (body) {
      return Resource.successState(BasicResponse(message: body));
    }, errorResponse: (error) {
      return Resource.errorState(error);
    });
  }

  @override
  Future<Resource<BasicResponse>> deleteProduct(String productId) async {
    var response = await _productsStore.deleteProduct(productId);
    return response.when(successResponse: (body) {
      return Resource.successState(BasicResponse(message: body));
    }, errorResponse: (error) {
      return Resource.errorState(error);
    });
  }

  @override
  Future<Resource<List<ProductModel>>> getAllProducts() async {
    var response = await _productsStore
        .getAllProducts(_localStorageService.currentUserId!);
    return response.when(successResponse: (body) {
      return Resource.successState([ProductModel.fromJson(jsonDecode(body))]);
    }, errorResponse: (error) {
      return Resource.errorState(error);
    });
  }
}
