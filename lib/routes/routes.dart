import 'package:flutter/material.dart';
import 'package:provider_practice/presentations/Landing.dart';
import 'package:provider_practice/presentations/Task_Details.dart';

Map<String, WidgetBuilder> routes = {
  "/" :(context) => Landing(),
  "/taskdetails": (context) => TaskDetails()
};