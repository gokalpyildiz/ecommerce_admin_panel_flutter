// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
@immutable
class JaliriPrice extends Equatable {
  const JaliriPrice({
    this.id,
    this.productName,
    this.barcode,
    this.baseCode,
    this.featureSet,
    this.currency,
    this.psf,
    this.price,
    this.tax,
    this.images,
  });

  final int? id;
  final String? barcode;
  final String? baseCode;
  final String? productName;
  final String? featureSet;
  final String? currency;
  final double? psf;
  final double? price;
  final double? tax;
  final List<String?>? images;

  @override
  List<Object?> get props => [
        id,
        barcode,
        productName,
        featureSet,
        currency,
        psf,
        price,
        tax,
        images,
      ];

  JaliriPrice copyWith({
    int? id,
    String? barcode,
    String? baseCode,
    String? productName,
    String? featureSet,
    String? currency,
    double? psf,
    double? price,
    double? tax,
    List<String?>? images,
  }) {
    return JaliriPrice(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      baseCode: baseCode ?? this.baseCode,
      productName: productName ?? this.productName,
      featureSet: featureSet ?? this.featureSet,
      currency: currency ?? this.currency,
      psf: psf ?? this.psf,
      price: price ?? this.price,
      tax: tax ?? this.tax,
      images: images ?? this.images,
    );
  }
}
