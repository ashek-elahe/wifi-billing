import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';


 void showCustomSnackBar({String message, String subTitle, IconData iconData, BuildContext context, bool isError = true}) {
   MotionToast(
     icon:  iconData ?? Icons.alarm,
     color: isError ? Colors.red : Colors.indigo,
     title: subTitle ?? "",
     titleStyle: TextStyle(fontWeight:  FontWeight.bold),
     description: message ?? "",
     width:  300,
     animationDuration: Duration(seconds: 1),
   ).show(context);
 }
