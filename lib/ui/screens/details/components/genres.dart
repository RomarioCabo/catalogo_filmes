import 'package:flutter/material.dart';
import '../../../components/genre_card.dart';
import '../../../constants.dart';
import '../../../models/movie.dart';

class Genres extends StatelessWidget {
  final Movie? movie;

  const Genres({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie?.genra.length,
          itemBuilder: (context, index) => GenreCard(
            genre: movie?.genra[index],
          ),
        ),
      ),
    );
  }
}
