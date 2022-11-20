import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';

class NewToDoItemWidget extends StatefulWidget {
  NewToDoItemWidget({super.key});

  @override
  State<NewToDoItemWidget> createState() => _NewToDoItemWidgetState();
}

class _NewToDoItemWidgetState extends State<NewToDoItemWidget> {
  //Controller geven om textfield te kunnen clearen na updaten item
  //Controller definiëren in state, want state wordt wel bijgehouden tijdens re-rendering (anders wordt tekst ongepast ge-cleared)
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: TextField(
        controller: _controller,
        onSubmitted: (value) {
          _controller.clear();
          //Krijgt value van textfield mee
          BlocProvider.of<TodoBloc>(context)
              .add(ToDoCreatedEvent(title: value));
        },
      ),
    );
  }
}
