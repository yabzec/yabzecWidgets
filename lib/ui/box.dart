import 'package:flutter/material.dart';
import 'package:yabzec_widgets/globals.dart';

class Box extends StatelessWidget {
  const Box({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Globals.boxPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: Globals.boxBorderRadius,
      ),
      child: child,
    );
  }
}
