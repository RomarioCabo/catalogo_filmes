import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:filmcatalog/shared/model/movie.dart';
import 'package:filmcatalog/shared/repositories/movierepository.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:filmcatalog/shared/repositories/api/helpers/requeststate.dart';

part 'movie_carousel_controller.g.dart';

class MovieCarouselController = MovieCarouselControllerBase
    with _$MovieCarouselController;

abstract class MovieCarouselControllerBase with Store {
  @observable
  RequestState state = Initial();

  @observable
  ObservableList<Movie> movies = ObservableList();

  final MovieRepository _movieRepository = MovieRepository();

  @action
  Future<void> getMovies() async {
    try {
      state = Initial();

      ConnectivityResult result = await Connectivity().checkConnectivity();

      if (result == ConnectivityResult.none) {
        state = NoInternetAccess();
      } else {
        state = Loading();

        await Future.delayed(const Duration(seconds: 1));

        List<String> imdbIds = [
          "tt10872600", // Homem Aranha: Sem Volta para casa
          "tt12361974", // Liga da Justiça de Zack Snyder
          "tt3183660", // Animais Fantásticos e Onde Habitam
          "tt4123430", // Animais Fantásticos: Os Crimes de Grindelwald
          "tt4123432", // Animais Fantásticos: Os Segredos de Dumbledore
          "tt0109830", // Forrest Gump: O Contador de Histórias
          "tt0848228", // The Avengers - Os Vingadores
          "tt2395427", // The Avengers - Era de Ultron
          "tt4154756", // The Avengers - Guerra Infinita
          "tt4154796", // The Avengers - Ultimato
        ];

        for (var idImdb in imdbIds) {
          movies.add(await _movieRepository.getMovie(idImdb));
        }

        state = Completed();
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
      }

      state = Error(error: e.toString());
    }
  }
}
