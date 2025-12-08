import 'package:flutter/material.dart';

class P extends StatelessWidget {
  const P({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
