import 'package:filmcatalog/shared/model/movie.dart';
import 'package:filmcatalog/shared/repositories/api/helpers/apibasehelper.dart';
import 'package:flutter/foundation.dart';

class MovieRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Movie> getMovie(String imdbId) async {
    try {
      final response = await _helper.get(imdbId: imdbId);

      return Movie.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      throw Exception(e);
    }
  }
}
