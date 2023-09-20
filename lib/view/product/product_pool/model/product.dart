import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
@immutable
class Product extends Equatable {
  const Product({
    this.id,
    this.name,
    this.barcode,
    this.brand,
    this.baseCode,
    this.state,
    this.ordersCount,
    this.totalSalescount,
    this.totalNumberOfProducts,
    this.productFeature,
    this.productTypes,
    this.suppliers,
    this.price,
    this.stock,
    this.description,
    this.images,
  });

  final int? id;
  final String? name;
  final String? barcode;
  final String? brand;
  final String? baseCode;
  final bool? state;
  final int? ordersCount;
  final int? totalSalescount;
  final int? totalNumberOfProducts;
  final List<ProductType>? productTypes;
  final ProductFeature? productFeature;
  final List<Supplier>? suppliers;
  final double? price;
  final int? stock;
  final String? description;
  final List<String>? images;
  @override
  List<Object?> get props => [id, name, price, stock, description, images];
}

@JsonSerializable()
@immutable
class ProductType extends Equatable {
  final int? id;
  final String? typeName;

  ProductType({this.id, this.typeName});

  @override
  List<Object?> get props => [id, typeName];
}

@JsonSerializable()
@immutable
class ProductFeature extends Equatable {
  ProductFeature({this.id, this.featureName});
  final int? id;
  final String? featureName;

  @override
  List<Object?> get props => [id, featureName];
}

@JsonSerializable()
@immutable
class Supplier extends Equatable {
  Supplier({this.id, this.companyName, this.companyCode});
  final int? id;
  final String? companyName;
  final String? companyCode;

  @override
  List<Object?> get props => [id, companyName, companyCode];
}
