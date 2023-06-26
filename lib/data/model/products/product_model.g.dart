// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      productId: json['product_id'] as String?,
      userId: json['user_id'] as String?,
      productName: json['product_name'] as String?,
      productDescription: json['product_description'] as String?,
      productPrice: json['product_price'] as String?,
      productImage: json['product_image'] as String?,
      createdDate: json['created_date'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'user_id': instance.userId,
      'product_name': instance.productName,
      'product_description': instance.productDescription,
      'product_price': instance.productPrice,
      'product_image': instance.productImage,
      'created_date': instance.createdDate,
    };
