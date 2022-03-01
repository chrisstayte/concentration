import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/enums/gametheme.dart';
import 'package:concentration/enums/mapsize.dart';
import 'package:concentration/widgets/difficulty_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  MapSize _mapSize = MapSize.fourxfour;
  MapSize get mapSize => _mapSize;

  GameTheme _gameTheme = GameTheme.concentration;
  GameTheme get gameTheme => _gameTheme;

  Difficulty _difficulty = Difficulty.easy;
  Difficulty get difficulty => _difficulty;

  late SharedPreferences prefs;

  SettingsProvider() {
    setup();
  }

  void setup() async {
    prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _mapSize = MapSize.values.byName(
      prefs.getString('mapSize') ?? MapSize.fourxfour.name,
    );
    _gameTheme = GameTheme.values.byName(
      prefs.getString('gameTheme') ?? GameTheme.concentration.name,
    );
    _difficulty = Difficulty.values.byName(
      prefs.getString('difficulty') ?? 'easy',
    );
    notifyListeners();
  }

  void setDarkMode(bool isDarkMode) async {
    _isDarkMode = isDarkMode;

    await prefs.setBool('isDarkMode', isDarkMode);

    notifyListeners();
  }

  void setMapSize(MapSize mapSize) async {
    _mapSize = mapSize;

    await prefs.setString('mapSize', mapSize.name);

    notifyListeners();
  }

  void setGameTheme(GameTheme gameTheme) async {
    _gameTheme = gameTheme;

    await prefs.setString('gameTheme', gameTheme.name);

    notifyListeners();
  }

  void setDifficulty(Difficulty difficulty) async {
    _difficulty = difficulty;

    await prefs.setString('difficulty', difficulty.name);

    notifyListeners();
  }
}
