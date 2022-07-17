import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_style.dart';
import '../../business_logic/bloc/furniture/furniture_bloc.dart';
import '../../data/model/furniture.dart';
import '../widget/empty_widget.dart';
import '../widget/furniture_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Furniture> favoriteList =
        context.watch<FurnitureBloc>().getFavoriteList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites", style: h2Style),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              favoriteList.isNotEmpty
                  ? FurnitureListView(
                      isHorizontal: false,
                      furnitureList: favoriteList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite, title: "Empty favorite")
            ],
          ),
        ),
      ),
    );
  }
}
