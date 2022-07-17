part of 'furniture_bloc.dart';

abstract class FurnitureEvent extends Equatable {
  const FurnitureEvent();

  @override
  List<Object?> get props => [];
}

class IncreaseQuantityEvent extends FurnitureEvent {
  final Furniture furniture;

  const IncreaseQuantityEvent({required this.furniture});

  @override
  List<Object?> get props => [furniture];
}

class DecreaseQuantityEvent extends FurnitureEvent {
  final Furniture furniture;

  const DecreaseQuantityEvent({required this.furniture});

  @override
  List<Object?> get props => [furniture];
}

class AddToCartEvent extends FurnitureEvent {
  final Furniture furniture;
  final int index;

  const AddToCartEvent({required this.furniture, required this.index});

  @override
  List<Object?> get props => [furniture, index];
}

class AddToFavoriteEvent extends FurnitureEvent {
  final Furniture furniture;

  const AddToFavoriteEvent({required this.furniture});

  @override
  List<Object?> get props => [furniture];
}

class ClearCartEvent extends FurnitureEvent {
  const ClearCartEvent();

  @override
  List<Object?> get props => [];
}
