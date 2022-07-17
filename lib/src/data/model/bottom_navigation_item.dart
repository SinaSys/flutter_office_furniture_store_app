import 'package:flutter/material.dart';

@immutable
class BottomNavigationItem{
  final Icon icon;
  final String label;
  const BottomNavigationItem(this.icon, this.label);
}
