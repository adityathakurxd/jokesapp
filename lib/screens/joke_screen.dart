import 'package:flutter/material.dart';

class JokeScreen extends StatelessWidget {
  String setup;
  String delivery;

  JokeScreen({Key? key, required this.setup, required this.delivery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(setup),
          Text(delivery),
        ],
      ),
    );
  }
}
