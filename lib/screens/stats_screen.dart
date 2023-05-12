import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/enums/mapsize.dart';
import 'package:concentration/global/global.dart';
import 'package:concentration/models/game_stat.dart';
import 'package:concentration/providers/game_stats_provider.dart';
import 'package:concentration/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stats'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(children: [
          const Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                    child: Text('Win',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text('Difficulty',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                    child: Text('Map',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
              Expanded(
                flex: 1,
                child: Center(
                    child: Text('Time',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13))),
              ),
              Expanded(
                flex: 1,
                child: Center(
                    child: Text('Flips',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13))),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<GameStatsProvider>().gameStats.length,
              itemBuilder: (BuildContext context, int index) {
                GameStat stat =
                    context.read<GameStatsProvider>().gameStats[index];
                return SizedBox(
                  height: 54,
                  child: Card(
                    color: Global.colors.darkIconColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Icon(
                              stat.win
                                  ? Icons.emoji_events
                                  : Icons.cancel_rounded,
                              size: 32,
                              color: stat.win
                                  ? const Color(0XFFF6D100)
                                  : const Color(0XFFF25C54),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star, color: Colors.white),
                                Icon(
                                  stat.difficulty == Difficulty.intermediate ||
                                          stat.difficulty == Difficulty.hard
                                      ? Icons.star
                                      : Icons.star_outline,
                                  color: Colors.white,
                                ),
                                Icon(
                                  stat.difficulty == Difficulty.hard
                                      ? Icons.star
                                      : Icons.star_outline,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              stat.mapSize == MapSize.fourxfour
                                  ? '4x4'
                                  : stat.mapSize == MapSize.fivexsix
                                      ? '5x6'
                                      : '6x8',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              stat.gameDuration.toMinutesSeconds(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              stat.flips.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
