class MovieDetailModel {
  late final num voteAverage;
  late final String overview;
  late final String genres;
  late final int runtime;

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> genreJson = json['genres'];
    List<dynamic> genreList = [];
    for (var genre in genreJson) {
      genreList.add(genre['name']);
    }

    voteAverage = json['vote_average'];
    overview = json['overview'];
    genres = genreList.join(', ');
    runtime = json['runtime'];
  }
}
