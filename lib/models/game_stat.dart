import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/enums/mapsize.dart';

class GameStat {
  bool win;
  Difficulty difficulty;
  MapSize mapSize;
  DateTime gameStarted;
  Duration gameDuration;
  int flips;

  GameStat(
      {required this.win,
      required this.difficulty,
      required this.mapSize,
      required this.gameStarted,
      required this.gameDuration,
      required this.flips});

  factory GameStat.fromJson(Map<String, dynamic> json) {
    bool win = json['win'] as bool;
    Difficulty difficulty = _getDifficultyFromString(json['difficulty']);
    MapSize mapSize = _getMapSizeFromString(json['mapSize']);
    DateTime gameStarted = DateTime.parse(json['gameStarted']);
    Duration gameDuration = Duration(milliseconds: json['gameDuration']);
    int flips = json['flips'] as int;

    return GameStat(
        win: win,
        difficulty: difficulty,
        mapSize: mapSize,
        gameStarted: gameStarted,
        gameDuration: gameDuration,
        flips: flips);
  }

  Map<String, dynamic> toJson() => {
        'win': win,
        'difficulty': difficulty.toString(),
        'mapSize': mapSize.toString(),
        'gameStarted': gameStarted.toString(),
        'gameDuration': gameDuration.inMilliseconds,
        'flips': flips
      };

  static Difficulty _getDifficultyFromString(String difficultyString) {
    for (Difficulty element in Difficulty.values) {
      if (element.toString() == difficultyString) {
        return element;
      }
    }
    return Difficulty.intermediate;
  }

  static MapSize _getMapSizeFromString(String mapSizeString) {
    for (MapSize element in MapSize.values) {
      if (element.toString() == mapSizeString) {
        return element;
      }
    }
    return MapSize.fourxfour;
  }
}
