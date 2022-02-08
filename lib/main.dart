import 'package:concentration/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'global/global.dart';

void main() {
  runApp(const MyApp());
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
      home: const Homescreen(),
    );
  }
}
