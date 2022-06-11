import 'package:filmcatalog/ui/screens/details/components/body.dart';
import 'package:flutter/material.dart';
import '../../../shared/model/movie.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({required this.movie, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(movie: movie),
    );
  }
}
