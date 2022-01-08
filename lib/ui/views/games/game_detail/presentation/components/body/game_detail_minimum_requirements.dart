import 'package:flutter/material.dart';
import 'package:games_app/ui/views/games/game_detail/data/models/game_detail_model.dart';

class GameDetailMinimumRequirements extends StatelessWidget {
  const GameDetailMinimumRequirements({
    Key? key,
    required this.minimum,
  }) : super(key: key);

  final MinimumSystemRequirementsModel minimum;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).backgroundColor;
    final primaryTextColor = Theme.of(context).textTheme.subtitle1!.color;
    return Card(
      elevation: 10,
      color: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Minimun System Requirements',
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'OS: ${minimum.os}',
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Processor: ${minimum.processor}',
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Memory: ${minimum.memory}',
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Storage: ${minimum.storage}',
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Graphics: ${minimum.graphics}',
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}