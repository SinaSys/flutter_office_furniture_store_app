import 'package:flutter/material.dart';
import '../src/presentation/animation/fade_in_animation.dart';

extension StringExtension on String {
  String get addOverFlow {
    if (length < 15) {
      return this;
    } else {
      return "${substring(0, 15)}...";
    }
  }
}

extension WidgetExtension on Widget {
  Widget fadeAnimation(double delay) {
    return FadeInAnimation(delay: delay, child: this);
  }
}
