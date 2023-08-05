import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String originalTitle, backdropPath;
  final int id;
  final imagesrc = "https://image.tmdb.org/t/p/w500";

  const Movie(
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
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                '$imagesrc$backdropPath',
              ),
            ),
            SizedBox(
              child: Text(
                originalTitle,
                maxLines: null,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
