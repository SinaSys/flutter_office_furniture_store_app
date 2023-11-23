import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_style.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback? onTap;
  final String priceLabel;
  final String priceValue;
  final String buttonLabel;

  const BottomBar({
    super.key,
    this.onTap,
    this.priceLabel = "Price",
    required this.priceValue,
    this.buttonLabel = "Add to cart",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  priceLabel,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              FittedBox(child: Text(priceValue, style: h2Style))
            ],
          ),
          ElevatedButton(onPressed: onTap, child: Text(buttonLabel))
        ],
      ),
    );
  }
}
