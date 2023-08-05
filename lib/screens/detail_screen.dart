import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieflix/models/movie_detail_model.dart';

import '../services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String originalTitle, backdropPath;
  final int id;

  const DetailScreen({
    super.key,
    required this.originalTitle,
    required this.backdropPath,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;
  final imagesrc = "https://image.tmdb.org/t/p/w500";

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
    print(movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(1),
        foregroundColor: Colors.black,
        title: const Text(
          "Back to list",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            fit: BoxFit.cover,
            image: NetworkImage('$imagesrc${widget.backdropPath}'),
          ),
        ),
        child: FutureBuilder(
            future: movie,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 210),
                    Text(
                      widget.originalTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    RatingBar.builder(
                      initialRating: snapshot.data!.voteAverage / 2,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    Text(
                      snapshot.data!.genres.toString(),
                    ),
                    const Text(
                      "Storyline",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(snapshot.data!.overview),
                  ],
                ));
              }
              return const Text("...");
            }),
      ),
    );
  }
}
