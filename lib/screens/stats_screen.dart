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
        title: Text('Stats'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(child: Text('Win/Lose')),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('Difficulty')),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('Map')),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('Time Elapsed')),
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
                  height: 44,
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
                              color: stat.win
                                  ? Color(0XFFF6D100)
                                  : Color(0XFFF25C54),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.white),
                                Icon(Icons.star, color: Colors.white),
                                Icon(Icons.star, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              '4x4',
                              style: TextStyle(
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
                              style: TextStyle(
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
