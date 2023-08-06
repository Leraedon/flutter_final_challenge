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

  List<int> runtimeFormat(int runtime) {
    int hours = (runtime / 60).floor();
    int minutes = runtime % 60;

    return [hours, minutes];
  }

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
    print(movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: SingleChildScrollView(
        child: Container(
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
                    child: Padding(
                      padding: const EdgeInsets.all(11.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 255),
                          Text(
                            widget.originalTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
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
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                              "${runtimeFormat(snapshot.data!.runtime)[0]}h ${runtimeFormat(snapshot.data!.runtime)[1]}min | ${snapshot.data!.genres}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              )),
                          const SizedBox(
                            height: 45,
                          ),
                          const Text(
                            "Storyline",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            snapshot.data!.overview,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.amber,
                            ),
                            child: const Text(
                              "Buy Ticket",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return const Text("...");
              }),
        ),
      ),
    );
  }
}
