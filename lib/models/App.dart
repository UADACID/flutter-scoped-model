import 'package:scoped_model/scoped_model.dart';
import 'package:belajar_scoped_model/models/Counter.dart';
import 'package:belajar_scoped_model/models/TodoList.dart';

class AppModel extends Model with CounterModel, TodoListModel {}
