import 'package:flutter/material.dart';

import 'package:hackathon/common.dart';
import 'package:hackathon/localisation/views/map_utils.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: TextButton(
          onPressed: () {
            MapUtils.openMap(14.6573471, -17.4367247);
          },
          child: Text('open map'),
          style: TextButton.styleFrom(backgroundColor: Pcol),
        ),
      )),
    );
  }
}
