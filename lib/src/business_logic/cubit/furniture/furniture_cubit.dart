import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:office_furniture_store/src/data/model/furniture.dart';
import 'package:office_furniture_store/src/data/repository/repository.dart';
import 'package:office_furniture_store/src/business_logic/cubit/furniture/furniture_state.dart';

class FurnitureCubit extends Cubit<FurnitureState> {
  FurnitureCubit({required this.repository})
      : super(FurnitureState.initial(repository.getFurnitureList));

  final Repository repository;

  void increaseQuantity(Furniture furniture) {
    final List<Furniture> mainItems =
        state.mainItems.operator(furniture, Operation.increase);

    emit(FurnitureState(mainItems: mainItems));

    calculateTotalPrice();
  }

  void decreaseQuantity(Furniture furniture) {
    if (furniture.quantity > 1) {
      final List<Furniture> mainItems =
          state.mainItems.operator(furniture, Operation.decrease);

      emit(FurnitureState(mainItems: mainItems));
    } else {
      deleteFromCart(furniture);
    }
    calculateTotalPrice();
  }

  void addToCart(Furniture furniture) {
    final List<Furniture> cartItems =
        state.mainItems.operator(furniture, Operation.cart);

    emit(FurnitureState(mainItems: cartItems));

    calculateTotalPrice();
  }

  void deleteFromCart(Furniture furniture) {
    final List<Furniture> cartItems =
        state.mainItems.operator(furniture, Operation.delete);

    emit(FurnitureState(mainItems: cartItems));
  }

  void clearCart() {
    List<Furniture> mainItems = state.mainItems
        .map((element) => element.copyWith(cart: false))
        .toList();

    emit(FurnitureState(mainItems: mainItems));
  }

  void calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var element in state.mainItems) {
      if (element.cart) {
        totalPrice += element.quantity * element.price;
      }
    }

    emit(FurnitureState(mainItems: state.mainItems, totalPrice: totalPrice));
  }

  void addToFavorite(Furniture furniture) {
    final List<Furniture> favoriteItems =
        state.mainItems.operator(furniture, Operation.favorite);

    emit(
        FurnitureState(mainItems: favoriteItems, totalPrice: state.totalPrice));
  }

  List<Furniture> get getCartList => state.mainItems.where((element) => element.cart).toList();

  List<Furniture> get getFavoriteList =>
      state.mainItems.where((element) => element.isFavorite).toList();
}
