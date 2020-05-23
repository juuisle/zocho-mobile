import 'package:flutter/material.dart';
import 'package:zocho_ten_mobile/data/plant.dart';

import 'package:zocho_ten_mobile/widgets/plant_card.dart';
import 'package:zocho_ten_mobile/data/http_service.dart';

class PlantListScreen extends StatelessWidget {
  static const routeName = '/plant-list';
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Plant>>(
        future: httpService.getPlants(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Plant> plants = snapshot.data;
            return ListView(
              children: plants
                  .map((Plant plant) => PlantCard(
                        plant: plant,
                      ))
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
