import 'package:flutter/material.dart';
import 'package:yabzec_widgets/globals.dart';

class Box extends StatelessWidget {
  const Box({super.key, required this.child, this.height, this.width, this.padding});

  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? Globals.boxPadding,
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
