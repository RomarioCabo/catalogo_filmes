import 'package:flutter/material.dart';
import '../../../components/genre_card.dart';
import '../../../constants.dart';
import '../../../../shared/model/movie.dart';

class Genres extends StatelessWidget {
  final Movie movie;

  const Genres({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> genres = _getGenres(movie.genre!);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) => GenreCard(
            genre: genres[index],
          ),
        ),
      ),
    );
  }

  List<String> _getGenres(String genre) {
    return genre.split(",");
  }
}
