import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

class TextModel extends CounterModel {
  String _text = 'a';

  String get text => _text;

  void setText(value) {
    _text = value;
    notifyListeners();
  }
}
