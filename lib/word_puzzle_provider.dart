import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as Words;
class WordPuzzleProvider extends ChangeNotifier {
  List<String> gameWordList = [];
  int index = 0;
  int correct = 0;
  int incorrect = 0;

  createWordList() {
    gameWordList = Words.nouns.where((element) =>
      element.length >= 4 && element.length <= 6).toList();
    gameWordList.shuffle();
  }

  String getShuffledWord(String word) {
    final temp = <String>[];
    for(var i = 0; i < word.length; i++) {
      temp.add(word[i]);
    }
    temp.shuffle();
    return temp.join('').toUpperCase();
  }

  String showHint() {
    final word = gameWordList[index];
    if(word.length == 5) {
      return 'Starts with ${word[0].toUpperCase()}';
    } else if(word.length == 6){
      return 'Hint: ${word[0].toUpperCase()}****${word[5].toUpperCase()}';
    } else {
      return '';
    }
  }

  bool isEqual(String input) => input.toUpperCase() == gameWordList[index].toUpperCase();

  updateIndex() {
    if(index < gameWordList.length) {
      index++;
    }
  }

  bool get isOver => index == gameWordList.length - 1;

  String get getWord => gameWordList[index];

  submitAnswer(String input) {
    if(isEqual(input)) {
      correct++;
    } else {
      incorrect++;
    }
    updateIndex();
    notifyListeners();
  }

  passAnswer() {
    updateIndex();
    incorrect++;
    notifyListeners();
  }
}