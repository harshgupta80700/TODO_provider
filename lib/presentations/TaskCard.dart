import 'package:flutter/material.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/models/TaskModel.dart';
import 'package:provider_practice/services/TaskService.dart';

class TaskCard extends StatefulWidget {

  final Task task;
  TaskCard({
    @required this.task
  });

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.task.title),
              Text(widget.task.status.toString()),
              IconButton(
                icon: Icon(Icons.edit,color: Colors.black,),
                onPressed: (){
                  Navigator.pushNamed(context, "/taskdetails", arguments: this.widget.task);
                },
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.task.description),
              IconButton(
                icon: Icon(Icons.delete,color: Colors.red,),
                onPressed: _deleteTask,
              )
            ],
          ),
        ],
      ),
    );
  }

  _deleteTask(){
    locator<TaskService>().deleteTask(widget.task.id);
  }
}
