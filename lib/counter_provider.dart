import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int _counterDouble = 0;
  int _counterTripple = 0;

  int get counter => _counter;
  int get counterDouble => _counterDouble;
  int get counterTripple => _counterTripple;

  void incrementCounter() {
    _counter++;
    _counterDouble = _counter * 2;
    _counterTripple = _counter * 3;
    notifyListeners();
  }


}
