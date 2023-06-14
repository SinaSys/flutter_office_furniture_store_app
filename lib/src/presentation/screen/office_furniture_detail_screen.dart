import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/core/app_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:office_furniture_store/src/data/model/furniture.dart';
import 'package:office_furniture_store/src/presentation/widget/rating_bar.dart';
import 'package:office_furniture_store/src/presentation/widget/color_picker.dart';
import 'package:office_furniture_store/src/presentation/widget/counter_button.dart';
import 'package:office_furniture_store/src/business_logic/provider/furniture_provider.dart';

class OfficeFurnitureDetailScreen extends HookConsumerWidget {
  final Furniture furniture;
  final int index;

  const OfficeFurnitureDetailScreen(
      {Key? key, required this.furniture, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Furniture> items =
        ref.watch(furnitureStateNotifierProvider).mainItems;

    double height = MediaQuery.of(context).size.height;

    final selectedIndex = useState(0);

    Widget furnitureImageSlider(double height) {
      return Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        height: height * 0.5,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              onPageChanged: (int index) {
                selectedIndex.value = index;
              },
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
              child: AnimatedSmoothIndicator(
                effect: const WormEffect(
                  dotColor: Colors.white38,
                  activeDotColor: Colors.white,
                ),
                activeIndex: selectedIndex.value,
                count: furniture.images.length,
              ),
            ),
          ],
        ),
      );
    }

    PreferredSizeWidget appBar(BuildContext context) {
      return AppBar(
        actions: [
          IconButton(
            splashRadius: 18.0,
            onPressed: () => ref
                .read(furnitureStateNotifierProvider.notifier)
                .addToFavorite(items[index]),
            icon: items[index].isFavorite
                ? const Icon(Icons.bookmark, color: Colors.black)
                : const Icon(Icons.bookmark_border, color: Colors.black),
          )
        ],
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: () => Navigator.pop(context),
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
                        color: Colors.black45, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                FittedBox(
                  child: Text("${furniture.price}", style: h2Style),
                )
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.lightBlack,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                ref
                    .read(furnitureStateNotifierProvider.notifier)
                    .addToCart(items[index]);
              },
              child: const Text("Add to cart"),
            )
          ],
        ),
      ).fadeAnimation(1.3);
    }

    return WillPopScope(
      onWillPop: () async {
        return Future.value(true);
      },
      child: Scaffold(
        bottomNavigationBar: bottomBar(),
        appBar: appBar(context),
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
                    Expanded(child: ColorPicker(colors: furniture.colors)),
                    Expanded(
                      child: CounterButton(
                        label: items[index].quantity,
                        onIncrementSelected: () {
                          ref
                              .read(furnitureStateNotifierProvider.notifier)
                              .increaseQuantity(items[index]);
                        },
                        onDecrementSelected: () {
                          ref
                              .read(furnitureStateNotifierProvider.notifier)
                              .decreaseQuantity(items[index]);
                        },
                      ),
                    )
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
