import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final Exception error;
  const ErrorPage({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(error.toString()),
            TextButton(
              onPressed: () => context.goNamed('home'),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
