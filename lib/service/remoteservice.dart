import 'package:http/http.dart' as http;
import 'package:moviemania/model/movielist.dart';

class RemoteService {
  static var client = http.Client();
  static String url =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=a3a6e6a1495f51e15b267ba9c0d6d224&language=en-US&page=1";
  static Future<Movielist> fetchhMovies() async {
    var response = await client.get(url);
    if (response.statusCode == 200) {
      print(response);
      return movielistFromJson(response.body);
    }
    return Movielist();
  }
}
