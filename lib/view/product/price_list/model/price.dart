import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
@immutable
class Price extends Equatable {
  const Price({
    this.id,
    this.name,
    this.erpConnection,
    this.exchange,
    this.creationDate,
    this.lastUpdateDate,
    this.firstUpdateDate,
  });

  final int? id;
  final String? name;
  final bool? erpConnection;
  final String? exchange;
  final DateTime? creationDate;
  final DateTime? lastUpdateDate;
  final DateTime? firstUpdateDate;
  @override
  List<Object?> get props => [
        id,
        name,
        erpConnection,
        exchange,
        creationDate,
        lastUpdateDate,
        firstUpdateDate,
      ];
}
