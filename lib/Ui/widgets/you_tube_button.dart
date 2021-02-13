import 'package:flutter/material.dart';
import 'package:movies_app_with_provider/ProviderServices/MoviesProvider.dart';
import 'package:provider/provider.dart';

class YouTubeButton extends StatelessWidget {
  final int movieId;

  const YouTubeButton({Key key, this.movieId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(right:8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 35,
              height: 35,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red[900],

              ),
              padding: EdgeInsets.symmetric(horizontal: 9,vertical: 10),
              child: Container(
                width: 20,
                height: 10,
                child: Icon(Icons.play_arrow,size: 12,color: Colors.red,),
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                "Trailer",
                style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
            )
          ],
        ),
      ),

      onTap: () => Provider.of<MoviesProvider>(context,listen: false).launchYoutube(
        movieID: movieId
      ),
    );
  }
}
