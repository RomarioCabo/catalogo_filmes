import 'package:flutter/cupertino.dart';
import '../../../constants.dart';
import '../../home/components/genres.dart';
import 'categories.dart';
import 'movie_carousel.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  CategoryList(),
                  Genres(),
                  SizedBox(height: kDefaultPadding),
                  Spacer(),
                  MovieCarousel(),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
