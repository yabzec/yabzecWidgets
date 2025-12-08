import 'package:flutter/material.dart';

import 'placeholders/loading_placeholder.dart';

class FutureScaffold<T> extends StatefulWidget {
  const FutureScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    required this.future,
  });

  final Widget body;
  final Widget? floatingActionButton;
  final Future<T> Function() future;

  @override
  State<FutureScaffold> createState() => _FutureScaffoldState();
}

class _FutureScaffoldState<T> extends State<FutureScaffold> {
  T? awaitedFuture;

  @override
  void initState() {
    super.initState();
    widget.future.call().then((value) => awaitedFuture = value);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: awaitedFuture == null ? LoadingPlaceholder() : widget.body,
    floatingActionButton: widget.floatingActionButton,
  );
}
