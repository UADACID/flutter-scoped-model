import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  increment() async {
    _counter++;
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
  List<String> _todoItems = [];

  List<String> get todosItems => _todoItems;

  int getTodoListCount() {
    return _todoItems.length;
  }

  void addTodoItem() {
    int index = _todoItems.length;
    _todoItems.add('Item $index');
    // print(_todoItems);
    notifyListeners();
  }

  void clearTodoItems() {
    _todoItems.clear();
    notifyListeners();
  }
}
