import 'package:flutter/material.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class PageNumberPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MoviesProvider>(context);


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberPicker.integer(
          onChanged: (value) {
            provider.changeSelector(value);
            // if(value<provider.totalPages)
          },
          initialValue: MoviesProvider.currentValue,
          minValue: 1,
          maxValue: 12, //provider.movies.totalPages,
          listViewWidth: 70,
          scrollDirection: Axis.horizontal,
          itemExtent: 20,
          selectedTextStyle: TextStyle(
              fontSize: 15, color: Colors.pink, fontWeight: FontWeight.bold),
          textStyle: TextStyle(fontSize: 11, color: Colors.black54),
        ),
        Text("Current number: ${MoviesProvider.currentValue}"),
      ],
    );
  }
}
