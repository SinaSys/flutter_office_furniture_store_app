import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:office_furniture_store/src/view/widget/rating_bar.dart';
import '../../../core/app_style.dart';
import '../../model/furniture.dart';

class FurnitureListView extends StatelessWidget {
  final bool isHorizontal;
  final Function(Furniture furniture)? onTap;
  final List<Furniture> furnitureList;

  const FurnitureListView(
      {Key? key,
      this.isHorizontal = true,
       this.onTap,
      required this.furnitureList})
      : super(key: key);

  Widget _furnitureScore(Furniture furniture) {
    return Row(
      children: [
        StarRatingBar(score: furniture.score),
        const SizedBox(width: 10),
        Text(furniture.score.toString(), style: h4Style),
      ],
    );
  }

  Widget _furnitureImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(
        image,
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _listViewItem(Furniture furniture) {
    Widget widget;
    widget = isHorizontal == true
        ? Column(
            children: [
              _furnitureImage(furniture.images[0]),
              const SizedBox(height: 10),
              Text(furniture.title.addOverFlow, style: h4Style),
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
                      Text(furniture.title, style: h4Style),
                      const SizedBox(height: 5),
                      _furnitureScore(furniture),
                      const SizedBox(height: 5),
                      Text(
                        furniture.description,
                        style: h5Style.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              )
            ],
          );

    return GestureDetector(
      onTap: () => onTap?.call(furniture) ,
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
                return _listViewItem(furniture);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 15),
                );
              },
            ),
          )
        : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: furnitureList.length,
              itemBuilder: (_, index) {
                Furniture furniture = furnitureList.reversed.toList()[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 10),
                  child: _listViewItem(furniture),
                );
              },
            ),
          );
  }
}
