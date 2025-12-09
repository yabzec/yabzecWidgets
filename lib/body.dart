import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.textBaseline,
    this.verticalDirection = VerticalDirection.down,
    this.spacing = 0.0,
    this.safeAreaTop = true,
    this.safeAreaRight = true,
    this.safeAreaBottom = true,
    this.safeAreaLeft = true,
    this.safeAreaMinimum = 10,
  });

  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final VerticalDirection verticalDirection;
  final double spacing;
  final bool safeAreaTop;
  final bool safeAreaRight;
  final bool safeAreaBottom;
  final bool safeAreaLeft;
  final double safeAreaMinimum;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: safeAreaTop,
        right: safeAreaRight,
        bottom: safeAreaBottom,
        left: safeAreaLeft,
        minimum: EdgeInsets.only(
          right: safeAreaRight ? safeAreaMinimum : 0,
          left: safeAreaLeft ? safeAreaMinimum : 0,
        ),
        child: Column(
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          textBaseline: textBaseline,
          verticalDirection: verticalDirection,
          spacing: spacing,
          children: children,
        ),
      ),
    );
  }
}
