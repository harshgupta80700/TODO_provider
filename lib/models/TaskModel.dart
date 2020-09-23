import 'package:flutter/cupertino.dart';
import 'package:provider_practice/enums/taskstatus.dart';

class Task {

  String id;
  String title;
  String description;
  String status;

  Task({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.status,
  });

  Task.fromMap(Map<String,dynamic> task){
    this.id = task["_id"];
    this.title = task["title"];
    this.description = task["description"];
    this.status = task["status"];
  }

}