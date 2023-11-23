import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:office_furniture_store/core/app_color.dart';

class StarRatingBar extends StatelessWidget {
  final double score;
  final double itemSize;

  const StarRatingBar({
    super.key,
    required this.score,
    this.itemSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemPadding: EdgeInsets.zero,
      itemSize: itemSize,
      initialRating: score,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glow: false,
      ignoreGestures: true,
      itemBuilder: (_, __) => const Icon(
        Icons.star,
        size: 2.0,
        color: AppColor.lightOrange,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
