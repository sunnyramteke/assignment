import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix_flutter/components/card_widget.dart';

import '../controller/movie_controller.dart';

class TopratedScreen extends StatelessWidget {
  final movieController = Get.put(MovieController());

  TopratedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetX<MovieController>(
          builder: (controller) {
            return RefreshIndicator(
              onRefresh: movieController.setTRList,
              child: ListView.builder(
                itemCount: controller.topratedMovies.length,
                itemBuilder: (context, index) {
                  var item = controller.topratedMovies[index];
                  return Dismissible(
                      key: Key(controller.topratedMovies.toString()),
                      onDismissed: (direction) {
                        controller.topratedMovies.removeAt(index);
                      },
                      child: NewCard(item: item));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
