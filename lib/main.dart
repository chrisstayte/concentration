import 'package:concentration/providers/settings_provider.dart';
import 'package:concentration/screens/game_screen.dart';
import 'package:concentration/screens/home_screen.dart';
import 'package:concentration/screens/new_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'global/global.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(
          create: (_) => SettingsProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Global.colors.lightIconColor,
        appBarTheme: AppBarTheme(backgroundColor: Global.colors.lightIconColor),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Homescreen(),
        '/newGame': (context) => NewGameScreen(),
        '/game': (context) => GameScreen(),
      },
    );
  }
}
