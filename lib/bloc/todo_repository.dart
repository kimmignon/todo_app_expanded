import 'package:isar/isar.dart';
import 'package:todo_app/models/todo_item.dart';

//Interactions with database
class TodoRepository {
  //Internal database
  late Isar _database;

  TodoRepository() {
    _database = Isar.openSync([ToDoItemSchema]);
  }

  //Follow updates in database with stream
  Stream<void> notifyOnChange() => _database.toDoItems.watchLazy();

  //Functions (Async):
  Future<List<ToDoItem>> getAllTodoItems() {
    return _database.toDoItems.where().findAll();
  }

  Future addTodoItem(ToDoItem toDoItem) async {
    await _database.writeTxn(() => _database.toDoItems.put(toDoItem));
  }

  Future deleteTodoItem(ToDoItem toDoItem) async {
    await _database.writeTxn(() => _database.toDoItems.delete(toDoItem.id));
  }

  Future toggleTodo(ToDoItem todo, bool status) async {
    await _database.writeTxn(() {
      return _database.toDoItems
          .put(ToDoItem.createWithId(todo.id, todo.title, status));
    });
  }
}
