import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviemania/controllers/moviecontroller.dart';

class HomeScreen extends StatelessWidget {
  final movieController = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Obx(
                  () {
                    if (movieController.isLoading.value)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else
                      return Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount:
                              movieController.movies.value.results.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    title: Text(movieController.movies.value
                                        .results[index].originalTitle),
                                    subtitle: Text(movieController
                                        .movies.value.results[index].title),
                                    trailing: Text(movieController.movies.value
                                        .results[index].originalLanguage),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
