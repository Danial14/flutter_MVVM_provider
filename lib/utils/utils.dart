import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static showToastMessage(String Message){
    Fluttertoast.showToast(msg: Message,
    backgroundColor: Colors.brown,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG
    );
  }
  static flushBarErrorMessage(String Message, BuildContext ctx){
    showFlushbar(context: ctx,
    flushbar: Flushbar(
      title: "Error",
      titleSize: 28,
      backgroundColor: Colors.red,
      message: Message,
      forwardAnimationCurve: Curves.easeInCubic,
      duration: Duration(seconds: 5),
      reverseAnimationCurve: Curves.easeInOut,
      margin: EdgeInsets.all(15),
      icon: Icon(Icons.error, color: Colors.black, size: 28,),
      positionOffset: 20,
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(15),
    )..show(ctx)
    );
  }
  static void changeFocus(BuildContext buildContext, FocusNode nextFocus, FocusNode currentFocus){
    currentFocus.unfocus();
    FocusScope.of(buildContext).requestFocus(nextFocus);
  }
}