import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
@immutable
class ProductAttribute extends Equatable {
  const ProductAttribute({
    this.id,
    this.name,
    this.attributeCode,
    this.listType,
    this.isRequired,
    this.isVisible,
    this.isSearchable,
    this.isVariableListenable,
    this.variant,
    this.supplier,
  });

  final int? id;
  final String? name;
  final String? attributeCode;
  final String? listType;
  final bool? isRequired;
  final bool? isVisible;
  final bool? isSearchable;
  final bool? isVariableListenable;
  final bool? variant;
  final String? supplier;
  @override
  List<Object?> get props =>
      [id, name, isVisible, isVisible, isSearchable, isVariableListenable];
}
