import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createShape(
    {BuildContext context,
    double size1,
    double size2,
    IconData icon1,
    IconData icon2,
    String innerText,
    String underlineText}) {
  return   Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              (icon1 == null) ? CupertinoIcons.circle : icon1,
              size: size1,
              color: Colors.red[900],
            ),
            Icon(
              (icon2 == null) ? CupertinoIcons.circle_fill : icon2,
              size: size2,
              color: Colors.red[900],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$innerText",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 7.5),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            underlineText,
            style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: Colors.black45),
          ),
        )
      ],

  );
}
