part of 'todo_bloc.dart';

//Hierin events definiëren
@immutable
abstract class TodoEvent {}

//Event dat zegt dat een todo item is afgewerkt
//Krijgt een todo item binnen
class ToDoCompletedEvent extends TodoEvent {
  final ToDoItem item;

  ToDoCompletedEvent({required this.item});
}

//Krijgt ook een todo item binnen
class ToDoUncompletedEvent extends TodoEvent {
  final ToDoItem item;

  ToDoUncompletedEvent({required this.item});
}

class ToDoCreatedEvent extends TodoEvent {
  final String title;

  ToDoCreatedEvent({required this.title});
}

class ToDoDeleteEvent extends TodoEvent {
  final ToDoItem item;

  ToDoDeleteEvent({required this.item});
}
