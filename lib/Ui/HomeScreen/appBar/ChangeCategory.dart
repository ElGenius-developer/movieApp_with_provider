import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_provider/DataLayer/constants/constants.dart';

class ChangeCategory extends StatelessWidget {
  ChangeCategory({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return PopupMenuButton(
      icon: Icon(
        CupertinoIcons.ellipsis_vertical,
        color: Colors.white,
      ),
      initialValue: categoriesNames[0],
      itemBuilder: (context) {
         return categoriesNames.map((value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
      onSelected: (selectedValue) {
        int index = categoriesNames.indexOf(
            selectedValue);
        // provider.fetchMovies(provider.categoriesList[index]);
      },
    );
  }
}
