import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/src/controller/office_furniture_controller.dart';
import 'package:office_furniture_store/src/view/widget/empty_widget.dart';
import '../widget/bottom_bar.dart';
import '../widget/cart_list_view.dart';
import 'home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart",style: h2Style),
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomBar(
            priceLabel: "Total price",
            priceValue: "\$${controller.totalPrice.value}",
            buttonLabel: "Checkout",
            onTap: controller.totalPrice > 0 ? () {} : null,
          );
        },
      ),
      body:GetBuilder(
        builder: (OfficeFurnitureController controller){
          return controller.cartFurniture.isNotEmpty?
          const Padding(
            padding: EdgeInsets.all(15),
            child: CartListView(),
          ): const EmptyWidget(title: "Empty");
        },
      )
    );
  }
}
