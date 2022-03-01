import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/enums/gametheme.dart';
import 'package:concentration/enums/mapsize.dart';
import 'package:concentration/global/global.dart';
import 'package:concentration/providers/settings_provider.dart';
import 'package:concentration/screens/game_screen.dart';
import 'package:concentration/widgets/difficulty_card.dart';
import 'package:concentration/widgets/main_button.dart';
import 'package:concentration/widgets/map_card.dart';
import 'package:concentration/widgets/theme_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({Key? key}) : super(key: key);

  @override
  _NewGameScreenState createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Map',
                    style: TextStyle(
                        color: Global.colors.darkIconColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MapCard(
                    mapSize: MapSize.fourxfour,
                    selected: context.watch<SettingsProvider>().mapSize ==
                        MapSize.fourxfour,
                    mapCallback: (mapSize) =>
                        context.read<SettingsProvider>().setMapSize(mapSize),
                  ),
                  MapCard(
                    mapSize: MapSize.fivexsix,
                    selected: context.watch<SettingsProvider>().mapSize ==
                        MapSize.fivexsix,
                    mapCallback: (mapSize) =>
                        context.read<SettingsProvider>().setMapSize(mapSize),
                  ),
                  MapCard(
                    mapSize: MapSize.sixxeight,
                    selected: context.watch<SettingsProvider>().mapSize ==
                        MapSize.sixxeight,
                    mapCallback: (mapSize) =>
                        context.read<SettingsProvider>().setMapSize(mapSize),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Difficulty',
                    style: TextStyle(
                        color: Global.colors.darkIconColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DifficultyCard(
                    difficulty: Difficulty.easy,
                    selected: context.watch<SettingsProvider>().difficulty ==
                        Difficulty.easy,
                    difficultyCallback: (difficulty) => context
                        .read<SettingsProvider>()
                        .setDifficulty(difficulty),
                  ),
                  DifficultyCard(
                    difficulty: Difficulty.intermediate,
                    selected: context.watch<SettingsProvider>().difficulty ==
                        Difficulty.intermediate,
                    difficultyCallback: (difficulty) => context
                        .read<SettingsProvider>()
                        .setDifficulty(difficulty),
                  ),
                  DifficultyCard(
                    difficulty: Difficulty.hard,
                    selected: context.watch<SettingsProvider>().difficulty ==
                        Difficulty.hard,
                    difficultyCallback: (difficulty) => context
                        .read<SettingsProvider>()
                        .setDifficulty(difficulty),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Theme',
                    style: TextStyle(
                        color: Global.colors.darkIconColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ThemeCard(
                    selected: context.watch<SettingsProvider>().gameTheme ==
                        GameTheme.concentration,
                    gameTheme: GameTheme.concentration,
                    gameThemeCallback: (gameTheme) => context
                        .read<SettingsProvider>()
                        .setGameTheme(gameTheme),
                  ),
                  ThemeCard(
                    selected: context.watch<SettingsProvider>().gameTheme ==
                        GameTheme.olive,
                    gameTheme: GameTheme.olive,
                    gameThemeCallback: (gameTheme) => context
                        .read<SettingsProvider>()
                        .setGameTheme(gameTheme),
                  ),
                  ThemeCard(
                    selected: context.watch<SettingsProvider>().gameTheme ==
                        GameTheme.retro,
                    gameTheme: GameTheme.retro,
                    gameThemeCallback: (gameTheme) => context
                        .read<SettingsProvider>()
                        .setGameTheme(gameTheme),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      width: 77,
                      height: 77,
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.zero,
                        color: Color(0XFFF25C54),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        child: Icon(
                          Icons.cancel_rounded,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MainButton(
                      title: 'Play',
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/game',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
