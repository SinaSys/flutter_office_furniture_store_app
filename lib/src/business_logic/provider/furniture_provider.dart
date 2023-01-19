import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:office_furniture_store/src/data/model/furniture.dart';
import 'package:office_furniture_store/src/data/repository/repository.dart';
import 'package:office_furniture_store/src/business_logic/provider/furniture_state.dart';

final favoriteListProvider = Provider<List<Furniture>>(
  (ref) {
    final furnitureItems = ref.watch(furnitureStateNotifierProvider);

    List<Furniture> favoriteItems = furnitureItems.mainItems
        .where((element) => element.isFavorite)
        .toList();

    return favoriteItems;
  },
);

final cartListProvider = Provider<List<Furniture>>(
  (ref) {
    final furnitureItems = ref.watch(furnitureStateNotifierProvider);

    List<Furniture> cartList =
        furnitureItems.mainItems.where((element) => element.cart).toList();

    return cartList;
  },
);

final furnitureStateNotifierProvider =
    StateNotifierProvider<FurnitureProvider, FurnitureState>(
  (ref) {
    var repo = ref.read(repositoryProvider);
    return FurnitureProvider(repo);
  },
);

class FurnitureProvider extends StateNotifier<FurnitureState> {
  final Repository repository;

  FurnitureProvider(this.repository)
      : super(FurnitureState.initial(repository.getFurnitureList));

  increaseQuantity(Furniture furniture) {
    final List<Furniture> mainItems = state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(quantity: furniture.quantity + 1);
      }
      return element;
    }).toList();
    state = state.copyWith(mainItems: mainItems);
    calculateTotalPrice();
  }

  decreaseQuantity(Furniture furniture) {
    if (furniture.quantity > 1) {
      final List<Furniture> mainItems = state.mainItems.map((element) {
        if (element.id == furniture.id) {
          return element.copyWith(quantity: furniture.quantity - 1);
        }
        return element;
      }).toList();

      state = state.copyWith(mainItems: mainItems);
    } else {
      deleteFromCart(furniture);
    }
    calculateTotalPrice();
  }

  addToCart(Furniture furniture) {
    final List<Furniture> cartItems = state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(cart: true);
      }
      return element;
    }).toList();
    state = state.copyWith(mainItems: cartItems);
    calculateTotalPrice();
  }

  addToFavorite(Furniture furniture) {
    final List<Furniture> favoriteItems = state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(isFavorite: !furniture.isFavorite);
      }
      return element;
    }).toList();

    state =
        state.copyWith(mainItems: favoriteItems, totalPrice: state.totalPrice);
  }

  deleteFromCart(Furniture furniture) {
    final List<Furniture> cartItems = state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(cart: false);
      }
      return element;
    }).toList();

    state = state.copyWith(mainItems: cartItems);
  }

  clearCart() {
    List<Furniture> mainItems = state.mainItems
        .map((element) => element.copyWith(cart: false))
        .toList();

    state = state.copyWith(mainItems: mainItems);
    calculateTotalPrice();
  }

  calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var element in state.mainItems) {
      if (element.cart) {
        totalPrice += element.quantity * element.price;
      }
    }
    state = state.copyWith(mainItems: state.mainItems, totalPrice: totalPrice);
  }
}
