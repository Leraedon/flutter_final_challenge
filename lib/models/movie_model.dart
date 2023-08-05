class MovieModel {
  late final String originalTitle, backdropPath;
  late final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : originalTitle = json['original_title'],
        backdropPath = json['backdrop_path'],
        id = json['id'];
}
