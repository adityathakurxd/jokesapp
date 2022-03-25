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

Now, to make an http get request in our Flutter app, we'll use the `http` package from [here](https://pub.dev/packages/http).
From the package documentaion, we create a `getData()` function as follow:

```dart
  getData() async {
    var url = Uri.parse(
        'https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

```

To use the JSON reponse in our Flutter app, we need to parse the response. For this we use [0this website](https://app.quicktype.io/). 
Create a new folder called `models` and add a file `jokeData.dart` to it.

The `jokeData.dart` would have the model code:
```dart
// To parse this JSON data, do
//
//     final jokeData = jokeDataFromJson(jsonString);

import 'dart:convert';

JokeData jokeDataFromJson(String str) => JokeData.fromJson(json.decode(str));

String jokeDataToJson(JokeData data) => json.encode(data.toJson());

class JokeData {
  JokeData({
    required this.error,
    required this.category,
    required this.type,
    required this.setup,
    required this.delivery,
    required this.flags,
    required this.id,
    required this.safe,
    required this.lang,
  });

  bool error;
  String category;
  String type;
  String setup;
  String delivery;
  Flags flags;
  int id;
  bool safe;
  String lang;

  factory JokeData.fromJson(Map<String, dynamic> json) => JokeData(
        error: json["error"],
        category: json["category"],
        type: json["type"],
        setup: json["setup"],
        delivery: json["delivery"],
        flags: Flags.fromJson(json["flags"]),
        id: json["id"],
        safe: json["safe"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "category": category,
        "type": type,
        "setup": setup,
        "delivery": delivery,
        "flags": flags.toJson(),
        "id": id,
        "safe": safe,
        "lang": lang,
      };
}

class Flags {
  Flags({
    required this.nsfw,
    required this.religious,
    required this.political,
    required this.racist,
    required this.sexist,
    required this.explicit,
  });

  bool nsfw;
  bool religious;
  bool political;
  bool racist;
  bool sexist;
  bool explicit;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        nsfw: json["nsfw"],
        religious: json["religious"],
        political: json["political"],
        racist: json["racist"],
        sexist: json["sexist"],
        explicit: json["explicit"],
      );

  Map<String, dynamic> toJson() => {
        "nsfw": nsfw,
        "religious": religious,
        "political": political,
        "racist": racist,
        "sexist": sexist,
        "explicit": explicit,
      };
}
```

Next, we modify our function `getData()` to use this model:

```dart
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
  ```
  
  Also, we create a new widget `JokeScreen()` and push to it:
  
  ```dart
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
  ```

The onPressed of the Elevated button would look like:
```dart
ElevatedButton(
          onPressed: () {
            getData(context);
          },
          child: Text("Get data"),
        ),
```
## Demo

![Flutter Demo - Google Chrome 3_25_2022 7_14_28 PM](https://user-images.githubusercontent.com/53579386/160133185-ef14569c-0fc6-43d4-978c-d68e82f8755d.png)
![Flutter Demo - Google Chrome 3_25_2022 7_14_28 PM](https://user-images.githubusercontent.com/53579386/160133254-259dbe74-5761-4ebf-b054-3f6ce117ed6f.png)


