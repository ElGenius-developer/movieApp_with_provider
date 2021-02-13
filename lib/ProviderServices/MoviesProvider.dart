import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_provider/DataLayer/Data_Model/Movies.dart';
import 'package:movies_app_with_provider/DataLayer/Data_Model/Results.dart';
import 'package:movies_app_with_provider/DataLayer/Data_Model/Trailers.dart';
import 'package:movies_app_with_provider/DataLayer/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviesProvider with ChangeNotifier {


  static Movies movies  ;
  static int currentValue = 1;
  static List<Results> myResult;
 static String category = 'popular';
  var trailers = Trailers();



  static Future<Movies> getData( String category) async {
    MoviesProvider.category=category;
    String url = (baseUrl +
        MoviesProvider.category +
        '?api_key=' +
        apiKey +
        '&language=en-us&page=$currentValue');

    /*$currentValue*/
    final res = await Dio().get(url);
    if (res.statusCode == 200) {
      // print(url);
      print(category);
      movies= Movies.fromJson(res.data);
      myResult=movies.results;
      print(movies.page);
    } else {
      throw Exception("Failed to load data"); //or e

    }
    return movies;

  }

  Future<TrailersResults> getVideoUrl(int movieID) async {
    String videoURL = (baseUrl +
        "$movieID" +
        '/videos?api_key=' +
        apiKey +
        '&language=en-us');

    final res = await Dio().get(videoURL);
    if (res.statusCode == 200) {
      trailers = Trailers.fromJson(res.data);
    } else {
      throw Exception("Failed to load data"); //or e
    }
    // notifyListeners();

    return trailers.results[1];
  }

  void changeSelector(int number) {
    currentValue = number;

    notifyListeners();
  }


  launchYoutube({int movieID}) async {
    String movieKey;
    await getVideoUrl(movieID).whenComplete(() {
      movieKey = trailers.results.first.key;
    });

    if (Platform.isIOS) {
      if (await canLaunch('youtube://$baseYoutubeUrl' + movieKey)) {
        await launch('youtube://$baseYoutubeUrl' + movieKey,
            forceSafariVC: false);
      } else {
        throw 'Could not launch $baseYoutubeUrl' + movieKey;
      }
    } else {
      var url = '$baseYoutubeUrl' + movieKey;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
