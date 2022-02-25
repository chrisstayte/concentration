import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/global/global.dart';
import 'package:concentration/models/game_stat.dart';
import 'package:concentration/screens/game_screen.dart';
import 'package:concentration/utilities/extensions.dart';
import 'package:flutter/material.dart';

class EndGameDialog extends StatelessWidget {
  const EndGameDialog({Key? key, required this.stat}) : super(key: key);

  final GameStat stat;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 375,
        child: Stack(
          children: [
            Container(
              width: 250,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Global.colors.lightIconColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        stat.win
                            ? Icons.emoji_events
                            : Icons.sentiment_dissatisfied,
                        size: 50,
                        color: stat.win ? const Color(0XFFF6D100) : null,
                      ),
                      Text(
                        stat.win ? 'You Win' : 'You Lose',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time Used',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            stat.gameDuration.toMinutesSeconds(),
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Flips',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            stat.flips.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Matches',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            stat.correct.toString(),
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Difficulty',
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star),
                              Icon(stat.difficulty != Difficulty.easy
                                  ? Icons.star
                                  : Icons.star_outline),
                              Icon(
                                stat.difficulty == Difficulty.hard
                                    ? Icons.star
                                    : Icons.star_outline,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 25,
              child: GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/', (_) => false),
                child: Container(
                  width: 75,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.red,
                  ),
                  child: const Icon(
                    Icons.cancel_rounded,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 150,
              child: GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/game',
                    ModalRoute.withName(
                        '/newGame') // Replace this with your root screen's route name (usually '/')
                    ),
                child: Container(
                  width: 75,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.yellow.shade800),
                  child: const Icon(
                    Icons.replay_rounded,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
