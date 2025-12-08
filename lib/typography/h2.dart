import 'package:flutter/material.dart' hide Typography;
import 'package:yabzec_widgets/typography/typography.dart';

class H2 extends StatelessWidget {
  const H2(this.data, {super.key, this.color});

  final String data;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Typography(
      data,
      style: Theme.of(context).textTheme.titleMedium,
      color: color,
    );
  }
}
