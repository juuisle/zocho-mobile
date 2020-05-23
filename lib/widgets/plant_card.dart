import 'package:flutter/material.dart';

import 'package:zocho_ten_mobile/data/plant.dart';
import 'package:zocho_ten_mobile/screens/plant_detail_screen.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  PlantCard({
    @required this.plant,
  });


  void selectPlant(BuildContext context) {
    Navigator.of(context).pushNamed(
      PlantDetailScreen.routeName,
      arguments: plant,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectPlant(context),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            plant.picUrl,
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.teal.withOpacity(0.6),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      plant.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${plant.growthPeriod} days'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.ac_unit,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(plant.livingCondition),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
