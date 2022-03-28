import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_flix_flutter/model/movie.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class MovieController extends GetxController {
  var nowplayingMovies = <Movie>[].obs;
  var topratedMovies = <Movie>[].obs;
  var nowplayingList = <Movie>[];
  var topratedList = <Movie>[];

  @override
  void onInit() {
    super.onInit();
    setNPList();
    setTRList();
  }

  Future<List<Movie>> fetchMovies(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        List<Movie> movieList = [];
        List results = decodedData['results'];
        for (var element in results) {
          movieList.add(Movie(
              backdropPath: element['backdrop_path'],
              originalLanguage: element['original_language'],
              originalTitle: element['original_title'],
              overview: element['overview'],
              popularity: element['popularity'].toDouble(),
              posterPath: element['poster_path'],
              releaseDate: DateTime.parse(element['release_date']),
              title: element['title'],
              voteAverage: element['vote_average'].toDouble(),
              voteCount: element['vote_count']));
        }

        return movieList;
      } else {
        throw Exception('not able to Fetch the trening Movies');
      }
    } catch (e) {
      //print(e);
      rethrow;
    }
  }

  Future<void> setNPList() async {
    nowplayingList = await fetchMovies(nowplayingUrl);
    nowplayingMovies.value = nowplayingList;
  }

  Future<void> setTRList() async {
    topratedList = await fetchMovies(topratedUrl);
    topratedMovies.value = topratedList;
  }

  void filterNowPlaying(String movieName) {
    if (movieName.isEmpty) {
      nowplayingMovies.value = nowplayingList;
    } else {
      final movies = nowplayingMovies.where((movie) {
        final movieTitle = movie.title.toLowerCase();
        movieName = movieName.toLowerCase();

        return movieTitle.contains(movieName);
      }).toList();
      nowplayingMovies.value = movies;
    }
  }

  void filterToprated(String movieName) {
    if (movieName.isEmpty) {
      topratedMovies.value = topratedList;
    } else {
      final movies = topratedMovies.where((movie) {
        final movieTitle = movie.title.toLowerCase();
        movieName = movieName.toLowerCase();

        return movieTitle.contains(movieName);
      }).toList();
      topratedMovies.value = movies;
    }
  }
}
