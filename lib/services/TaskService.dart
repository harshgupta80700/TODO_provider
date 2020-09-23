import 'package:provider_practice/enums/taskstatus.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/models/TaskModel.dart';
import 'package:provider_practice/providers/taskprovider.dart';
import 'package:uuid/uuid.dart';

class TaskService{

  TaskProvider _taskProvider = locator<TaskProvider>();
  var uuid = new Uuid();

  addTask(Map<String, dynamic> task){

    task.addAll({
      "status": taskStatus.OPEN,
      "id": uuid.v1()
    });
    print(task.toString());
    _taskProvider.addTask(Task.fromMap(task));
  }

  deleteTask(String id){
    _taskProvider.deleteTask(id);
  }


}