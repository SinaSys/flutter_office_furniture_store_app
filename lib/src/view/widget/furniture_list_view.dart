import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:office_furniture_store/src/model/furniture.dart';
import 'package:office_furniture_store/src/view/widget/rating_bar.dart';

class FurnitureListView extends StatelessWidget {
  final bool isHorizontal;
  final Function(Furniture furniture)? onTap;
  final List<Furniture> furnitureList;

  const FurnitureListView({
    Key? key,
    this.isHorizontal = true,
    this.onTap,
    required this.furnitureList,
  }) : super(key: key);

  Widget _furnitureScore(Furniture furniture) {
    return Row(
      children: [
        StarRatingBar(score: furniture.score),
        const SizedBox(width: 10),
        Text(furniture.score.toString(), style: h4Style),
      ],
    ).fadeAnimation(1.0);
  }

  Widget _furnitureImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(image, width: 150, height: 150),
    ).fadeAnimation(0.4);
  }

  Widget _listViewItem(Furniture furniture, int index) {
    Widget widget;
    widget = isHorizontal == true
        ? Column(
            children: [
              Hero(tag: index, child: _furnitureImage(furniture.images[0])),
              const SizedBox(height: 10),
              Text(furniture.title.addOverFlow, style: h4Style)
                  .fadeAnimation(0.8),
              _furnitureScore(furniture),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _furnitureImage(furniture.images[0]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(furniture.title, style: h4Style).fadeAnimation(0.8),
                      const SizedBox(height: 5),
                      _furnitureScore(furniture),
                      const SizedBox(height: 5),
                      Text(
                        furniture.description,
                        style: h5Style.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ).fadeAnimation(1.4)
                    ],
                  ),
                ),
              )
            ],
          );

    return GestureDetector(
      onTap: () => onTap?.call(furniture),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isHorizontal == true
        ? SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: furnitureList.length,
              itemBuilder: (_, index) {
                Furniture furniture = furnitureList[index];
                return _listViewItem(furniture, index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(padding: EdgeInsets.only(left: 15));
              },
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const ClampingScrollPhysics(),
            itemCount: furnitureList.length,
            itemBuilder: (_, index) {
              Furniture furniture = furnitureList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: _listViewItem(furniture, index),
              );
            },
          );
  }
}
