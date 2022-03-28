import 'package:flutter/material.dart';
import 'package:movie_flix_flutter/model/movie.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mytheme = Theme.of(context);
    DateTime now = movie.releaseDate;
    String dateText =
        "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mytheme.primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w342${movie.posterPath}'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              color: const Color(0xB3000000),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      movie.title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color(0xB3FFFFFF),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      dateText,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color(0x80FFFFFF),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      movie.overview,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color(0xB3FFFFFF),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            )
          ],
        ) /* add child content here */,
      ),
    );
  }
}
