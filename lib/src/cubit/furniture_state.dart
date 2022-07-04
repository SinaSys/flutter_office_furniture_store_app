import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../core/app_data.dart';
import '../model/furniture.dart';

@immutable
class FurnitureState extends Equatable {
  final List<Furniture> mainItems;
  final double totalPride;

  factory FurnitureState.initial() {
    return FurnitureState(mainItems: AppData.furnitureList);
  }

  @override
  List<Object?> get props => [mainItems, totalPride];

  const FurnitureState({
    required this.mainItems,
    this.totalPride = 0.0,
  });

  FurnitureState copyWith({
    List<Furniture>? mainItems,
    double? totalPride,
  }) {
    return FurnitureState(
      mainItems: mainItems ?? this.mainItems,
      totalPride: totalPride ?? this.totalPride,
    );
  }
}
