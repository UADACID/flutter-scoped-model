import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  increment() async {
    _counter++;
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }
}

class TextModel extends Model {
  String _text = 'a';

  String get text => _text;

  void setText(value) {
    _text = value;
    notifyListeners();
  }
}

class TodoListModel extends Model {
  int _number = 2;
  List<String> _todoItems = [
    '2222',
    '3242432',
    '2222',
    '3242432',
    '2222',
    '3242432',
    '2222',
    '3242432',
    'sssssddddddddd'
  ];

  List<String> get todosItems => _todoItems;

  int get number => _number;

  int getTodoListCount() {
    return _todoItems.length;
  }

  void addTodoItem() {
    int index = _todoItems.length;
    _todoItems.add('Item $index');
    _number++;
    // print(_todoItems);
    notifyListeners();
  }

  void addNumber() {
    _number++;
    notifyListeners();
  }
}
