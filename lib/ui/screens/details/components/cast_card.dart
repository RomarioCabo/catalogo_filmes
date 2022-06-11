import 'package:flutter/material.dart';
import '../../../constants.dart';

class CastCard extends StatelessWidget {
  final String? cast;

  const CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: kDefaultPadding),
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            maxRadius: 40.0,
            child: Text(
              cast![0].toUpperCase(),
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            cast!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
