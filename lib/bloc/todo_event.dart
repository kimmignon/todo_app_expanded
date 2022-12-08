part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

//For when any change happens to database
class ToDoListUpdateEvent extends TodoEvent {}

class ToDoCreatedEvent extends TodoEvent {
  final String title;

  ToDoCreatedEvent({required this.title});
}

class ToDoDeleteEvent extends TodoEvent {
  final ToDoItem item;

  ToDoDeleteEvent({required this.item});
}

class ToggleTodoEvent extends TodoEvent {
  final ToDoItem item;
  final bool status;

  ToggleTodoEvent({required this.item, required this.status});
}
