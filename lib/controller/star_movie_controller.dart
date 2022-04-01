import 'package:MovieFlix/models/movies.dart';
import 'package:MovieFlix/services/remoteservices.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StarMovieController extends GetxController {
  List<Movies> starmoviesList = [];

  bool loading = false;

  void starfetchMovies() async {
    loading = true;
    List<Movies>? movies = await RemoteServicesstar.starfetchMovies();

    if (movies != null) {
      print('Movies :: $movies');
      starmoviesList = movies;
      loading = false;
    }

    update();
  }
}
