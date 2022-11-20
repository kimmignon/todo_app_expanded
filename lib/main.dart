import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MaterialApp = initiële configuratie van color shemes en styling
    return MaterialApp(
      //huisstijl toevoegen
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      //Scaffold = visuele layout van applicatie (appbar, content, navigation bars,...)
      home: Scaffold(
        //SafeArea = zo kan content niet onder harware terecht komen, padding voor hardware
        body: SafeArea(
          //Bloc beschikbaar maken voor applicatie via provider
          //Provider heeft functie dat specifieke bloc gaat aanmaken
          child: BlocProvider(
            create: (context) => TodoBloc(),
            child: ToDoList(),
          ),
        ),
      ),
    );
  }
}
