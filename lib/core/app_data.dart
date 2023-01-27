import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_asset.dart';
import 'package:office_furniture_store/src/model/furniture.dart';
import 'package:office_furniture_store/src/model/furniture_color.dart';
import 'package:office_furniture_store/src/model/bottom_navigation_item.dart';

class AppData {
  const AppData._();

  static const dummyText =
      """Lorem Ipsum is simply dummy text of the printing and typesetting
       industry. Lorem Ipsum has been the industry's standard dummy text ever
        since the 1500s, when an unknown printer took a galley of type and
         scrambled it to make a type specimen book. It has survived not only 
         five centuries, but also the leap into electronic typesetting,
          remaining essentially unchanged. It was popularised in the 1960s with
           the release of Letraset sheets containing Lorem Ipsum passages,
            and more recently with desktop publishing software like Aldus
             PageMaker including versions of Lorem Ipsum.""";

  static List<Furniture> furnitureList = [
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Comhar All-in-One Standing Desk Glass',
      description: dummyText,
      price: 469.99,
      score: 3.5,
      images: [
        AppAsset.comharStandingDesk1,
        AppAsset.comharStandingDesk2,
        AppAsset.comharStandingDesk3,
        AppAsset.comharStandingDesk4,
        AppAsset.comharStandingDesk5,
        AppAsset.comharStandingDesk6,
        AppAsset.comharStandingDesk7,
      ],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF616161), isSelected: true),
        FurnitureColor(color: const Color(0xFF424242)),
      ],
    ),
    Furniture(
      isFavorite: false,
      quantity: 1,
      title: 'Ergonomic Gaming Desk with Mouse Pad',
      description: dummyText,
      price: 299.99,
      score: 4.5,
      images: [
        AppAsset.ergonomicGamingDesk1,
        AppAsset.ergonomicGamingDesk2,
        AppAsset.ergonomicGamingDesk3,
        AppAsset.ergonomicGamingDesk4,
        AppAsset.ergonomicGamingDesk5,
      ],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF5d4037), isSelected: true),
        FurnitureColor(color: const Color(0xFF424242)),
      ],
    ),
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Kana Pro Bamboo Standing Desk',
      description: dummyText,
      price: 659.99,
      score: 3.0,
      images: [
        AppAsset.kanaBambooDesk1,
        AppAsset.kanaBambooDesk2,
        AppAsset.kanaBambooDesk3,
        AppAsset.kanaBambooDesk4,
        AppAsset.kanaBambooDesk5,
        AppAsset.kanaBambooDesk6,
      ],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF616161), isSelected: true),
        FurnitureColor(color: const Color(0xFF212121)),
      ],
    ),
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Soutien Ergonomic Office Chair',
      description: dummyText,
      price: 349.99,
      score: 2.5,
      images: [
        AppAsset.soutienOfficeChair1,
        AppAsset.soutienOfficeChair2,
        AppAsset.soutienOfficeChair3,
        AppAsset.soutienOfficeChair4,
        AppAsset.soutienOfficeChair5,
        AppAsset.soutienOfficeChair6,
      ],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF455a64), isSelected: true),
        FurnitureColor(color: const Color(0xFF263238)),
      ],
    ),
    Furniture(
      quantity: 1,
      isFavorite: false,
      title: 'Theodore Standing Desk',
      description: dummyText,
      price: 499.99,
      score: 2.8,
      images: [
        AppAsset.theodoreStandingDesk1,
        AppAsset.theodoreStandingDesk2,
        AppAsset.theodoreStandingDesk3,
        AppAsset.theodoreStandingDesk4,
        AppAsset.theodoreStandingDesk5,
      ],
      colors: <FurnitureColor>[
        FurnitureColor(color: const Color(0xFF5d4037), isSelected: true),
        FurnitureColor(color: const Color(0xFF455a64)),
      ],
    ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    const BottomNavigationItem(Icon(Icons.home), 'Home'),
    const BottomNavigationItem(Icon(Icons.add_shopping_cart_rounded), 'Shopping cart'),
    const BottomNavigationItem(Icon(Icons.bookmark), 'Favorite'),
    const BottomNavigationItem(Icon(Icons.person), 'Profile')
  ];
}
