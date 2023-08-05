import 'package:flutter/material.dart';
import 'package:movieflix/services/api_service.dart';

import '../models/movie_model.dart';
import '../widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getNowPlayingMovies();
  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Column(
              children: [
                const Text('Popular Movies'),
                FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Column(children: [
                          Expanded(
                            child: makeList(snapshot),
                          )
                        ]),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text('Now In Cinemas'),
                FutureBuilder(
                  future: nowPlayingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Column(children: [
                          Expanded(
                            child: makeList(snapshot),
                          )
                        ]),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text('Coming Soon'),
                FutureBuilder(
                  future: comingSoonMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Column(children: [
                          Expanded(
                            child: makeList(snapshot),
                          )
                        ]),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie(
          originalTitle: movie.originalTitle,
          backdropPath: movie.backdropPath,
          id: movie.id,
        );
      },
      separatorBuilder: (content, index) => const SizedBox(
        width: 5,
      ),
    );
  }
}
