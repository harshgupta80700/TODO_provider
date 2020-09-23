import 'package:flutter/material.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/models/TaskModel.dart';
import 'package:provider_practice/services/TaskService.dart';
import 'package:provider_practice/shared/showtoastmessage.dart';

class TaskDetails extends StatefulWidget {

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  TaskService _taskService = locator<TaskService>();

  Task task;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      task = ModalRoute.of(context).settings.arguments;
      if(task != null){
        _titleController.text = task.title;
        _descriptionController.text = task.description;
        setState(() {

        });
      }
    });

    super.initState();
  }


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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title"),
            TextFormField(
              controller: _titleController,
            ),
            SizedBox(height: 30,),
            Text("Description"),
            TextFormField(
              controller: _descriptionController,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: RaisedButton(
                      onPressed: _addTask,
                      color: Colors.black,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(task==null?"Add a Task":"Update a task"),
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _addTask(){

    if(_titleController.text.length == 0 || _descriptionController.text.length == 0){
      showToast("Required");
    }else{
      Map<String,dynamic> map = {
        "title": _titleController.text,
        "description": _descriptionController.text
      };

      _taskService.addTask(map);

      Navigator.pop(context);
    }
  }
}
