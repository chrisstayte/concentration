import 'package:concentration/global/global.dart';
import 'package:concentration/models/game_stat.dart';
import 'package:concentration/providers/game_stats_provider.dart';
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
      body: ListView.builder(
        itemCount: context.read<GameStatsProvider>().gameStats.length,
        itemBuilder: (BuildContext context, int index) {
          GameStat stat = context.read<GameStatsProvider>().gameStats[index];
          return SizedBox(
            height: 44,
            child: Card(
              color: Global.colors.darkIconColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      stat.win ? Icons.emoji_events : Icons.cancel_rounded,
                      color: stat.win ? Color(0XFFF6D100) : Color(0XFFF25C54),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.white),
                        Icon(Icons.star, color: Colors.white),
                        Icon(Icons.star, color: Colors.white),
                      ],
                    ),
                    Text(
                      '4x4',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      stat.gameDuration.inMinutesSeconds(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
