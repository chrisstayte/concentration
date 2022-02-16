import 'package:concentration/enums/mapsize.dart';
import 'package:concentration/global/global.dart';
import 'package:flutter/material.dart';

typedef MapCallback(MapSize mapSize);

class MapCard extends StatelessWidget {
  MapCard(
      {Key? key,
      required this.selected,
      required this.mapCallback,
      required this.mapSize})
      : super(key: key);

  final bool selected;
  final MapSize mapSize;
  final MapCallback mapCallback;

  late final _title = mapSize == MapSize.fourxfour
      ? '4x4'
      : mapSize == MapSize.fivexsix
          ? '5x6'
          : '6x8';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 208,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
            color: selected
                ? Global.colors.darkIconColor
                : Global.colors.lightIconColor,
          ),
          child: Center(
            child: SizedBox(
              width: 92,
              height: 200,
              child: GestureDetector(
                onTap: () => (mapCallback(mapSize)),
                child: Card(
                  color: Global.colors.lightIconColorDarker,
                  margin: EdgeInsets.zero,
                  child: Image.asset(
                    'assets/images/map_$_title.png',
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: selected,
          child: Text(
            _title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
