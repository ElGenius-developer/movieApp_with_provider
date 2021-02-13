import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';


  Widget buildLiquidCircularProgressIndicator({double progress}){
    if(progress==null)progress=.35;
    return LiquidCircularProgressIndicator(
      value: progress, // Defaults to// 0.5.

      valueColor: AlwaysStoppedAnimation(Colors
          .pink),
      backgroundColor: Colors
          .white, // Defaults to the current Theme's backgroundColor.
      borderColor: Colors.pink,
      borderWidth: 5.0,
      direction: Axis
          .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
      center: Text("Loading..."),
    );
  }
