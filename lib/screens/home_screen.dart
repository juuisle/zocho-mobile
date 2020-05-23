// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'package:zocho_ten_mobile/screens/plant_list_screen.dart';
import 'package:zocho_ten_mobile/screens/setting_screen.dart';
import 'package:zocho_ten_mobile/screens/controller_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.game_controller),
          title: Text('Controller'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          title: Text('Settings'),
        ),
      ]),
      tabBuilder: (context, index) {
        if (index == 0) {
          return PlantListScreen();
        } else if (index == 1) {
          return ControllerScreen();
        } else {
          return SettingScreen();
        }
      },
    );
  }
}
