import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/src/business_logic/provider/furniture_provider.dart';
import '../../data/model/furniture.dart';
import '../widget/furniture_list_view.dart';
import 'office_furniture_detail_screen.dart';

class OfficeFurnitureListScreen extends ConsumerWidget {
  const OfficeFurnitureListScreen({Key? key}) : super(key: key);

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Hello Sina", style: h2Style),
                  Text("Buy Your favorite desk", style: h3Style),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: const Icon(Icons.menu, color: Colors.grey),
            contentPadding: const EdgeInsets.all(20),
            border: textFieldStyle,
            focusedBorder: textFieldStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(furnitureStateNotifierProvider);

    Future<Widget?> _navigate(Furniture furniture, int index) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (furnitureContext, __, ___) =>
              OfficeFurnitureDetailScreen(furniture: furniture, index: index),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            _searchBar(),
            FurnitureListView(
              furnitureList: items.mainItems,
              onTap: _navigate,
            ),
            const Text("Popular", style: h2Style),
            FurnitureListView(
              furnitureList: items.mainItems,
              isHorizontal: false,
              onTap: _navigate,
            ),
          ],
        ),
      ),
    );
  }
}
