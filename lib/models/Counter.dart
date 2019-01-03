import 'package:scoped_model/scoped_model.dart';

mixin CounterModel on Model {
  int _counter = 0;

  int get counter => _counter;

  increment() async {
    _counter++;
    notifyListeners();
  }
}
