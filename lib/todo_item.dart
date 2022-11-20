//Klasse bevat alle eigenschappen van een ToDo item
//Deze worden aangepast en moeten worden weergegeven door de ToDoItemWidget
class ToDoItem {
  String title;
  bool isCompleted;

  //constructor
  ToDoItem({required this.title, this.isCompleted = false});
}
