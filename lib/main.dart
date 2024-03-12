import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'dart:math';

void main() {
  print(myFunction(firstname: 'Oleksandr', date: 5, monthName: 'January'));
  runApp(const MyApp());
}

String myFunction(
    {String firstname = 'User',
      int? date,
    required String monthName}) {
  date ??= 1;
  return '$firstname was born on $monthName $date.';
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late User user;
  late User user2;
  late User user3;
  late int birthYear;
  late String randomString;

  @override
  void initState() {
    super.initState();

    user = User('Oleksandr Khvostov', 23);
    birthYear = 2001;
    user2 = User.fromBirthYear(birthYear);
    randomString = '';
    user3 = User.withAdultAge('Oleg');
    var names = <String>{user.name, user2.name, user3.name};
    print('Created users names: ' + names.join(', '));
    print(user3.log('Hi, my name is ' + user3.name + '.' + ' I am adult.'));
    Function usersEatApple = user3.eatApple();
    usersEatApple();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Hi! Lets play the game! Push the button.',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.lightGreen,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            FutureBuilder<String>(
              future: generateRandomMessage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Column(
                    children: [
                      Text(
                        snapshot.data!,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          int randomNumber = Random().nextInt(8) + 1;
          List<String> phrases = ['You won!', 'You lost']..shuffle();
          assert(phrases.length == 2, 'Invalid count of phrases!');
          randomString =
              '$randomNumber : ${phrases[0]} ${phrases[0] == 'You won!' ? 'Congratulations!' : 'Try again('}';
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.face),
      ),
    );
  }

  Future<String> generateRandomMessage() async {
    await Future.delayed(Duration(seconds: 0));

    return randomString;
  }
}
