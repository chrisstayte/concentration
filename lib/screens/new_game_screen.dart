import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/enums/gametheme.dart';
import 'package:concentration/enums/mapsize.dart';
import 'package:concentration/global/global.dart';
import 'package:concentration/screens/game_screen.dart';
import 'package:concentration/widgets/difficulty_card.dart';
import 'package:concentration/widgets/main_button.dart';
import 'package:concentration/widgets/map_card.dart';
import 'package:concentration/widgets/theme_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({Key? key}) : super(key: key);

  @override
  _NewGameScreenState createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  MapSize _mapSize = MapSize.fourxfour;
  Difficulty _difficulty = Difficulty.easy;
  GameTheme _gameTheme = GameTheme.concentration;

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MapCard(
                    mapSize: MapSize.fourxfour,
                    selected: _mapSize == MapSize.fourxfour,
                    mapCallback: (mapSize) =>
                        setState(() => _mapSize = mapSize),
                  ),
                  MapCard(
                    mapSize: MapSize.fivexsix,
                    selected: _mapSize == MapSize.fivexsix,
                    mapCallback: (mapSize) =>
                        setState(() => _mapSize = mapSize),
                  ),
                  MapCard(
                    mapSize: MapSize.sixxeight,
                    selected: _mapSize == MapSize.sixxeight,
                    mapCallback: (mapSize) =>
                        setState(() => _mapSize = mapSize),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DifficultyCard(
                    difficulty: Difficulty.easy,
                    selected: _difficulty == Difficulty.easy,
                    difficultyCallback: (difficulty) => setState(
                      () => _difficulty = difficulty,
                    ),
                  ),
                  DifficultyCard(
                    difficulty: Difficulty.intermediate,
                    selected: _difficulty == Difficulty.intermediate,
                    difficultyCallback: (difficulty) => setState(
                      () => _difficulty = difficulty,
                    ),
                  ),
                  DifficultyCard(
                    difficulty: Difficulty.hard,
                    selected: _difficulty == Difficulty.hard,
                    difficultyCallback: (difficulty) => setState(
                      () => _difficulty = difficulty,
                    ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ThemeCard(
                    selected: _gameTheme == GameTheme.concentration,
                    gameTheme: GameTheme.concentration,
                    gameThemeCallback: (gameTheme) => setState(
                      () => _gameTheme = gameTheme,
                    ),
                  ),
                  ThemeCard(
                    selected: _gameTheme == GameTheme.olive,
                    gameTheme: GameTheme.olive,
                    gameThemeCallback: (gameTheme) => setState(
                      () => _gameTheme = gameTheme,
                    ),
                  ),
                  ThemeCard(
                    selected: _gameTheme == GameTheme.retro,
                    gameTheme: GameTheme.retro,
                    gameThemeCallback: (gameTheme) => setState(
                      () => _gameTheme = gameTheme,
                    ),
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
                          Icons.cancel_outlined,
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
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GameScreen(),
                        ),
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
