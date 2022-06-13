import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants.dart';

class MovieCarouselLoader extends StatefulWidget {
  final TickerProvider vsync;

  const MovieCarouselLoader({required this.vsync, Key? key}) : super(key: key);

  @override
  State<MovieCarouselLoader> createState() => _MovieCarouselLoaderState();
}

class _MovieCarouselLoaderState extends State<MovieCarouselLoader> {
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: kSecondaryColor,
      size: 50.0,
      controller: AnimationController(
        vsync: widget.vsync,
        duration: const Duration(milliseconds: 1200),
      ),
    );
  }
}
