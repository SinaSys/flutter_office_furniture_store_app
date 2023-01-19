import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:office_furniture_store/src/data/model/furniture.dart';

@immutable
class FurnitureState extends Equatable {
  final List<Furniture> mainItems;
  final double totalPrice;

  const FurnitureState.initial(List<Furniture> mainItems)
      : this(mainItems: mainItems);

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
