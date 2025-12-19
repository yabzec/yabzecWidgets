import 'package:flutter/cupertino.dart';

abstract class Globals {
  static final EdgeInsets boxPadding = const EdgeInsets.all(20);
  static final BorderRadius boxBorderRadius = const BorderRadius.all(
    Radius.circular(20),
  );
  static final Duration animationDuration = const Duration(milliseconds: 600);
  static final Curve animationCurve = Curves.easeInOut;
}
