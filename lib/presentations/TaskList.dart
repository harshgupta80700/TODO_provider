import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/providers/taskprovider.dart';
import 'package:provider_practice/services/TaskService.dart';

import 'TaskCard.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  TaskService _taskService = locator<TaskService>();

  @override
  void initState() {
    _taskService.fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
        builder: (ctx,provider,child){
          return provider.isLoading ? Center(
            child: CupertinoActivityIndicator(
              radius: 20,
            ),
          ):ListView.builder(
            physics: BouncingScrollPhysics(),
            //dragStartBehavior:DragStartBehavior.down,
              itemCount: provider.tasks.length,
              itemBuilder: (context,index){
                return TaskCard(task: provider.tasks[index],);
              }
          );
        }
    );
  }
}
