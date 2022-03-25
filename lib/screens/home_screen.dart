import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jokesapp/screens/joke_screen.dart';

import '../models/jokedata.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  getData(BuildContext context) async {
    var url = Uri.parse(
        'https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final jokeData = await jokeDataFromJson(response.body);
    print(jokeData.setup);
    print(jokeData.delivery);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => JokeScreen(
              setup: jokeData.setup,
              delivery: jokeData.delivery,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getData(context);
          },
          child: Text("Get data"),
        ),
      ),
    );
  }
}
