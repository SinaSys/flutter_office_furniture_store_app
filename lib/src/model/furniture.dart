import 'package:office_furniture_store/src/model/furniture_color.dart';

class Furniture {
  String title;
  String description;
  double price;
  int quantity;
  double score;
  List<String> images;
  bool isFavorite;
  List<FurnitureColor> colors;

  Furniture({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.score,
    required this.images,
    this.isFavorite = false,
    required this.colors,
  });
}
