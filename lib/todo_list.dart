import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/new_todo_item_widget.dart';
import 'package:todo_app/title_widget.dart';
import 'package:todo_app/todo_item_widget.dart';

//Klasse heeft zelf geen state, reageert op changes vanuit de todo_bloc
//Geeft TdoState simpelweg weer
class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Builder laat ons toe om te werken met huidige state
    //Generic: neemt specifieke bloc (=context) en zijn state (= hier een list van todoitems) (worden meegegeven aan builder)
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Column(
          //Max size column geven voor ListView
          children: [
            //Title container
            const TitleWidget(),
            //Empty field for new item
            NewToDoItemWidget(),
            //List of to do items
            //Expanded vult de maximale hoogte dat overblijft in de column opvullen op scherm, zo weet Listview hoe groot hij mag zijn
            Expanded(
              //ListView gebruiken, want column is niet scrollable
              child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) =>
                      ToDoItemWidget(item: state.items[index])),
            )
          ],
        );
      },
    );
  }
}
