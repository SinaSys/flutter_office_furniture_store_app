import 'package:get/get.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:office_furniture_store/src/model/furniture.dart';

class OfficeFurnitureController extends GetxController {
  RxInt currentBottomNavItemIndex = 0.obs;
  RxInt currentPageViewItemIndicator = 0.obs;
  RxList<Furniture> cartFurniture = <Furniture>[].obs;
  RxList<Furniture> favoriteFurnitureList = <Furniture>[].obs;
  RxDouble totalPrice = 0.0.obs;

  switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  switchBetweenPageViewItems(int currentIndex) {
    currentPageViewItemIndicator.value = currentIndex;
  }

  isFavoriteFurniture(Furniture furniture) {
    furniture.isFavorite = !furniture.isFavorite;
    update();
    if (furniture.isFavorite) {
      favoriteFurnitureList.add(furniture);
    }
    if (!furniture.isFavorite) {
      favoriteFurnitureList.removeWhere((element) => element == furniture);
    }
  }

  void increaseItem(Furniture furniture) {
    furniture.quantity++;
    update();
    calculateTotalPrice();
  }

  void decreaseItem(Furniture furniture) {
    furniture.quantity = furniture.quantity-- < 1 ? 0 : furniture.quantity--;
    calculateTotalPrice();
    update();
    if (furniture.quantity < 1) {
      cartFurniture.removeWhere((element) => element == furniture);
    }
  }

  addToCart(Furniture furniture) {
    if (furniture.quantity > 0) {
      cartFurniture.add(furniture);
      cartFurniture.assignAll(cartFurniture.distinctBy((item) => item));
      calculateTotalPrice();
    }
  }

  calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartFurniture) {
      totalPrice.value += element.quantity * element.price;
    }
  }

  void clearCart() {
    cartFurniture.clear();
    totalPrice.value = 0;
    update();
  }
}
