import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Future showToast(String msg){
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

