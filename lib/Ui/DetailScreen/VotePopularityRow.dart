

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'package:movies_app_with_provider/Ui/widgets/buildIconShapeInDetailScreen.dart';
import 'package:movies_app_with_provider/Ui/widgets/you_tube_button.dart';

class VotePopularityRow extends StatelessWidget {
  final int index;

  const VotePopularityRow({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var resultsMovies =MoviesProvider.movies.results;
    return
  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             YouTubeButton(movieId: resultsMovies[index].id,),

              createShape(
                  context: context,
                  size1: 34.2,
                  size2: 25.162,
                  icon1: CupertinoIcons.hexagon,
                  icon2: CupertinoIcons.hexagon_fill,
                  innerText: "${resultsMovies[index].voteAverage}",
                  underlineText: "${resultsMovies[index].voteCount} votes"),
              createShape(
                  context: context,
                  size1: 34.2,
                  size2: 27.28,
                  innerText: "${resultsMovies[index].popularity.round()}",
                  underlineText: "popularity"),
              createShape(
                  context: context,
                  size1: 34.19,
                  size2: 27.28,
                  innerText: "${resultsMovies[index].originalLanguage}",
                  underlineText: "Languages"),

            ],

    );
  }
}
