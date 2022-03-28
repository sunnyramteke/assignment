import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix_flutter/controller/movie_controller.dart';

import '../components/card_widget.dart';

class NowplayingScreen extends StatelessWidget {
  final movieController = Get.put(MovieController());

  NowplayingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetX<MovieController>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: movieController.setNPList,
            child: ListView.builder(
              itemCount: controller.nowplayingMovies.length,
              itemBuilder: (context, index) {
                var item = controller.nowplayingMovies[index];
                return Dismissible(
                  key: Key(controller.nowplayingMovies.toString()),
                  onDismissed: (direction) {
                    controller.nowplayingMovies.removeAt(index);
                  },
                  child: NewCard(item: item),
                );
              },
            ),
          );
        },
      ),
    ));
  }
}
