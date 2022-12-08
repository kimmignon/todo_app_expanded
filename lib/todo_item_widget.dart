import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/models/todo_item.dart';

class ToDoItemWidget extends StatelessWidget {
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
              offset: const Offset(5, 5),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            //Checkbox of item
            Checkbox(
              value: item.isCompleted,
              onChanged: (value) {
                context
                    .read<TodoBloc>()
                    .add(ToggleTodoEvent(item: item, status: value ?? false));
              },
            ),
            //Title of item
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
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
                shape: const CircleBorder(),
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
