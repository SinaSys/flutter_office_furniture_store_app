import 'package:bloc/bloc.dart';
import 'package:office_furniture_store/src/model/furniture.dart';
import 'furniture_state.dart';

class FurnitureCubit extends Cubit<FurnitureState> {
  FurnitureCubit() : super(FurnitureState.initial());

  increaseQuantity(Furniture furniture) {
    final List<Furniture> mainItems = state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return furniture.copyWith(quantity: furniture.quantity + 1);
      }
      return element;
    }).toList();

    emit(FurnitureState(mainItems: mainItems));
    calculateTotalPrice();
  }

  decreaseQuantity(Furniture furniture) {
    if (furniture.quantity > 1) {
      final List<Furniture> mainItems = state.mainItems.map((element) {
        if (element.id == furniture.id) {
          return furniture.copyWith(quantity: furniture.quantity - 1);
        }
        return element;
      }).toList();


      emit(FurnitureState(mainItems: mainItems));
    } else {
      deleteFromCart(furniture);
    }
    calculateTotalPrice();
  }

  addToCart(Furniture furniture) {

    List<Furniture> cartItems = state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return furniture.copyWith(cart: true);
      }
      return element;
    }).toList();

    emit(FurnitureState(mainItems: cartItems));
    calculateTotalPrice();

  }

  deleteFromCart(Furniture furniture) {
    List<Furniture> cartItems = state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return furniture.copyWith(cart: false);
      }
      return element;
    }).toList();

    emit(FurnitureState(mainItems: cartItems));
  }

  clearCart() {
    List<Furniture> mainItems = state.mainItems
        .map((element) => element.copyWith(cart: false))
        .toList();

    emit(FurnitureState(mainItems: mainItems));
  }

  calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var element in state.mainItems) {
      if (element.cart) {
        totalPrice += element.quantity * element.price;
      }
    }

    emit(FurnitureState(mainItems: state.mainItems, totalPride: totalPrice));
  }

  addToFavorite(Furniture furniture) {
    List<Furniture> favoriteItems = state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return furniture.copyWith(isFavorite: !furniture.isFavorite);
      }
      return element;
    }).toList();

    emit(FurnitureState(mainItems: favoriteItems));
  }

  get getCartList => state.mainItems.where((element) => element.cart).toList();

  get getFavoriteList => state.mainItems.where((element) => element.isFavorite).toList();

}
