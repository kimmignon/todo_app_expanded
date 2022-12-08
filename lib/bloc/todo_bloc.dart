import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/bloc/todo_repository.dart';
import 'package:todo_app/models/todo_item.dart';
import 'package:todo_app/todo_item_widget.dart';

part 'todo_event.dart';
part 'todo_state.dart';

//Lijst met alle items in de to do list
final _items = List<ToDoItem>.empty(growable: true);

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  //Start with loading state
  TodoBloc(this.repository) : super(TodoLoadingState()) {
    //Lazy watch for events, when updates in db, a ToDoListUpdatEvent will happen
    repository.notifyOnChange().listen((event) => add(ToDoListUpdateEvent()));

    on<ToDoCreatedEvent>((event, emit) {
      repository.addTodoItem(ToDoItem(title: event.title));
    });

    on<ToDoDeleteEvent>((event, emit) {
      repository.deleteTodoItem(event.item);
    });

    on<ToggleTodoEvent>((event, emit) async {
      await repository.toggleTodo(event.item, event.status);
    });

    on<ToDoListUpdateEvent>((event, emit) async {
      //Emit loading state when collecting the data
      emit(TodoLoadingState());
      //Collect items async in var
      var items = await repository.getAllTodoItems();
      //Shows all items after any update
      emit(TodoLoadedState(items));
    });

    //When application starts, items have to be loaded by triggering a UpdateEvent
    add(ToDoListUpdateEvent());
  }
}
