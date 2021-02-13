

import 'package:flutter/material.dart';

void createSnackBar({GlobalKey<ScaffoldState> globalKey, String text}){

  globalKey.currentState.removeCurrentSnackBar();
  globalKey.currentState
      .showSnackBar(SnackBar(content: Text("$text is not avail yet",
    style: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,


        fontSize: 15
    ),),
    duration: Duration(seconds: 3),

    backgroundColor: Colors.pink[800],));

}