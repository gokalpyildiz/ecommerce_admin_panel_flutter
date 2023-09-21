import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
@immutable
class Stock extends Equatable {
  const Stock({
    this.id,
    this.stockAmount,
    this.maxStockQuantitiy,
    this.minStockQuantity,
    this.unitPrice,
    this.stockUpdateDate,
    this.stockState,
    this.images,
  });

  final int? id;
  final int? stockAmount;
  final int? maxStockQuantitiy;
  final int? minStockQuantity;
  final double? unitPrice;
  final DateTime? stockUpdateDate;
  final int? stockState;
  final List<String>? images;
  @override
  List<Object?> get props => [
        id,
        maxStockQuantitiy,
        minStockQuantity,
        unitPrice,
        stockUpdateDate,
        stockState,
        images,
      ];
}
