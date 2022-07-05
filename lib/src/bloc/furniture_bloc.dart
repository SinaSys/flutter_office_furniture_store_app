import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import '../../core/app_data.dart';
import '../model/furniture.dart';

part 'furniture_event.dart';

part 'furniture_state.dart';

class FurnitureBloc extends Bloc<FurnitureEvent, FurnitureState> {
  FurnitureBloc() : super(FurnitureState.initial()) {
    on<IncreaseQuantityEvent>(_increaseQuantity);
    on<DecreaseQuantityEvent>(_decreaseQuantity);
    on<AddToCartEvent>(_addToCart);
    on<AddToFavoriteEvent>(_addToFavorite);
    on<ClearCartEvent>(_clearCart);
  }

  void _increaseQuantity(
      IncreaseQuantityEvent event, Emitter<FurnitureState> emit) {
    final List<Furniture> items =
        state.mainItems.operator(event.furniture, Operation.increase);

    emit(FurnitureState(mainItems: items));
    _getTotalPrice(emit);
  }

  void _decreaseQuantity(
      DecreaseQuantityEvent event, Emitter<FurnitureState> emit) {
    List<Furniture> items = [];
    if (event.furniture.quantity > 1) {
      items = state.mainItems.operator(event.furniture, Operation.decrease);
    } else {
      items = state.mainItems.operator(event.furniture, Operation.delete);
    }

    emit(FurnitureState(mainItems: items));
    _getTotalPrice(emit);
  }

  void _addToCart(AddToCartEvent event, Emitter<FurnitureState> emit) {
    final List<Furniture> items = state.mainItems.map((element) {
      if (event.furniture.id == element.id) {
        return event.furniture.copyWith(
            cart: true, quantity: state.mainItems[event.index].quantity);
      }
      return element;
    }).toList();

    emit(FurnitureState(mainItems: items));
    _getTotalPrice(emit);
  }

  void _addToFavorite(AddToFavoriteEvent event, Emitter<FurnitureState> emit) {
    final List<Furniture> items =
        state.mainItems.operator(event.furniture, Operation.favorite);
    emit(FurnitureState(mainItems: items));
    _getTotalPrice(emit);
  }

  void _clearCart(ClearCartEvent event, Emitter<FurnitureState> emit) {
    final List<Furniture> items = state.mainItems
        .map((element) => element.copyWith(cart: false))
        .toList();

    emit(FurnitureState(mainItems: items));
  }

  void _getTotalPrice(Emitter<FurnitureState> emit) {
    double totalPrice = 0.0;

    for (var element in state.mainItems) {
      if (element.cart) {
        totalPrice += element.quantity * element.price;
      }
    }
    emit(FurnitureState(mainItems: state.mainItems, totalPrice: totalPrice));
  }

  get getCartList => state.mainItems.where((element) => element.cart).toList();

  get getFavoriteList =>
      state.mainItems.where((element) => element.isFavorite).toList();
}
