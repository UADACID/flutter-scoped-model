import 'package:scoped_model/scoped_model.dart';

mixin TodoListModel on Model {
  List<String> _todoItems = [];

  List<String> get todosItems => _todoItems;

  void addTodoItem() {
    int index = _todoItems.length;
    _todoItems.add('Item $index');
    notifyListeners();
  }

  void clearTodoItems() {
    _todoItems.clear();
    notifyListeners();
  }

  void removeItem(index) {
    _todoItems.removeAt(index);
    notifyListeners();
  }
}
