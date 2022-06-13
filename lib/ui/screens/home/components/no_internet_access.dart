import 'package:filmcatalog/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'movie_carousel_controller.dart';

class NoInternetAccessPage extends StatefulWidget {
  const NoInternetAccessPage({Key? key}) : super(key: key);

  @override
  State<NoInternetAccessPage> createState() => _NoInternetAccessPageState();
}

class _NoInternetAccessPageState extends State<NoInternetAccessPage> {
  late MovieCarouselController _carouselController;

  /// Reactions
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          const Icon(
            Icons.signal_wifi_connected_no_internet_4,
            color: kSecondaryColor,
            size: 168.0,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            'Ooops!',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 44,
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            'No internet connection found!',
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            'Check your connection.',
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              primary: kSecondaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              _carouselController.getMovies();
            },
            child: const Text(
              'Try again',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
