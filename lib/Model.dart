import 'package:scoped_model/scoped_model.dart';

mixin CounterModel on Model {
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

mixin TodoListModel on Model {
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

class AppModel extends Model with CounterModel, TodoListModel {}
