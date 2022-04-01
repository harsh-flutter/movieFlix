import 'package:MovieFlix/models/movies.dart';
import 'package:MovieFlix/screen/MoviesDetails.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MovieTile extends StatelessWidget {
  final Movies movie;

  const MovieTile(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MovieDetails(movie)));
          },
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 200,
                      width: 100,
                      child: Image.network(
                          'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/${movie.poster_path}')),
                  Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 200,
                          child: Text(
                            movie.title,
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        // IconButton(
                        //     onPressed: () {}, icon: Icon(Icons.delete))

                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            movie.overview,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void title() {
    final userdata = GetStorage();
    userdata.write("movietitle", movie.title);
  }
}
