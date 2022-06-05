import 'package:flutter/material.dart';
import '../../model/furniture_color.dart';

class ColorPicker extends StatefulWidget {
  final List<FurnitureColor> colors;

  const ColorPicker(this.colors, {Key? key}) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                widget.colors[index].isSelected
                    ? CircleAvatar(
                  backgroundColor:
                  widget.colors[index].color.withOpacity(0.5),
                  radius: 18,
                )
                    : const IgnorePointer(),
                InkWell(
                  onTap: () {
                    for (var element in widget.colors) {
                      element.isSelected = false;
                    }
                    setState(
                          () {
                            widget.colors[index].isSelected = true;
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: widget.colors[index].color,
                    radius: 15,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
