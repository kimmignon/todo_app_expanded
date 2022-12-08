part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

//State for waiting on database
class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<ToDoItem> items;

  TodoLoadedState(this.items);
}
