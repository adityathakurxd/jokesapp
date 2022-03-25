# Jokes Application
A Flutter app to show a new joke on screen built using a free API.

## Steps

Create a New Flutter Project

`flutter create jokesapp`

Modify the default code in `main.dart` as follows:

```dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
```

Create a new folder inside `lib` folder called `screens` and add a new file called `home_screen.dart` to it.

```dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
```

The `HomeScreen()` widget would have a simple `ElevatedButton()` in the centre with a text that says, 'Get data'.
We'll next get the free Jokes API to use.

URL of API: `https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit`



