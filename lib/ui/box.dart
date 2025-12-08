import 'package:flutter/material.dart';
import 'package:yabzec_widgets/globals.dart';

class Box extends StatelessWidget {
  const Box({super.key, required this.child, this.height, this.width});

  final Widget child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Globals.boxPadding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: Globals.boxBorderRadius,
      ),
      child: child,
    );
  }
}
