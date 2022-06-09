import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/movie.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  final Movie? movie;

  const TitleDurationAndFabBtn({
    Key? key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      backgroundColor: kSecondaryColor,
    );

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie!.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      '${movie!.year}',
                      style: const TextStyle(color: kTextLightColor),
                    ),
                    const SizedBox(width: kDefaultPadding),
                    const Text(
                      "PG-13",
                      style: TextStyle(color: kTextLightColor),
                    ),
                    const SizedBox(width: kDefaultPadding),
                    const Text(
                      "2h 32min",
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: TextButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: const Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
