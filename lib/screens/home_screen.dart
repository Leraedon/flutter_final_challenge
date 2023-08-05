import 'package:flutter/material.dart';
import 'package:movieflix/services/api_service.dart';

import '../models/movie_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getNowPlayingMovies();
  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(),
          Text('Popular Movies'),
          Row(),
          Text('Now In Cinemas'),
          Row(),
          Text('Coming Soon'),
          Row(),
        ],
      ),
    );
  }
}
