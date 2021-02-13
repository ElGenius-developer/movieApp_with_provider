import 'package:flutter/material.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'package:movies_app_with_provider/DataLayer/constants/constants.dart';
import 'package:movies_app_with_provider/Ui/HomeScreen/MovieViewerBody.dart';
import 'package:provider/provider.dart';

import 'appBar/CustomAppBar.dart';

class MoviesHome extends StatefulWidget {
  static TabController controller;

  @override
  _MoviesHomeState createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    MoviesHome.controller = TabController(
      length: categoriesNames.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    MoviesHome.controller.dispose();
    Provider.of<MoviesProvider>(context).dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("this is home ");
    return Scaffold(
        appBar: CustomAppBar(
            tabController: MoviesHome.controller,
            size: Size(2, 125),
            title: 'Movies'),
        body: Center(
            child: TabBarView(
                controller: MoviesHome.controller,
                children: categoriesList.map((category) =>
                    MovieViewerBody(category:category ,),
                ).toList()
            )));
  }
}
