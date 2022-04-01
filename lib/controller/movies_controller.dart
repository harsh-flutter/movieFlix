import 'package:get/state_manager.dart';
import 'package:MovieFlix/models/movies.dart';
import 'package:MovieFlix/services/remoteservices.dart';

class MovieController extends GetxController {
  List<Movies> moviesList = [];

  bool loading = false;

  void fetchMovies() async {
    loading = true;
    List<Movies>? movies = await RemoteServices.fetchMovies();
    print('Movies :: $movies');
    if (movies != null) {
      moviesList = movies;
      loading = false;
    }
    update();
  }
}
