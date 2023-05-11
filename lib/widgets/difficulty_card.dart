import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/global/global.dart';
import 'package:concentration/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef DifficultyCallback = Function(Difficulty difficulty);

class DifficultyCard extends StatelessWidget {
  DifficultyCard(
      {Key? key,
      required this.difficulty,
      required this.selected,
      required this.difficultyCallback})
      : super(key: key);

  final bool selected;
  final Difficulty difficulty;
  final DifficultyCallback difficultyCallback;
  late final _backgroundColor = difficulty == Difficulty.easy
      ? const Color(0XFF4C956c)
      : difficulty == Difficulty.intermediate
          ? const Color(0XFFFCBC5D)
          : const Color(0XFFC1121F);

  late final _underTitle = difficulty == Difficulty.easy
      ? "Smooth Brain"
      : difficulty == Difficulty.intermediate
          ? "GGEZ"
          : "Big Brain";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 112,
          height: 87,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(4.0),
            ),
            color: selected
                ? Global.colors.darkIconColor
                : Global.colors.lightIconColor,
          ),
          child: Center(
            child: SizedBox(
              width: 105,
              height: 80,
              child: GestureDetector(
                onTap: () {
                  difficultyCallback(difficulty);
                  HapticFeedback.mediumImpact();
                },
                child: Card(
                  margin: EdgeInsets.zero,
                  color: _backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          Icon(
                            difficulty == Difficulty.intermediate ||
                                    difficulty == Difficulty.hard
                                ? Icons.star
                                : Icons.star_outline,
                            color: Colors.white,
                          ),
                          Icon(
                            difficulty == Difficulty.hard
                                ? Icons.star
                                : Icons.star_outline,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        difficulty.name.capitalize(),
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // SizedBox(
        //   height: 3,
        // ),
        // Visibility(
        //   maintainSize: true,
        //   maintainAnimation: true,
        //   maintainState: true,
        //   visible: selected,
        //   child: Text(
        //     _underTitle,
        //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        //   ),
        // ),
      ],
    );
  }
}
