import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/todo_item.dart';

//Deze klasse kan geen data aanpassen van todolist klasse
class ToDoItemWidget extends StatelessWidget {
  //Krijgt todo item binnen als eigenschap
  final ToDoItem item;

  const ToDoItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 15,
              offset: Offset(5, 5),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              //heeft waarde van het meegegeven todo item
              value: item.isCompleted,
              //Bloc aanspreken en hierop events emitten
              onChanged: (value) {
                if (value ?? false) {
                  BlocProvider.of<TodoBloc>(context)
                      .add(ToDoCompletedEvent(item: item));
                } else {
                  BlocProvider.of<TodoBloc>(context)
                      .add(ToDoUncompletedEvent(item: item));
                }
              },
            ),
            //Op deze manier deletebutton
            Expanded(
              child: Text(
                //title van meegegeven todo item
                item.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                    //Wanneer item completed is, lijn doortrekken
                    decoration:
                        item.isCompleted ? TextDecoration.lineThrough : null),
              ),
            ),
            //Delete button
            TextButton(
              onPressed: () {
                BlocProvider.of<TodoBloc>(context)
                    .add(ToDoDeleteEvent(item: item));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: CircleBorder(),
              ),
              child: const Text(
                "-",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
