import 'package:flutter/material.dart' hide Typography;
import 'package:yabzec_widgets/typography/typography.dart';

class Label extends StatelessWidget {
  const Label(this.data, {super.key, this.color});

  final String data;
  final Color? color;

  @override
  Widget build(BuildContext context) => Typography(
    data,
    style: Theme.of(context).textTheme.bodyLarge,
    color: color,
  );
}
