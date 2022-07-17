import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:office_furniture_store/core/app_style.dart';

import '../../data/model/furniture.dart';

class CartListView extends StatelessWidget {
  const CartListView(
      {Key? key, required this.counterButton, required this.furnitureItems})
      : super(key: key);

  final Widget Function(Furniture furniture, int index) counterButton;
  final List<Furniture> furnitureItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: furnitureItems.length,
      itemBuilder: (_, index) {
        Furniture furniture = furnitureItems[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    furniture.images[0],
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(furniture.title.addOverFlow, style: h4Style),
                  const SizedBox(height: 5),
                  Text("${furniture.price}", style: h2Style),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text("Color : ", style: h4Style),
                      CircleAvatar(
                        child: Container(
                          decoration: BoxDecoration(
                              color: furniture.colors
                                  .where((element) => element.isSelected)
                                  .toList()
                                  .first
                                  .color,
                              shape: BoxShape.circle),
                        ),
                        radius: 15,
                      )
                    ],
                  )
                ],
              ),
              // Spacer(),
              counterButton(furniture, index)
            ],
          ).fadeAnimation(0.4 * index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(padding: EdgeInsets.only(bottom: 15));
      },
    );
  }
}
