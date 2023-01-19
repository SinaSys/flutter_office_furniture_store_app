## office_furniture_store_app

<p align="center">
  <img src="https://img.shields.io/github/stars/SinaSys/flutter_office_furniture_store_app">
  <img src="https://img.shields.io/github/forks/SinaSys/flutter_office_furniture_store_app">
  <img src="https://img.shields.io/github/actions/workflow/status/SinaSys/flutter_office_furniture_store_app/main.yml?branch=master&label=CI%20&logo=github">
  <img src="https://img.shields.io/github/v/release/SinaSys/flutter_office_furniture_store_app?label=Release&logo=semantic-release">
  <img src="https://img.shields.io/github/last-commit/SinaSys/flutter_office_furniture_store_app?label=Last%20commit">
</p>


Office Furniture Store app is a design implementation
of [Office Furniture Store app](https://dribbble.com/shots/16394699-E-commerce-design-concept)
designed by [Jonatan](https://dribbble.com/Jhonatan_artist23)

![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/office_furniture_store_app.jpg?raw=true)


  <br/>

## GetX | Cubit | Bloc | Provider | Riverpod

#### • Access to different versions

|               Version               |                                                  Bloc                                                  |                                                   Cubit                                                   |                                                     Getx                                                      |                                                     Provider                                                      |                                                     Riverpod                                                     |
|:-----------------------------------:|:------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------:|
|               Branch                | [Source](https://github.com/SinaSys/flutter_office_furniture_store_app/tree/bloc) <br/> (bloc branch)️ | [Source](https://github.com/SinaSys/flutter_office_furniture_store_app/tree/cubit)   <br/> (cubit branch) | [Source](https://github.com/SinaSys/flutter_office_furniture_store_app/tree/master)     <br/> (master branch) | [Source](https://github.com/SinaSys/flutter_office_furniture_store_app/tree/provider)     <br/> (provider branch) | [Source](https://github.com/SinaSys/flutter_office_furniture_store_app/tree/riverpod)    <br/> (riverpod branch) |

  <br/>





## Screenshots

Preview                    |   List screen             |   Detail Screen           |  Cart Screen
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/preview.gif?raw=true)|![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/office_furniture_list_screen.png?raw=true)|![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/office_furniture_detail_screen.png?raw=true)|![](https://github.com/SinaSys/flutter_office_furniture_store_app/blob/master/screenshots/cart_screen.png?raw=true)

  <br/>

## 🚀 Features :

```
• Five different implementations
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
• State management with GetX | cubit | bloc | Provider | Riverpod
```


  <br/>

## Dependencies
|       Name      |    Cubit  <br/> version      |       Bloc <br/> version       |      GetX <br/> version     |    provider <br/> version   | riverpod <br/> version |
| :-------------: | :--------------------------: | :----------------------------: |  :------------------------: |  :------------------------: |:----------------------:| 
| [flutter_bloc](https://pub.dev/packages/flutter_bloc)  |  ✔️  |  ✔️  |    ✖️    |  ✖️    |  ✖️    | 
| [GetX](https://pub.dev/packages/get)  | ✖️  |  ✖️  | ✔️    | ✖️    | ✖️    | 
| [provider](https://pub.dev/packages/provider)  | ✖️  |  ✖️  | ✖️    | ✔️    | ✖️    | 
| [flutter_hooks](https://pub.dev/packages/flutter_hooks)  | ✔️  | ✔️  | ✖️ | ✔️    | ✖️    | 
| [hooks_riverpod](https://pub.dev/packages/hooks_riverpod)  | ✖️  | ✖️  | ✖️ | ✖️    |✔️    | 
| [equatable](https://pub.dev/packages/equatable)  | ✔️  | ✔️  | ✖️ | ✔️| ✔️    | 
| [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)  | ✔️  | ✔️ | ✔️ |✔️| ✔️    | 
| [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar)  | ✔️  | ✔️ |✔️ |✔️| ✔️    | 
| [simple_animations](https://pub.dev/packages/simple_animations)  | ✔️  | ✔️ |✔️ |✔️| ✔️    | 

  <br/>





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

## Directory Structure (Cubit version)

```
📂lib
 │───main.dart  
 │───📂core  
 │   │──app_asset.dart
 │   │──app_color.dart
 │   │──app_data.dart
 │   │──app_extension.dart
 │   │──app_style.dart
 │   └──app_extension.dart
 └───📂src
     │────📂data
     │    │───📂model
     │    │   |──bottom_navigation_item.dart
     │    │   |──furniture.dart
     │    │   └──furniture_color.dart
     │    │───📂repository
     │    │   └──repository.dart
     └────📂presentation
     │    │───📂screen
     │    │   |──cart_screen.dart
     │    │   |──favorite_screen.dart
     │    │   |──home_screen.dart
     │    │   |──intro_screen.dart
     │    │   |──office_furniture_detail_screen.dart
     │    │   |──office_furniture_list_screen.dart
     │    │   └──profile_screen.dart
     │    │───📂widget
     │    │   |──bottom_bar.dart
     │    │   |──cart_list_view.dart
     │    │   |──color_picker.dart
     │    │   |──counter_button.dart
     │    │   |──empty_widget.dart
     │    │   |──furniture_list_view.dart
     │    │   └──rating_bar.dart
     │    │───📂animation
     │    │   └──fade_in_animation.dart
     └────📂business_logic
          └───📂cubit
              └──📂furniture
                  |──furniture_cubit.dart
                  └──furniture_state.dart
```

## Directory Structure (Bloc version)

```
📂lib
 │───main.dart  
 │───📂core  
 │   │──app_asset.dart
 │   │──app_color.dart
 │   │──app_data.dart
 │   │──app_extension.dart
 │   │──app_style.dart
 │   └──app_extension.dart
 └───📂src
     │────📂data
     │    │───📂model
     │    │   |──bottom_navigation_item.dart
     │    │   |──furniture.dart
     │    │   └──furniture_color.dart
     │    │───📂repository
     │    │   └──repository.dart
     └────📂presentation
     │    │───📂screen
     │    │   |──cart_screen.dart
     │    │   |──favorite_screen.dart
     │    │   |──home_screen.dart
     │    │   |──intro_screen.dart
     │    │   |──office_furniture_detail_screen.dart
     │    │   |──office_furniture_list_screen.dart
     │    │   └──profile_screen.dart
     │    │───📂widget
     │    │   |──bottom_bar.dart
     │    │   |──cart_list_view.dart
     │    │   |──color_picker.dart
     │    │   |──counter_button.dart
     │    │   |──empty_widget.dart
     │    │   |──furniture_list_view.dart
     │    │   └──rating_bar.dart
     │    │───📂animation
     │    │   └──fade_in_animation.dart
     └────📂business_logic
          └───📂bloc
              └──📂furniture
                  |──furniture_bloc.dart
                  |──furniture_state.dart
                  └──furniture_event.dart
```

## Directory Structure (Riverpod version)

```
📂lib
 │───main.dart  
 │───📂core  
 │   │──app_asset.dart
 │   │──app_color.dart
 │   │──app_data.dart
 │   │──app_extension.dart
 │   │──app_style.dart
 │   └──app_extension.dart
 └───📂src
     │────📂data
     │    │───📂model
     │    │   |──bottom_navigation_item.dart
     │    │   |──furniture.dart
     │    │   └──furniture_color.dart
     │    │───📂repository
     │    │   └──repository.dart
     └────📂presentation
     │    │───📂screen
     │    │   |──cart_screen.dart
     │    │   |──favorite_screen.dart
     │    │   |──home_screen.dart
     │    │   |──intro_screen.dart
     │    │   |──office_furniture_detail_screen.dart
     │    │   |──office_furniture_list_screen.dart
     │    │   └──profile_screen.dart
     │    │───📂widget
     │    │   |──bottom_bar.dart
     │    │   |──cart_list_view.dart
     │    │   |──color_picker.dart
     │    │   |──counter_button.dart
     │    │   |──empty_widget.dart
     │    │   |──furniture_list_view.dart
     │    │   └──rating_bar.dart
     │    │───📂animation
     │    │   └──fade_in_animation.dart
     └────📂business_logic
          └───📂provider
              |──furniture_provider.dart
              └──furniture_state.dart
```

## Directory Structure (Provider version)

```
📂lib
 │───main.dart  
 │───📂core  
 │   │──app_asset.dart
 │   │──app_color.dart
 │   │──app_data.dart
 │   │──app_extension.dart
 │   │──app_style.dart
 │   └──app_extension.dart
 └───📂src
     │────📂data
     │    │───📂model
     │    │   |──bottom_navigation_item.dart
     │    │   |──furniture.dart
     │    │   └──furniture_color.dart
     │    │───📂repository
     │    │   └──repository.dart
     └────📂presentation
     │    │───📂screen
     │    │   |──cart_screen.dart
     │    │   |──favorite_screen.dart
     │    │   |──home_screen.dart
     │    │   |──intro_screen.dart
     │    │   |──office_furniture_detail_screen.dart
     │    │   |──office_furniture_list_screen.dart
     │    │   └──profile_screen.dart
     │    │───📂widget
     │    │   |──bottom_bar.dart
     │    │   |──cart_list_view.dart
     │    │   |──color_picker.dart
     │    │   |──counter_button.dart
     │    │   |──empty_widget.dart
     │    │   |──furniture_list_view.dart
     │    │   └──rating_bar.dart
     │    │───📂animation
     │    │   └──fade_in_animation.dart
     └────📂business_logic
          └───📂provider
              └──📂furniture
                  |──furniture_provider.dart
                  └──furniture_state.dart
```





## Created & Maintained By

[SinaSys](https://github.com/SinaSys)

  <br/>

##  Other flutter projects
 Project Name        |Stars        
:-------------------------|-------------------------
[Go rest app](https://github.com/SinaSys/flutter_go_rest_app)|![GitHub stars](https://img.shields.io/github/stars/SinaSys/flutter_go_rest_app?style=social)
[Japanese restaurant app](https://github.com/SinaSys/flutter_japanese_restaurant_app)| ![GitHub stars](https://img.shields.io/github/stars/SinaSys/flutter_japanese_restaurant_app?style=social)
|[Ecommerce app](https://github.com/SinaSys/flutter_ecommerce_app) |![GitHub stars](https://img.shields.io/github/stars/SinaSys/flutter_ecommerce_app?style=social)
