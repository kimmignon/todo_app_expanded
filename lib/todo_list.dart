import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/new_todo_item_widget.dart';
import 'package:todo_app/title_widget.dart';
import 'package:todo_app/todo_item_widget.dart';

//Klasse heeft zelf geen state, reageert op changes vanuit de todo_bloc
//Geeft TdoState simpelweg weer
class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    //Builder laat ons toe om te werken met huidige state
    //Generic: neemt specifieke bloc (=context) en zijn state (= hier een list van todoitems) (worden meegegeven aan builder)
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoadedState) {
          return _todoItemsLoaded(context, state);
        }
        return _todoItemsLoading(context);
      },
    );
  }

  Widget _todoItemsLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _todoItemsLoaded(BuildContext context, TodoLoadedState state) {
    return Column(
      children: [
        const TitleWidget(),
        NewToDoItemWidget(),
        Expanded(
          child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) =>
                  ToDoItemWidget(item: state.items[index])),
        )
      ],
    );
  }
}
