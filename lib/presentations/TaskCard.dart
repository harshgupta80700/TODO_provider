import 'package:flutter/material.dart';
import 'package:provider_practice/models/TaskModel.dart';

class TaskCard extends StatelessWidget {

  final Task task;
  TaskCard({
    @required this.task
  });

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
              Text(task.title),
              Text(task.status.toString())
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(task.description),
              Icon(Icons.delete,color: Colors.red,)
            ],
          ),
        ],
      ),
    );
  }
}
