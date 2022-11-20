import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/todo_item.dart';
import 'package:todo_app/todo_item_widget.dart';

part 'todo_event.dart';
part 'todo_state.dart';

//Lijst met alle items in de to do list
final _items = List<ToDoItem>.empty(growable: true);

//reageert op todo events en emits todo state.
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  //initiële state is een lijst
  TodoBloc() : super(TodoState(items: _items)) {
    //Todo:implement event handler (zeggen wat er moet gebeuren bij welk event)
    on<ToDoCompletedEvent>((event, emit) {
      event.item.isCompleted = true;

      //nieuw opject aanmaken met instanties in, zodat er wel een state range plaats vindt
      emit(TodoState(items: _items));
    });
    on<ToDoUncompletedEvent>((event, emit) {
      event.item.isCompleted = false;
      emit(TodoState(items: _items));
    });
    on<ToDoCreatedEvent>((event, emit) {
      var newItem = ToDoItem(title: event.title);

      state.items.add(newItem);
      emit(TodoState(items: state.items));
    });
    on<ToDoDeleteEvent>((event, emit) {
      state.items.remove(event.item);
      emit(TodoState(items: state.items));
    });
  }
}
