import 'package:MovieFlix/controller/star_movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MovieFlix/screen/movietile.dart';
import 'package:MovieFlix/widget/bottom_navigation.dart';
import 'package:MovieFlix/widget/widget.dart';

class TopRatedMoviesScreen extends StatefulWidget {
  const TopRatedMoviesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TopMoviesScreenState();
}

class _TopMoviesScreenState extends State<TopRatedMoviesScreen> {
  final StarMovieController movieController = Get.put(StarMovieController());

  @override
  void initState() {
    movieController.loading = true;
    movieController.starfetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Rated",
          style: themeData.textTheme.headline1,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetBuilder(builder: (StarMovieController controller) {
            return (controller.loading)
                ? Container()
                : Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.starmoviesList.length,
                      itemBuilder: (context, index) {
                        return MovieTile(
                            movieController.starmoviesList[index]);
                      },
                    ),
                  );
          })
        ],
      ),
      bottomNavigationBar: const bottomNavigationBar(),
    );
  }

}
