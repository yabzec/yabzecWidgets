import 'package:flutter/material.dart';

import 'placeholders/loading_placeholder.dart';

class FutureScaffold<T> extends StatefulWidget {
  const FutureScaffold({
    super.key,
    required this.builder,
    this.floatingActionButton,
    required this.future,
  });

  final Widget? floatingActionButton;
  final Future<T> Function() future;
  final Widget Function(T) builder;

  @override
  State<FutureScaffold> createState() => _FutureScaffoldState();
}

class _FutureScaffoldState<T> extends State<FutureScaffold> {
  T? awaitedFuture;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    widget.future.call().then((value) {
      if (mounted) {
        setState(() {
          loading = false;
          awaitedFuture = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: loading ? LoadingPlaceholder() : widget.builder.call(awaitedFuture),
    floatingActionButton: widget.floatingActionButton,
  );
}
