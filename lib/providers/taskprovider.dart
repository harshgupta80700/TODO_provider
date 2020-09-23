import 'package:flutter/cupertino.dart';
import 'package:provider_practice/models/TaskModel.dart';

class TaskProvider extends ChangeNotifier{

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  set tasks(List<Task> task){
    _tasks = task;
    notifyListeners();
  }

  addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }

  deleteTask(String id){
    _tasks.removeWhere((object) => object.id == id );
    notifyListeners();
  }

}