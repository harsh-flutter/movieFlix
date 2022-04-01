import 'package:MovieFlix/controller/movies_controller.dart';
import 'package:MovieFlix/screen/movietile.dart';
import 'package:MovieFlix/screen/searched_movies.dart';
import 'package:MovieFlix/widget/bottom_navigation.dart';
import 'package:MovieFlix/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopMoviesScreen extends StatefulWidget {
  const TopMoviesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TopMoviesScreenState();
}

class _TopMoviesScreenState extends State<TopMoviesScreen> {
  final MovieController movieController = Get.put(MovieController());

  @override
  void initState() {
    movieController.loading = true;
    movieController.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListTile(
                title: Text("MovieFlix", style: themeData.textTheme.headline1),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SearchMoviePage()));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
            GetBuilder(
              builder: (MovieController controller) {
                return (controller.loading)
                    ? Container()
                    : Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.moviesList.length,
                          itemBuilder: (context, index) {
                            return MovieTile(movieController.moviesList[index]);
                          },
                        ),
                      );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: const bottomNavigationBar(),
    );
  }
}
