import 'package:flutter/material.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/services/TaskService.dart';

class TaskDetails extends StatefulWidget {
  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  TaskService _taskService = locator<TaskService>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO App"),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
            ),
            TextFormField(
              controller: _descriptionController,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: _addTask,
                    color: Colors.black,
                    textColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("Add a Task"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _addTask(){
    Map<String,dynamic> map = {
      "title": _titleController.text,
      "description": _descriptionController.text
    };

    _taskService.addTask(map);

  }
}
