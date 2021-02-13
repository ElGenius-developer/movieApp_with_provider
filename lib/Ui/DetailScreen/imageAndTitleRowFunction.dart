import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'checkReleasedDate.dart';

Widget imageAndTitleRowFunction(
    {context, globalKey, imageProvider, index,}) {
  var movies= MoviesProvider.movies;
  var filmDate = DateTime.parse(movies.results[index].releaseDate);

  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Card(
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          width: width / 2.5,
          height: height / 2,
          child: Image(fit: BoxFit.scaleDown, image: imageProvider),
        ),
        //the second row (image , title, language , realese date
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: width * .07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "${movies.results[index].title}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 21,
                        height: 1.2,
                        color: Colors.pink[700],
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 15),
                  child: RichText(
                      text: TextSpan(
                          text: "Language:  ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                        TextSpan(
                            text: movies.results[index].originalLanguage,
                            style: TextStyle(
                              color: Colors.pink[700],
                            ))
                      ])),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: (checkData(filmDate))
                      ? Text(
                          movies.results[index].releaseDate + '  (Released)',
                        )
                      : Text(
                          movies.results[index].releaseDate + ("   Up coming"),
                        ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.only(top: height / 20, left: 15, bottom: 5),
                    alignment: Alignment.bottomLeft,
                    child: CupertinoButton(
                      padding: EdgeInsets.all(5),
                      color: Colors.teal[400],
                      onPressed: () {
                       },
                      child: Text(
                        "Reviews",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
