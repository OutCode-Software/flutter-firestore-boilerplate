import 'dart:async';

import 'package:bloc_demo/data/model/products/product_model.dart';
import 'package:bloc_demo/domain/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants.dart';

part 'products_events.dart';

part 'products_states.dart';

class ProductsBloc extends Bloc<ProductEvents, ProductStates> {
  late final ProductRepository _productRepository;

  ProductsBloc({
    required ProductRepository productRepository,
  }) : super(Initial()) {
    _productRepository = productRepository;
    on<GetAllProducts>(_mapGetAllProductsEventToStates);
    on<AddProduct>(_mapAddProductEventToStates);
    on<DeleteProduct>(_mapDeleteProductEventToStates);
  }

  FutureOr<void> _mapGetAllProductsEventToStates(
      GetAllProducts event, Emitter<ProductStates> emit) async {
    emit(ShowProductsLoader(loadingStatus: LoadingStatus.loading));
    var response = await _productRepository.getAllProducts();
    response.when(successState: (body) {
      emit(ShowProductsLoader(loadingStatus: LoadingStatus.success));
    }, errorState: (error) {
      emit(ShowProductsLoader(loadingStatus: LoadingStatus.failed));
    });
  }

  FutureOr<void> _mapAddProductEventToStates(
      AddProduct event, Emitter<ProductStates> emit) async {
    emit(ShowProductsLoader(loadingStatus: LoadingStatus.loading));
    var productModel = ProductModel(
      productId: '',
      userId: '',
      productName: event.productName,
      productDescription: event.productDescription,
      productPrice: event.productPrice,
      productImage: event.productImage,
      createdDate: '',
    );
    var response = await _productRepository.addProduct(productModel);
    response.when(successState: (body) {
      emit(ShowProductsLoader(loadingStatus: LoadingStatus.success));
    }, errorState: (error) {
      emit(ShowProductsLoader(loadingStatus: LoadingStatus.failed));
    });
  }

  FutureOr<void> _mapDeleteProductEventToStates(
      DeleteProduct event, Emitter<ProductStates> emit) async {
    emit(ShowProductsLoader(loadingStatus: LoadingStatus.loading));
    var response = await _productRepository.deleteProduct(event.productId);
    response.when(successState: (body) {
      emit(ShowProductsLoader(loadingStatus: LoadingStatus.success));
    }, errorState: (error) {
      emit(ShowProductsLoader(loadingStatus: LoadingStatus.failed));
    });
  }
}
