import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:movies_app_with_provider/DataLayer/constants/constants.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

Widget alternativeAppBar(BuildContext context, int index) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: IconShadowWidget(
              Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 27,
              ),
              shadowColor: Colors.black,
              showShadow: true,
            ),
            onPressed: () => Navigator.pop(context)),
        IconButton(
          icon: IconShadowWidget(
            Icon(
              Icons.share,
              color: Colors.white,
              size: 26,
            ),
            shadowColor: Colors.black,
            showShadow: true,
          ),
          onPressed: () => share(context, index),
        ),
      ],
    );

Future<void> share(BuildContext context, int index) async {

  var movie=Provider.of<MoviesProvider>(context,listen: false);
  final resultMovies=MoviesProvider.movies.results;
  String movieKey;
  await movie.getVideoUrl(resultMovies[index].id).then((value) {
    movieKey=value.key;
  });
  final RenderBox box = context.findRenderObject();
  Share.share(  '$baseYoutubeUrl' + '$movieKey',
      subject: resultMovies [index].title,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size );


}