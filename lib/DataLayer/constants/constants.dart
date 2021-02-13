import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String imageUrlPrefix =
    'https://image.tmdb.org/t/p/w342'; //the start of the image url

String apiKey = '944da4297799bd63a31aa54b2017eb8b';
//you can get your own api key from  https://themoviedb.org/
String baseUrl = 'https://api.themoviedb.org/3/movie/';

String baseYoutubeUrl= 'https://www.youtube.com/watch?v=';
//464052/videos?api_key=944da4297799bd63a31aa54b2017eb8b&language=en-US
//movieid/videos
 String noImageUrl="http://www.aaru.edu.jo/websites/aaru2/wp-content/plugins/learnpress/assets/images/no-image.png?Mobile=1&Source=%2F%5Flayouts%2Fmobile%2Fdispform%2Easpx%3FList%3D78b536db%252De7c7%252D45d9%252Da661%252Ddb2a2aa2fbaf%26View%3D6efc759a%252D0646%252D433c%252Dab6e%252D2f027ffe0799%26RootFolder%3D%252Fwebsites%252Faaru2%252Fwp%252Dcontent%252Fplugins%252Flearnpress%252Fassets%252Fimages%26ID%3D4786%26CurrentPage%3D1";

var categoriesList = ['popular', 'top_rated', 'now_playing', 'upcoming'];
var categoriesNames = ['Popular', 'Top Rated', 'Now Playing', 'Upcoming'];
var iconsList = [
  Icon(
    Icons.local_fire_department_outlined,
    color: Color(0xffFBFCFC),
  ),
  Icon(
    Icons.star,
    color: Color(0xffFBFCFC),
  ),
  Icon(Icons.play_circle_fill, color: Color(0xffFBFCFC)),
  Icon(CupertinoIcons.clock, color: Color(0xffFBFCFC)),
];