import 'package:flutter/material.dart';

class NotFoundRouteScreen extends StatelessWidget {
  const NotFoundRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found Route'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Not Found This Route'),
      ),
    );
  }
}
