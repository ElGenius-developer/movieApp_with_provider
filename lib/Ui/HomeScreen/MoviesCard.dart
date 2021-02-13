import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'package:movies_app_with_provider/Ui/DetailScreen/DetailScreen.dart';
import 'package:movies_app_with_provider/DataLayer/constants/constants.dart';

class MoviesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return    GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: (MoviesProvider.myResult == null)
            ? 0
            : MoviesProvider.myResult.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.25,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          CachedNetworkImageProvider poster, cover;
          var movie = MoviesProvider.myResult[index];

          poster = CachedNetworkImageProvider(
              (movie.posterPath == null) ? noImageUrl : movie.posterPath);
          cover = CachedNetworkImageProvider(
              (movie.backdropPath == null) ? noImageUrl : movie.backdropPath,);

          return Card(
            child: GestureDetector(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: index,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3.12,
                        child: Image(
                          image: poster,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        MoviesProvider.myResult[index].title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      index: index,
                      poster: poster,
                      cover: cover,
                    ),
                  )),
            ),
          );
        });
  }
}
