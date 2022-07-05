import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_furniture_store/src/bloc/furniture_bloc.dart';
import 'package:office_furniture_store/src/model/furniture.dart';
import 'package:office_furniture_store/src/view/widget/empty_widget.dart';
import 'package:office_furniture_store/src/view/widget/furniture_list_view.dart';
import '../../../core/app_style.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Furniture> favoriteList = context.watch<FurnitureBloc>().getFavoriteList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites",style: h2Style),
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
