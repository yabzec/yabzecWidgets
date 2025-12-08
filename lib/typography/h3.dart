import 'package:flutter/material.dart';

class H3 extends StatelessWidget {
  const H3({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data, style: Theme.of(context).textTheme.titleSmall);
  }
}
