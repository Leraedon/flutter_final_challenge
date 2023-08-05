import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  static List<dynamic> getResults(Map<String, dynamic> json) {
    return json['results'];
  }

  static Future<List<MovieModel>> getNowPlayingMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body);
      //print(movies);
      final List<dynamic> results = getResults(movies);
      for (var movie in results) {
        final instance = MovieModel.fromJson(movie);
        movieInstances.add(instance);
      }
      //MovieModel.fromJson(movies);
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoonMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body);
      //print(movies);
      final List<dynamic> results = getResults(movies);
      for (var movie in results) {
        final instance = MovieModel.fromJson(movie);
        movieInstances.add(instance);
      }
      //MovieModel.fromJson(movies);
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body);
      //print(movies);
      final List<dynamic> results = getResults(movies);
      for (var movie in results) {
        final instance = MovieModel.fromJson(movie);
        movieInstances.add(instance);
      }
      //MovieModel.fromJson(movies);
      return movieInstances;
    }
    throw Error();
  }
}
