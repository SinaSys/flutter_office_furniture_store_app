import 'package:flutter/foundation.dart' show ChangeNotifier;
import '../../data/model/furniture.dart';
import '../../data/repository/repository.dart';
import 'furniture_state.dart';

class FurnitureProvider with ChangeNotifier {
  FurnitureState _state;

  final Repository repository;

  FurnitureProvider({required this.repository})
      : _state = FurnitureState.initial(repository.getFurnitureList);

  FurnitureState get state => _state;

  increaseQuantity(Furniture furniture) {
    final List<Furniture> mainItems = _state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(quantity: furniture.quantity + 1);
      }
      return element;
    }).toList();
    _state = _state.copyWith(mainItems: mainItems);
    calculateTotalPrice();
    notifyListeners();
  }

  decreaseQuantity(Furniture furniture) {
    if (furniture.quantity > 1) {
      final List<Furniture> mainItems = _state.mainItems.map((element) {
        if (element.id == furniture.id) {
          return element.copyWith(quantity: furniture.quantity - 1);
        }
        return element;
      }).toList();

      _state = _state.copyWith(mainItems: mainItems);
    } else {
      deleteFromCart(furniture);
    }
    calculateTotalPrice();
    notifyListeners();
  }

  addToCart(Furniture furniture) {
    final List<Furniture> cartItems = _state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(cart: true);
      }
      return element;
    }).toList();
    _state = _state.copyWith(mainItems: cartItems);
    calculateTotalPrice();
  }

  addToFavorite(Furniture furniture) {
    final List<Furniture> favoriteItems = _state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(isFavorite: !furniture.isFavorite);
      }
      return element;
    }).toList();

    _state = _state.copyWith(
        mainItems: favoriteItems, totalPrice: _state.totalPrice);
    notifyListeners();
  }

  deleteFromCart(Furniture furniture) {
    final List<Furniture> cartItems = _state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(cart: false);
      }
      return element;
    }).toList();

    _state = _state.copyWith(mainItems: cartItems);
    notifyListeners();
  }

  clearCart() {
    List<Furniture> mainItems = _state.mainItems
        .map((element) => element.copyWith(cart: false))
        .toList();

    _state = _state.copyWith(mainItems: mainItems);
    calculateTotalPrice();
    notifyListeners();
  }

  calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var element in _state.mainItems) {
      if (element.cart) {
        totalPrice += element.quantity * element.price;
      }
    }
    _state =
        _state.copyWith(mainItems: _state.mainItems, totalPrice: totalPrice);
  }

  get getCartList => _state.mainItems.where((element) => element.cart).toList();

  get getFavoriteList =>
      _state.mainItems.where((element) => element.isFavorite).toList();
}
