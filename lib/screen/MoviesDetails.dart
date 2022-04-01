import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MovieFlix/controller/movies_controller.dart';
import 'package:MovieFlix/models/movies.dart';

class MovieDetails extends StatefulWidget {
  final Movies movie;

  const MovieDetails(this.movie, {Key? key}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.movie.title,
          style: themeData.textTheme.headline2,
        ),centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
          image: NetworkImage(
              'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/${widget.movie.poster_path}'),
          fit: BoxFit.fill,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: themeData.textTheme.headline2,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      '${widget.movie.release_date.year.toString().padLeft(4, '0')}-${widget.movie.release_date.month.toString().padLeft(2, '0')}-${widget.movie.release_date.day.toString().padLeft(2, '0')}',
                      style: (themeData.textTheme.headline3),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      widget.movie.overview,
                      style: (themeData.textTheme.headline3),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
