import 'package:isar/isar.dart';

part 'todo_item.g.dart';

//Annotate for database
@Collection()
class ToDoItem {
  Id id = Isar.autoIncrement;
  String title;
  bool isCompleted;

  //New constructor for updating complete status
  ToDoItem.createWithId(this.id, this.title, this.isCompleted);
  ToDoItem({required this.title, this.isCompleted = false});
}
