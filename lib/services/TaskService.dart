import 'dart:convert';

import 'package:provider_practice/AppEnviroment.dart';
import 'package:provider_practice/enums/taskstatus.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/models/TaskModel.dart';
import 'package:provider_practice/providers/taskprovider.dart';
import 'package:provider_practice/shared/showtoastmessage.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class TaskService{

  TaskProvider _taskProvider = locator<TaskProvider>();
  var uuid = new Uuid();

  Future fetchTasks () async{
    _taskProvider.isLoading = true;
    try{
      var response = await http.get(AppEnvironment.baseAPIUrl + '/tasks');
      print(response.toString());
      print(response.statusCode);
      if(response.statusCode == 200){
        List<Task> taskFromAPI = [];
        dynamic body = json.decode(response.body);
        print("one");
        print(body['data']);
        body['data'].forEach((val){
          print(val);
          taskFromAPI.add(Task.fromMap(val));
        });
        _taskProvider.tasks = taskFromAPI;
        print(_taskProvider.tasks);
        _taskProvider.isLoading = false;
      }else{
        _taskProvider.isLoading = false;
        showToast("Could not fetch Notes");
      }
      var body = jsonDecode(response.body);
      print(body);
    }catch(e){
      print(e);
      _taskProvider.isLoading = false;
      showToast("Could not fetch Notes");
    }
  }

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

  updateTask(Task task){
    _taskProvider.updatetask(task);
  }


}