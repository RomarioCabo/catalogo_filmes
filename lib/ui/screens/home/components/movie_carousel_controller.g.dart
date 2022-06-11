// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_carousel_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieCarouselController on MovieCarouselControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'MovieCarouselControllerBase.state', context: context);

  @override
  RequestState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(RequestState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$moviesAtom =
      Atom(name: 'MovieCarouselControllerBase.movies', context: context);

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$getMoviesAsyncAction =
      AsyncAction('MovieCarouselControllerBase.getMovies', context: context);

  @override
  Future<void> getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  @override
  String toString() {
    return '''
state: ${state},
movies: ${movies}
    ''';
  }
}
