import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/bloc/todo_repository.dart';
import 'package:todo_app/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: Scaffold(
        body: SafeArea(
          //Repository and Bloc providers
          child: RepositoryProvider<TodoRepository>(
            create: (context) => TodoRepository(),
            child: BlocProvider<TodoBloc>(
              create: (context) => TodoBloc(context.read<TodoRepository>()),
              child: const ToDoList(),
            ),
          ),
        ),
      ),
    );
  }
}
