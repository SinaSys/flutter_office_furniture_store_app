import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/core/app_color.dart';
import 'package:office_furniture_store/src/data/model/furniture.dart';
import 'package:office_furniture_store/src/presentation/widget/bottom_bar.dart';
import 'package:office_furniture_store/src/presentation/widget/empty_widget.dart';
import 'package:office_furniture_store/src/presentation/widget/cart_list_view.dart';
import 'package:office_furniture_store/src/presentation/widget/counter_button.dart';
import 'package:office_furniture_store/src/business_logic/provider/furniture_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Furniture> cartList =
        context.watch<FurnitureProvider>().getCartList;

    final totalPrice = context.watch<FurnitureProvider>().state.totalPrice;

    PreferredSizeWidget appBar() {
      return AppBar(
        title: const Text("Cart", style: h2Style),
        actions: [
          IconButton(
            splashRadius: 20.0,
            onPressed: () {
              context.read<FurnitureProvider>().clearCart();
            },
            icon: const Icon(Icons.delete, color: AppColor.lightBlack),
          )
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomBar(
        priceLabel: "Total price",
        priceValue: "\$${totalPrice.toStringAsFixed(2)}",
        buttonLabel: "Checkout",
        onTap: totalPrice > 0 ? () {} : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: cartList.isNotEmpty
            ? CartListView(
                furnitureItems: cartList,
                counterButton: (furniture, index) {
                  return CounterButton(
                    orientation: Axis.vertical,
                    onIncrementSelected: () {
                      context
                          .read<FurnitureProvider>()
                          .increaseQuantity(cartList[index],);
                    },
                    onDecrementSelected: () {
                      context
                          .read<FurnitureProvider>()
                          .decreaseQuantity(cartList[index]);
                    },
                    label: furniture.quantity,
                  );
                },
              )
            : const EmptyWidget(title: "Empty cart"),
      ),
    );
  }
}
