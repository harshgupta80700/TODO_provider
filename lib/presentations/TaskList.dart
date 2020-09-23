import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/providers/taskprovider.dart';

import 'TaskCard.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
        builder: (ctx,provider,child){
          return ListView.builder(
              itemCount: provider.tasks.length,
              itemBuilder: (context,index){
                return TaskCard(task: provider.tasks[index],);
              }
          );
        }
    );
  }
}
