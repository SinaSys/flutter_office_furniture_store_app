import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:office_furniture_store/core/app_color.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/src/business_logic/provider/furniture_provider.dart';
import '../../data/model/furniture.dart';
import '../widget/bottom_bar.dart';
import '../widget/cart_list_view.dart';
import '../widget/counter_button.dart';
import '../widget/empty_widget.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Furniture> cartList = ref.watch(cartListProvider);

    final totalPrice = ref.watch(furnitureStateNotifierProvider).totalPrice;

    PreferredSizeWidget _appBar() {
      return AppBar(
        title: const Text("Cart", style: h2Style),
        actions: [
          IconButton(
            splashRadius: 20.0,
            onPressed: () {
              ref.read(furnitureStateNotifierProvider.notifier).clearCart();
            },
            icon: const Icon(
              Icons.delete,
              color: AppColor.lightBlack,
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: _appBar(),
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
                        ref
                            .read(furnitureStateNotifierProvider.notifier)
                            .increaseQuantity(cartList[index]);
                      },
                      onDecrementSelected: () {
                        ref
                            .read(furnitureStateNotifierProvider.notifier)
                            .decreaseQuantity(cartList[index]);
                      },
                      label: furniture.quantity);
                },
              )
            : const EmptyWidget(title: "Empty cart"),
      ),
    );
  }
}
