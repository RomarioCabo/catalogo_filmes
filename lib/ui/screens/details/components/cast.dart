import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'cast_card.dart';

class Cast extends StatelessWidget {
  final List<String>? casts;

  const Cast({Key? key, required this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: kDefaultPadding),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts?.length,
              itemBuilder: (context, index) =>
                  CastCard(cast: _removeEmptySpaces(casts![index])),
            ),
          )
        ],
      ),
    );
  }

  String _removeEmptySpaces(String name) {
    if (name.startsWith(" ")) {
      return  name.replaceRange(0, 1, "");
    }

    return name;
  }
}
