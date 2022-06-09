import 'package:flutter/cupertino.dart';
import '../../../constants.dart';
import '../../home/components/genres.dart';
import 'categories.dart';
import 'movie_carousel.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          CategoryList(),
          Genres(),
          SizedBox(height: kDefaultPadding),
          MovieCarousel(),
        ],
      ),
    );
  }
}
