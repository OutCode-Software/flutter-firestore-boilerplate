part of 'products_bloc.dart';

abstract class ProductEvents {}

class GetAllProducts extends ProductEvents {
  GetAllProducts();
}

class AddProduct extends ProductEvents {
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productImage;

  AddProduct({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });
}

class DeleteProduct extends ProductEvents {
  String productId;

  DeleteProduct({
    required this.productId,
  });
}
