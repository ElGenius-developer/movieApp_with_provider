import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_provider/DataLayer/Data_Model/Movies.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'package:movies_app_with_provider/Ui/widgets/CustomCircularIndicator.dart';
import 'package:provider/provider.dart';
import 'MoviesCard.dart';
import 'PageNumberPicker.dart';

// ignore: must_be_immutable
class MovieViewerBody extends StatelessWidget {
  final String category;
 
  MovieViewerBody({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


     return Consumer<MoviesProvider>(builder: (context, value, child) =>
         FutureBuilder(

           future: MoviesProvider.getData(category),
           builder: (_, snapshot) {

             if (snapshot.connectionState==ConnectionState.done)
             {


               return   Column(
                 children: [
                   PageNumberPicker(),
                   Expanded(child: MoviesCard()),
                 ],
               );


             }
             else return Center(
               child: Container(
                 height: height / 7.5,
                 width: width / 3.5,
                 child: buildLiquidCircularProgressIndicator(),
               ),
             );

           },
         ));

  }
}
