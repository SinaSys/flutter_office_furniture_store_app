## office_furniture_store_app

<p align="center">
  <img src="https://img.shields.io/github/workflow/status/SinaSys/flutter_office_furniture_store_app/Analyze%20and%20Build?label=CI&logo=github">
  <img src="https://img.shields.io/github/v/release/SinaSys/flutter_office_furniture_store_app?label=Release&logo=semantic-release">
  <img src="https://img.shields.io/github/last-commit/SinaSys/flutter_office_furniture_store_app?label=Last%20commit">
</p>


Office Furniture Store app is a design implementation of [Office Furniture Store app](https://dribbble.com/shots/16394699-E-commerce-design-concept) designed by [Jonatan](https://dribbble.com/Jhonatan_artist23)

![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/office_furniture_store_app.jpg?raw=true)


  <br/>

## GetX | Cubit + flutter hooks
There are Two different implementations : 1 : Getx version , 2: Cubit + hooks version <br/>
• You can access Getx version from ```master branch``` [(here)](https://github.com/SinaSys/flutter_office_furniture_store_app/tree/master) <br/>
• You can access Cubit + flutter hooks version from ```cubit branch``` [(here)](https://github.com/SinaSys/flutter_office_furniture_store_app/tree/cubit)

 <br/>

## Screenshots

Preview                    |   List screen             |   Detail Screen           |  Cart Screen
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/preview.gif?raw=true)|![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/office_furniture_list_screen.png?raw=true)|![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/office_furniture_detail_screen.png?raw=true)|![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/cart_screen.png?raw=true)


  <br/>

## 🚀 Features :
```
• Two different implementations
• Display items on list item screen
• Display detail of each item on detail screen
• Hero animation for images when navigate fron list screen to detail screen
• Fade animation for list views
• Select quantity and color for each item
• Display item images using carousel slider
• Add desired item to favorite screen
• Add or delete item to cart
• Clear all itms from cart screen
• Automatically delete single item from cart by set its value to zero
• Real-time calculation of total price in the cart screen
• State management with GetX
```


## Directory Structure (GetX version)
```
📂lib
 │───main.dart  
 │───📂core  
 |   │──app_asset.dart
 |   │──app_color.dart
 |   │──app_data.dart
 |   │──app_extension.dart
 |   │──app_style.dart
 |   └──app_theme.dart
 └───📂src
     │────📂model
     │    │──bottom_navigation_item.dart
     |    │──furniture.dart
     |    └──furniture_color.dart
     └────📂view
     |    │───📂screen
     |    |   |──cart_screen.dart
     |    |   |──favorite_screen.dart
     |    |   |──home_screen.dart
     |    |   |──intro_screen.dart
     |    |   |──office_furniture_detail_screen.dart
     |    |   |──office_furniture_list_screen.dart
     |    |   └──profile_screen.dart
     |    │───📂widget
     |    |   |──bottom_bar.dart
     │    |   |──cart_list_view.dart
     │    |   |──color_picker.dart
     │    |   |──counter_button.dart
     │    |   |──empty_widget.dart
     │    |   |──furniture_list_view.dart
     │    |   |──fade_in_animation.dart
     |    |   └──rating_bar.dart
     └────📂controller
          └──office_furniture_controller.dart
```




## Directory Structure (Cubit + hooks version)
```
📂lib
 │───main.dart  
 │───📂core  
 |   │──app_asset.dart
 |   │──app_color.dart
 |   │──app_data.dart
 |   │──app_extension.dart
 |   │──app_style.dart
 |   └──app_theme.dart
 └───📂src
     │────📂model
     │    │──bottom_navigation_item.dart
     |    │──furniture.dart
     |    └──furniture_color.dart
     └────📂view
     |    │───📂screen
     |    |   |──cart_screen.dart
     |    |   |──favorite_screen.dart
     |    |   |──home_screen.dart
     |    |   |──intro_screen.dart
     |    |   |──office_furniture_detail_screen.dart
     |    |   |──office_furniture_list_screen.dart
     |    |   └──profile_screen.dart
     |    │───📂widget
     |    |   |──bottom_bar.dart
     │    |   |──cart_list_view.dart
     │    |   |──color_picker.dart
     │    |   |──counter_button.dart
     │    |   |──empty_widget.dart
     │    |   |──furniture_list_view.dart
     │    |   |──fade_in_animation.dart
     |    |   └──rating_bar.dart
     └────📂cubit
          |──furniture_cubit.dart
          └──furniture_state.dart
```



## Pull Requests
I welcome and encourage all pull requests. It usually will take me within 48-72 hours to respond to any issue or request.

  <br/>

## Dependencies
|       Name      |  Cubit + hooks <br/> version  |     GetX <br/> version     |
| :-------------: | :--------------------------: | :------------------------: |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc)  |  ✔️  |    ✖️    |
| [GetX](https://pub.dev/packages/get)  | ✖️  | ✔️    |
| [flutter_hooks](https://pub.dev/packages/flutter_hooks)  | ✔️  | ✖️ |
| [equatable](https://pub.dev/packages/equatable)  | ✔️  | ✖️ |
| [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)  | ✔️  | ✔️ |
| [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar)  | ✔️  | ✔️ |
| [simple_animations](https://pub.dev/packages/simple_animations)  | ✔️  | ✔️ |

  <br/>

## Created & Maintained By

[SinaSys](https://github.com/SinaSys)

  <br/>

## My other flutter projects
project        |
:-------------------------|
|[Japanese restaurant app](https://github.com/SinaSys/flutter_japanese_restaurant_app)
|[Ecommerce app](https://github.com/SinaSys/flutter_ecommerce_app)
