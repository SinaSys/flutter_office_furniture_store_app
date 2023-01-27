import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/src/view/screen/home_screen.dart';
import 'package:office_furniture_store/src/view/widget/empty_widget.dart';
import 'package:office_furniture_store/src/view/widget/furniture_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites", style: h2Style)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.favoriteFurnitureList.isNotEmpty
                  ? FurnitureListView(
                      isHorizontal: false,
                      furnitureList: controller.favoriteFurnitureList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite,
                      title: "Empty",
                    )
            ],
          ),
        ),
      ),
    );
  }
}
