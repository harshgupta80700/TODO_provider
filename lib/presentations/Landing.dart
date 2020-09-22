import 'package:flutter/material.dart';
import 'package:provider_practice/presentations/Task_Screen.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO App"),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(15.0),
        child: TaskPage(),
      ),
    );
  }
}
