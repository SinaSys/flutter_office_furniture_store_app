import 'package:flutter/material.dart';
import '../src/view/widget/fade_in_animation.dart';

extension StringExtension on String {
  String get addOverFlow {
    if (length < 15) {
      return this;
    } else {
      return "${substring(0, 15)}...";
    }
  }
}


extension IterableExtension<T> on Iterable<T> {
  Iterable<T> distinctBy(Object Function(T e) getCompareValue) {
    var result = <T>[];
    forEach(
      (element) {
        if (!result
            .any((x) => getCompareValue(x) == getCompareValue(element))) {
          result.add(element);
        }
      },
    );
    return result;
  }
}

extension WidgetExtension on Widget{
  Widget fadeAnimation(double delay){
    return FadeInAnimation(delay: delay, child: this);
  }
}

