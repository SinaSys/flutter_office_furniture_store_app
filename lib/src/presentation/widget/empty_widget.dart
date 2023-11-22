import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_asset.dart';
import 'package:office_furniture_store/core/app_style.dart';

enum EmptyWidgetType { cart, favorite }

class EmptyWidget extends StatelessWidget {
  final EmptyWidgetType type;
  final String title;

  const EmptyWidget({
    super.key,
    this.type = EmptyWidgetType.cart,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type == EmptyWidgetType.cart
              ? Expanded(child: Image.asset(AppAsset.emptyCart))
              : Image.asset(AppAsset.emptyFavorite),
          const SizedBox(height: 10),
          Text(title, style: h2Style)
        ],
      ),
    );
  }
}
