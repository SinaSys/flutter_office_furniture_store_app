import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/src/controller/office_furniture_controller.dart';
import 'package:office_furniture_store/src/view/widget/counter_button.dart';
import '../../model/furniture.dart';
import '../screen/home_screen.dart';

class CartListView extends StatelessWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.cartFurniture.length,
      itemBuilder: (_, index) {
        Furniture furniture = controller.cartFurniture[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  furniture.images[0],
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(furniture.title.addOverFlow, style: h4Style),
                  const SizedBox(height: 5),
                  Text(furniture.price, style: h2Style),
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
              Expanded(
                child: GetBuilder(
                  builder: (OfficeFurnitureController controller) {
                    return CounterButton(
                        orientation: Axis.vertical,
                        onIncrementSelected: () =>
                            controller.increaseItem(furniture),
                        onDecrementSelected: () =>
                            controller.decreaseItem(furniture),
                        label: furniture.quantity);
                  },
                ),
              )
            ],
          ).fadeAnimation(0.4*index),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(padding: EdgeInsets.only(bottom: 15));
      },
    );
  }
}
