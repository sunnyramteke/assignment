import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix_flutter/components/search_widget.dart';
import 'package:movie_flix_flutter/controller/movie_controller.dart';
import 'package:movie_flix_flutter/view/nowplaying_screen.dart';
import 'package:movie_flix_flutter/view/toprated_screen.dart';

import '../controller/navigation_controller.dart';

class NavigationBarScreen extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());
  final MovieController movieController = Get.put(MovieController());

  final screens = [
    NowplayingScreen(),
    TopratedScreen(),
  ];

  NavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mytheme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: SearchBar(onTextChange: (value) {
            movieController.filterNowPlaying(value);
            movieController.filterToprated(value);

            //print(value);
          }),
        ),
        body: Obx(
          () => IndexedStack(
            index: navigationController.selectedIndex.value,
            children: screens,
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: mytheme.primaryColor,
            selectedItemColor: mytheme.primaryColorDark,
            unselectedItemColor: mytheme.unselectedWidgetColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              navigationController.changeIndex(index);
            },
            currentIndex: navigationController.selectedIndex.value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie_sharp,
                ),
                label: 'Now Playing',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Top Rated',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
