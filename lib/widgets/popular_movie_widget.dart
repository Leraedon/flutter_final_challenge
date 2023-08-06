import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class PopularMovie extends StatelessWidget {
  final String originalTitle, backdropPath;
  final int id;
  final imagesrc = "https://image.tmdb.org/t/p/w500";

  const PopularMovie(
      {super.key,
      required this.originalTitle,
      required this.backdropPath,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
                originalTitle: originalTitle,
                backdropPath: backdropPath,
                id: id),
          ),
        );
      },
      child: SizedBox(
        width: 300,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              '$imagesrc$backdropPath',
            ),
          ),
        ),
      ),
    );
  }
}
