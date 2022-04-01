import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:MovieFlix/models/movies.dart';

class RemoteServices {
  static Future<List<Movies>?> fetchMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed'));
    if (response.statusCode == 200) {
      var movieList = jsonDecode(response.body)['results'] as List;
      List<Movies>? movies =
          movieList.map((tagJson) => Movies.fromJson(tagJson)).toList();
      print(movies.length);
      return movies;
    } else {
      return null;
    }
  }
}

class RemoteServicesstar {
  static Future<List<Movies>?> starfetchMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed'));
    if (response.statusCode == 200) {
      var movieList = jsonDecode(response.body)['results'] as List;
      List<Movies>? movies =
          movieList.map((tagJson) => Movies.fromJson(tagJson)).toList();
      if (kDebugMode) {
        print(movies.length);
      }
      return movies;
    } else {
      return null;
    }
  }
}

class RemoteServicessearch {
  static Future<List<Movies>?> searchfetchMovies(String movieName) async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed'));
    if (response.statusCode == 200) {
      var titlelist = jsonDecode(response.body)['results'] as List;
      List<Movies>? movies =
          titlelist.map((tagJson) => Movies.fromJson(tagJson)).toList();
      movies.forEach((data) => print(data.title));
      return movies;
    } else {
      return null;
    }
  }
}

class RemoteGetSearch{
  static Future<List<Movies>?> getSearchedMovie(String movieName) async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=pt-BR&query='+movieName));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'] as List;
      List<Movies> _movies = <Movies>[];
      for (var movie in data) {
        _movies.add(Movies.fromJson(movie));
      }
      return _movies;
    } else {
      return null;
    }
  }
}
