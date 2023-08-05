class MovieDetailModel {
  final double voteAverage;
  final String overview;
  final List<dynamic> genres;
  final int runtime;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : voteAverage = json['vote_average'],
        overview = json['overview'],
        genres = json['genres'],
        runtime = json['runtime'];
}
