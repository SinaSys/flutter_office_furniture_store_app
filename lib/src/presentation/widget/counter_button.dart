import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_style.dart';

class CounterButton extends StatelessWidget {
  final Function() onIncrementSelected;
  final Function() onDecrementSelected;
  final int label;
  final Axis orientation;

  const CounterButton({
    super.key,
    required this.onIncrementSelected,
    required this.onDecrementSelected,
    required this.label,
    this.orientation = Axis.horizontal,
  });

  Widget button(Icon icon, Function() onTap) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(const Size(36, 36)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Colors.white,
      onPressed: () => onTap(),
      child: icon,
    );
  }

  List<Widget> body() {
    return [
      button(const Icon(Icons.remove), onDecrementSelected),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text("$label", style: h2Style.copyWith(fontSize: 15)),
      ),
      button(const Icon(Icons.add), onIncrementSelected),
    ];
  }

  @override
  Widget build(context) {
    return orientation == Axis.horizontal
        ? Row(mainAxisAlignment: MainAxisAlignment.end, children: body())
        : Column(children: body().reversed.toList());
  }
}
