import 'package:flutter/material.dart';

class Typography extends StatelessWidget {
  const Typography(this.data, {super.key, this.color, this.style});

  final String data;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    TextStyle? style = this.style;

    if (color != null) {
      if (style == null) {
        throw Exception('Missing text style definition in theme');
      }
      style = style.copyWith(color: color);
    }

    return Text(data, style: style);
  }
}
