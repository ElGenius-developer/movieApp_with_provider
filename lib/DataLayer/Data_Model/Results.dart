import 'package:movies_app_with_provider/DataLayer/constants/constants.dart';

class Results {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  var voteAverage;
  int voteCount;

  Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
if(json!=null){

  adult = json['adult'];
  backdropPath = imageUrlPrefix +json['backdrop_path'];
  genreIds = json['genre_ids'].cast<int>();
  id = json['id'];
  originalLanguage = json['original_language'];
  originalTitle = json['original_title'];
  overview = json['overview'];
  popularity = json['popularity'];
  posterPath = imageUrlPrefix + json['poster_path'];

  releaseDate = json['release_date'];
  title = (json['title'] == null) ? "no title" : json['title'];
  video = json['video'];
  voteAverage = json['vote_average'];
  voteCount = json['vote_count'];

}
  }
}
