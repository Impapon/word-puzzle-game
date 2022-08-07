import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'word_puzzle_provider.dart';

class WordPuzzlePage extends StatefulWidget {
  const WordPuzzlePage({Key? key}) : super(key: key);

  @override
  State<WordPuzzlePage> createState() => _WordPuzzlePageState();
}

class _WordPuzzlePageState extends State<WordPuzzlePage> {
  late WordPuzzleProvider provider;
  final wordController = TextEditingController();
  final focusNode = FocusNode();
  bool isInit = true;

  @override
  void dispose() {
    wordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if(isInit) {
      provider = Provider.of<WordPuzzleProvider>(context);
      provider.createWordList();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Puzzle Game'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            provider.getShuffledWord(provider.getWord),
            style: const TextStyle(fontSize: 50),
          ),
          Text(provider.showHint(),
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            focusNode: focusNode,
            controller: wordController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: provider.isOver ? null : () {
                  provider.submitAnswer(wordController.text);
                  wordController.clear();
                  focusNode.requestFocus();
                },
                child: const Text('SUBMIT'),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: provider.isOver ? null : () {
                  wordController.clear();
                  provider.passAnswer();
                  focusNode.requestFocus();
                },
                child: const Text('PASS'),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Text('Correct: ${provider.correct}'),
          Text('Incorrect: ${provider.incorrect}'),
        ],
      ),
    );
  }
}
