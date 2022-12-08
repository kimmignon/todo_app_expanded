import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        //padding: EdgeInsets.all(24),
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(24),
        child: Container(
          //width: double.infinity,
          padding: const EdgeInsets.fromLTRB(48, 12, 48, 12),
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

          //Text met title
          child: const Text("To Do List",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
