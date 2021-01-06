import 'package:get/get.dart';
import 'package:moviemania/model/movielist.dart';
import 'package:moviemania/service/remoteservice.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var movies = Movielist().obs;
  var resultList = List().obs;
  var isresultListLoading = true.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var picture = await RemoteService.fetchhMovies();
      if (picture != null) {
        // print(drop.result);
        isresultListLoading.value = true;
        resultList.addAll(picture.results);
        if (!resultList.isBlank) {
          isresultListLoading.value = false;
        }

        movies.value = picture;
        for (int i = 0; i < movies.value.results.length; i++) {
          print(movies.value.results[i].id);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
