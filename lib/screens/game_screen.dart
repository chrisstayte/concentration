import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/enums/gametheme.dart';
import 'package:concentration/enums/mapsize.dart';
import 'package:concentration/global/global.dart';
import 'package:concentration/providers/settings_provider.dart';
import 'package:concentration/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Widget> getCards() {
    return <Widget>[Text('test')];
  }

  late var _rows;
  late var _columns;

  List<bool> _showTopOfCard = [];
  List<bool> _solved = [];
  List<int> _cardBottoms = [];

  @override
  void didChangeDependencies() {
    MapSize mapSize = context.read<SettingsProvider>().mapSize;
    _rows = mapSize == MapSize.fourxfour
        ? 4
        : mapSize == MapSize.fivexsix
            ? 6
            : 8;
    _columns = mapSize == MapSize.fourxfour
        ? 4
        : mapSize == MapSize.fivexsix
            ? 5
            : 6;

    _showTopOfCard = List.filled(_rows * _columns, true);
    _solved = List.filled(_rows * _columns, false);

    int uniqueCardCount = (_columns * _rows / 2).round();

    _cardBottoms = (List.generate(uniqueCardCount, (index) => index) +
        List.generate(uniqueCardCount, (index) => index));

    _cardBottoms.shuffle();

    super.didChangeDependencies();
  }

  Widget _buildCard(bool showTop, Color? color, int index) {
    String themeName = context.read<SettingsProvider>().gameTheme.name;
    return Padding(
      key: ValueKey(showTop),
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          gradient: showTop
              ? Global.gameThemeGradients
                  .gradients[context.read<SettingsProvider>().gameTheme]
              : null,
        ),
        child: Center(
          child: showTop
              ? SvgPicture.asset('assets/images/$themeName.svg')
              : SvgPicture.asset(
                  'assets/images/$themeName/${_cardBottoms[index]}.svg',
                  height: 24,
                  width: 24,
                ),
        ),
      ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = widget!.key != ValueKey(false);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFlipAnimation(int index) {
    bool showTopOfCard = _showTopOfCard[index];
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => setState(
          () => _showTopOfCard[index] = !_showTopOfCard[index],
        ),
        child: AnimatedSwitcher(
          layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
          transitionBuilder: _transitionBuilder,
          duration: const Duration(milliseconds: 250),
          child: _buildCard(showTopOfCard, Colors.green, index),
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeInBack.flipped,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(children: [
              //_buildFlipAnimation(0),
              Expanded(
                child: Column(
                  children: List.generate(
                    _rows,
                    (index) => Expanded(
                      child: Row(
                        children: List.generate(
                          _columns,
                          (index2) =>
                              _buildFlipAnimation(_columns * index + index2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        height: 55,
                        child: GestureDetector(
                          onTap: () => Navigator.popUntil(
                            context,
                            ModalRoute.withName('/'),
                          ),
                          child: Card(
                            elevation: 4,
                            margin: EdgeInsets.zero,
                            color: Color(0XFFF25C54),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
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
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 55,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0XFF323031),
                        ),
                        child: const Center(
                          child: Text(
                            '4:00',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: 55,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Color(0XFF323031),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'Flips',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
