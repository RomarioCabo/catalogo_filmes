import 'package:filmcatalog/shared/repositories/api/helpers/requeststate.dart';
import 'package:filmcatalog/ui/screens/home/components/movie_carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'dart:math' as math;
import '../../../constants.dart';
import 'movie_card.dart';
import 'movie_carousel_loader.dart';
import 'no_internet_access.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({Key? key}) : super(key: key);

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel>
    with TickerProviderStateMixin {
  late MovieCarouselController _carouselController;

  /// Reactions
  final List<ReactionDisposer> _disposers = [];

  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );

    _carouselController = GetIt.I<MovieCarouselController>();
    _carouselController.getMovies();

    _disposers.add(
      reaction((_) => _carouselController.state, (_) => ''),
    );
  }

  @override
  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }

    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (_carouselController.state is Loading) {
          return MovieCarouselLoader(
            vsync: this,
          );
        } else if (_carouselController.state is NoInternetAccess) {
          return const NoInternetAccessPage();
        } else if (_carouselController.state is Completed) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    initialPage = value;
                  });
                },
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                itemCount: _carouselController.movies.length,
                itemBuilder: (context, index) => _buildMovieSlider(index),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page!;
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(movie: _carouselController.movies[index]),
            ),
          );
        },
      );
}
