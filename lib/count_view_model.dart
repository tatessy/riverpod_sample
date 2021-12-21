import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//①Riverpodのみ設定
final countViewModel = ChangeNotifierProvider((_) => CountViewModel());

//CountViewModelの中身は一緒
class CountViewModel extends ChangeNotifier {
  final String title = 'provider';

  int _counter = 0;
  get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
