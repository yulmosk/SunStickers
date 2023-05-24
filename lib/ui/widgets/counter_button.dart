import 'package:flutter/material.dart';

import '../../ui_kit/_ui_kit.dart';

class CounterButton extends StatelessWidget {
  const CounterButton(
      {Key? key,
      required this.onIncrementTap,
      required this.onDecrementTap,
      required this.label,
      this.padding = 10.0,
      this.size = const Size(36, 36),
      this.orientation = Axis.horizontal})
      : super(key: key);

  final VoidCallback onIncrementTap;
  final VoidCallback onDecrementTap;
  final Widget label;
  final Axis orientation;
  final Size size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return orientation == Axis.horizontal
        ? Row(mainAxisAlignment: MainAxisAlignment.end, children: body())
        : Column(children: body().reversed.toList());
  }

  Widget button(Icon icon, VoidCallback onTap) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(size),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      fillColor: AppColor.accent,
      onPressed: () => onTap(),
      child: icon,
    );
  }

  List<Widget> body() {
    return [
      button(
        const Icon(Icons.remove, color: Colors.white),
        onDecrementTap,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: label,
      ),
      button(const Icon(Icons.add, color: Colors.white), onIncrementTap),
    ];
  }
}
