/*------------------------------------------------------------------------------
Zocho-Ten Smart Garden EcoSystem 

The MIT License (MIT)
Copyright © 2020 Juuis Le

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the “Software”), to deal in 
the Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the 
Software, and to permit persons to whom the Software is furnished to do so, 
subject to the following conditions: The above copyright notice and this permission 
notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR 
A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS 
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF 
OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-------------------------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:zocho_ten_mobile/screens/controller_screen.dart';
import 'package:zocho_ten_mobile/screens/home_screen.dart';
import 'package:zocho_ten_mobile/screens/plant_detail_screen.dart';
import './screens/plant_list_screen.dart';


void main() => runApp(ZochoTenMobile());

class ZochoTenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zocho Ten Mobile',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (ctx) => HomeScreen(),
        PlantDetailScreen.routeName: (ctx) => PlantDetailScreen(),
        ControllerScreen.routeName: (ctx) => ControllerScreen(),

      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => PlantListScreen(),);
      },
    );
  }
}

