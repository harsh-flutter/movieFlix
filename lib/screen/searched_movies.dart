import 'package:MovieFlix/controller/search_movie_controller.dart';
import 'package:MovieFlix/models/movies.dart';
import 'package:MovieFlix/screen/movietile.dart';
import 'package:MovieFlix/widget/bottom_navigation.dart';
import 'package:MovieFlix/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

List<Movies>? results = [];

final searchcontroller = TextEditingController();
final userdata = GetStorage();
String searchedmovieread = userdata.read("searchedmovie");

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchMoviePage();
}

class _SearchMoviePage extends State<SearchMoviePage> {
  final SearchMovieController searchmovieController =
      Get.put(SearchMovieController());

  @override
  void initState() {
    searchmovieController.loading = true;
    searchmovieController.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: themeData.textTheme.headline1,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: searchcontroller,
              onChanged: (searchcontroller) {
                userdata.write("searchedmovie", searchcontroller);
                searchmovieController.fetchMovies();
                setState(() {
                  searchmovieController.getSearchedMovie(searchcontroller);
                });

                GetBuilder(builder: (SearchMovieController controller) {
                  return (controller.loading)
                      ? Container()
                      : Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.searchMovies.length,
                            itemBuilder: (context, index) {
                              return MovieTile(
                                  controller.searchMovies[index.toInt()]);
                            },
                          ),
                        );
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                labelText: "Enter Movie Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              style: themeData.textTheme.headline2,
            ),
            GetBuilder(builder: (SearchMovieController controller) {
              return (controller.loading)
                  ? Container()
                  : Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.searchMovies.length,
                        itemBuilder: (context, index) {
                          return MovieTile(controller.searchMovies[index]);
                        },
                      ),
                    );
            })
          ],
        ),
      ),
      bottomNavigationBar: const bottomNavigationBar(),
    );
  }
}
