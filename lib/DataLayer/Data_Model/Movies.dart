import 'Results.dart';

class Movies {
  int page;
  List<Results> results;
  int totalPages;
  int totalResults;

  Movies({this.page=1, this.results, this.totalPages=4, this.totalResults=0});
  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


}

