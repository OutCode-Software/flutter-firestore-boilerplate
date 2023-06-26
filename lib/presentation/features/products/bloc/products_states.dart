part of 'products_bloc.dart';

abstract class ProductStates {}

class Initial extends ProductStates {
  Initial();
}

class ShowProductsLoader extends ProductStates {
  LoadingStatus loadingStatus;

  ShowProductsLoader({required this.loadingStatus});
}

class ProductLoadSuccess extends ProductStates {
  List<ProductModel> products;

  ProductLoadSuccess({required this.products});
}

class ProductApiFailed extends ProductStates {
  String errorMessage;

  ProductApiFailed({required this.errorMessage});
}
