import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_color.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:office_furniture_store/src/model/furniture.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:office_furniture_store/src/view/widget/rating_bar.dart';
import 'package:office_furniture_store/src/view/widget/color_picker.dart';
import 'package:office_furniture_store/src/view/screen/home_screen.dart';
import 'package:office_furniture_store/src/view/widget/counter_button.dart';
import 'package:office_furniture_store/src/controller/office_furniture_controller.dart';

class OfficeFurnitureDetailScreen extends StatelessWidget {
  final Furniture furniture;

  const OfficeFurnitureDetailScreen({Key? key, required this.furniture})
      : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      actions: [
        GetBuilder(
          builder: (OfficeFurnitureController controller) {
            return IconButton(
              splashRadius: 18.0,
              onPressed: () => controller.isFavoriteFurniture(furniture),
              icon: furniture.isFavorite
                  ? const Icon(Icons.bookmark, color: Colors.black)
                  : const Icon(Icons.bookmark_border, color: Colors.black),
            );
          },
        )
      ],
      leading: IconButton(
        icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
        onPressed: () {
          controller.currentPageViewItemIndicator.value = 0;
          Navigator.pop(context);
        },
      ),
      title: Text(furniture.title, style: h2Style),
    );
  }

  Widget bottomBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FittedBox(
                child: Text(
                  'Price',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              FittedBox(child: Text("\$${furniture.price}", style: h2Style))
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.lightBlack,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => controller.addToCart(furniture),
            child: const Text("Add to cart"),
          )
        ],
      ),
    ).fadeAnimation(1.3);
  }

  Widget furnitureImageSlider(double height) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      height: height * 0.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: controller.switchBetweenPageViewItems,
            itemCount: furniture.images.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: index,
                    child: Image.asset(
                      furniture.images[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Obx(
              () {
                return SmoothIndicator(
                  effect: const WormEffect(
                    dotColor: Colors.white38,
                    activeDotColor: Colors.white,
                  ),
                  offset:
                      controller.currentPageViewItemIndicator.value.toDouble(),
                  count: furniture.images.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        controller.currentPageViewItemIndicator.value = 0;
        return Future.value(true);
      },
      child: Scaffold(
        bottomNavigationBar: bottomBar(),
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                furnitureImageSlider(height),
                Center(
                  child: StarRatingBar(
                    score: furniture.score,
                    itemSize: 25,
                  ).fadeAnimation(0.4),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: const Text(
                    "Synopsis",
                    style: h2Style,
                    textAlign: TextAlign.end,
                  ).fadeAnimation(0.6),
                ),
                Text(
                  furniture.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black45),
                ).fadeAnimation(0.8),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Color :",
                      style: h2Style,
                      textAlign: TextAlign.end,
                    ),
                    Expanded(child: ColorPicker(furniture.colors)),
                    Expanded(child: GetBuilder(
                      builder: (OfficeFurnitureController controller) {
                        return CounterButton(
                          label: furniture.quantity,
                          onIncrementSelected: () =>
                              controller.increaseItem(furniture),
                          onDecrementSelected: () =>
                              controller.decreaseItem(furniture),
                        );
                      },
                    ))
                  ],
                ).fadeAnimation(1.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
