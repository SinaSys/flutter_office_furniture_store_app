import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:office_furniture_store/src/data/model/furniture_color.dart';

class ColorPicker extends HookWidget {
  final List<FurnitureColor> colors;

  const ColorPicker({
    super.key,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final colorUseState = useState<List<FurnitureColor>>(colors);

    final List<FurnitureColor> colorList = List.from(colorUseState.value);

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                colorList[index].isSelected
                    ? CircleAvatar(
                        backgroundColor:
                            colorList[index].color.withOpacity(0.5),
                        radius: 18,
                      )
                    : const IgnorePointer(),
                InkWell(
                  onTap: () {
                    for (var element in colorList) {
                      element.isSelected = false;
                    }
                    colorList[index].isSelected = true;
                    colorUseState.value = colorList;
                  },
                  child: CircleAvatar(
                    backgroundColor: colorList[index].color,
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
