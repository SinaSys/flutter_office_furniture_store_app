import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../core/app_data.dart';
import '../model/furniture.dart';

@immutable
class FurnitureState extends Equatable {
  final List<Furniture> mainItems;
  final double totalPrice;

  factory FurnitureState.initial() {
    return FurnitureState(mainItems: AppData.furnitureList);
  }

  @override
  List<Object?> get props => [mainItems, totalPrice];

  const FurnitureState({
    required this.mainItems,
    this.totalPrice = 0.0,
  });

  FurnitureState copyWith({
    List<Furniture>? mainItems,
    double? totalPrice,
  }) {
    return FurnitureState(
      mainItems: mainItems ?? this.mainItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
