// ignore_for_file: camel_case_types

import 'package:MovieFlix/screen/screens.dart';
import 'package:MovieFlix/screen/top_rated_movies.dart';
import 'package:flutter/material.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 60,
        width: 100,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TopMoviesScreen()));
                  },
                  icon: const Icon(
                    Icons.home,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TopRatedMoviesScreen()));
                    // Navigator.of(context).pop(TopRatedMoviesScreen());
                  },
                  icon: const Icon(
                    Icons.star,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
