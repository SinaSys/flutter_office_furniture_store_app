import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../screen/profile_screen.dart';
import '../../../core/app_data.dart';
import '../../../core/app_color.dart';

import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'office_furniture_list_screen.dart';

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
    final _selectedIndex = useState(0);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex.value,
        showUnselectedLabels: true,
        onTap: (int index) {
          _selectedIndex.value = index;
        },
        fixedColor: AppColor.lightBlack,
        items: AppData.bottomNavigationItems
            .map(
              (element) => BottomNavigationBarItem(
                  icon: element.icon, label: element.label),
            )
            .toList(),
      ),
      body: screens[_selectedIndex.value],
    );
  }
}
