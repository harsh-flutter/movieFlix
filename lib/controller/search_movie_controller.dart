import 'package:MovieFlix/models/movies.dart';
import 'package:MovieFlix/services/remoteservices.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SearchMovieController extends GetxController {
  List<Movies> searchMovies=<Movies>[];
  bool loading = false;
  void getSearchedMovie(String movieName) async{
    loading=true;
    var _movies=await RemoteGetSearch.getSearchedMovie(movieName);
    if(_movies!=null){
      searchMovies=_movies.toList();
      print(searchMovies);

    }
    loading=false;
  }

  List<Movies> moviesList = [];

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
