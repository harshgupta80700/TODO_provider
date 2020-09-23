import 'package:flutter/cupertino.dart';
import 'package:provider_practice/models/TaskModel.dart';

class TaskProvider extends ChangeNotifier{

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;
  set tasks(List<Task> task){
    _tasks = task;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading = value;
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

  updatetask(Task task){
    int index = _tasks.indexWhere((t) => t.id == task.id);
    _tasks.replaceRange(index, index+1, [task]);
    notifyListeners();
  }

}