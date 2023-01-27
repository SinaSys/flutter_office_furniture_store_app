import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:office_furniture_store/core/app_color.dart';
import 'package:office_furniture_store/core/app_data.dart';
import 'package:office_furniture_store/src/presentation/screen/cart_screen.dart';
import 'package:office_furniture_store/src/presentation/screen/favorite_screen.dart';
import 'package:office_furniture_store/src/presentation/screen/office_furniture_list_screen.dart';
import 'package:office_furniture_store/src/presentation/screen/profile_screen.dart';

class HomeScreen extends HookWidget {
  final List<Widget> screens = const [
    OfficeFurnitureListScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex.value,
        showUnselectedLabels: true,
        onTap: (int index) {
          selectedIndex.value = index;
        },
        fixedColor: AppColor.lightBlack,
        items: AppData.bottomNavigationItems
            .map(
              (element) => BottomNavigationBarItem(
                  icon: element.icon, label: element.label),
            )
            .toList(),
      ),
      body: screens[selectedIndex.value],
    );
  }
}
