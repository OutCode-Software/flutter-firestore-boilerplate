// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @JsonKey(name: "product_id") String? productId,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_description") String? productDescription,
    @JsonKey(name: "product_price") String? productPrice,
    @JsonKey(name: "product_image") String? productImage,
    @JsonKey(name: "created_date") String? createdDate,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
