import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_puzzle_game/word_puzzle_page.dart';
import 'package:word_puzzle_game/word_puzzle_provider.dart';

import 'counter_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider(),),
      ChangeNotifierProvider(create: (context) => WordPuzzleProvider(),),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordPuzzlePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(
              builder: (context, provider, _) => Text(
                '${provider.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Consumer<CounterProvider>(
              builder: (context, provider, _) => Text(
                '${provider.counterDouble}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Consumer<CounterProvider>(
              builder: (context, provider, _) => Text(
                '${provider.counterTripple}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<CounterProvider>(context, listen: false).incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
