import 'package:flutter/material.dart';
import 'package:office_furniture_store/src/data/model/furniture.dart';
import 'package:office_furniture_store/src/presentation/animation/fade_in_animation.dart';

extension StringExtension on String {
  String get addOverFlow {
    if (length < 15) {
      return this;
    } else {
      return "${substring(0, 15)}...";
    }
  }
}

extension WidgetExtension on Widget {
  Widget fadeAnimation(double delay) {
    return FadeInAnimation(delay: delay, child: this);
  }
}

extension IntegerExtension on int {
  get increase => this + 1;

  get decrease => this - 1;
}

enum Operation { increase, decrease, delete, favorite }

extension ListExtension on List<Furniture> {
  List<Furniture> operator(Furniture furniture, Operation operation) {
    switch (operation) {
      case Operation.increase:
        furniture = furniture.copyWith(quantity: furniture.quantity.increase);
        break;
      case Operation.decrease:
        furniture = furniture.copyWith(quantity: furniture.quantity.decrease);
        break;
      case Operation.delete:
        furniture = furniture.copyWith(cart: false);
        break;
      case Operation.favorite:
        furniture = furniture.copyWith(isFavorite: !furniture.isFavorite);
        break;
    }
    List<Furniture> list = map((element) {
      if (element.id == furniture.id) {
        return furniture;
      }
      return element;
    }).toList();

    return list;
  }
}
