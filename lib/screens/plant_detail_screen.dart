import 'package:flutter/material.dart';
import 'package:zocho_ten_mobile/data/plant.dart';
import 'package:zocho_ten_mobile/styles.dart';


class PlantDetailScreen extends StatelessWidget {
  static const routeName = '/plant-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Plant selectedPlant = ModalRoute.of(context).settings.arguments;
    final ThemeData themeData = Theme.of(context);
    //print(plant.name);
    //final selectedPlant = DUMMY_MEALS.firstWhere((meal) => meal.id == 'm1');
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedPlant.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              width: double.infinity,
              child: Image.network(
                selectedPlant.picUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                'Plant Information',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              height: 180,
              width: 350,
              child: Center(
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Text(
                            'Scientific Name:',
                            style: Styles.plantInfoLabelText(themeData),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            selectedPlant.scientificName,
                            textAlign: TextAlign.end,
                            style: Styles.plantInfoValueText(themeData),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Text(
                            'Living Condition:',
                            style: Styles.plantInfoLabelText(themeData),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            selectedPlant.livingCondition,
                            textAlign: TextAlign.end,
                            style: Styles.plantInfoValueText(themeData),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Text(
                            'Lifespan:',
                            style: Styles.plantInfoLabelText(themeData),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            '${selectedPlant.lifespan} days',
                            textAlign: TextAlign.end,
                            style: Styles.plantInfoValueText(themeData),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Text(
                            'Comercial Price: ',
                            style: Styles.plantInfoLabelText(themeData),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            '${selectedPlant.price} EUR/100 gram',
                            textAlign: TextAlign.end,
                            style: Styles.plantInfoValueText(themeData),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Text(
                            'Minimum Temperature: ',
                            style: Styles.plantInfoLabelText(themeData),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            '${selectedPlant.temperatureMinimum} Celsius',
                            textAlign: TextAlign.end,
                            style: Styles.plantInfoValueText(themeData),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Text(
                            'Maximum Temperature: ',
                            style: Styles.plantInfoLabelText(themeData),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            '${selectedPlant.temperatureMaximum} Celsius',
                            textAlign: TextAlign.end,
                            style: Styles.plantInfoValueText(themeData),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Text(
                            'Category: ',
                            style: Styles.plantInfoLabelText(themeData),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            'Vegetable ${selectedPlant.category} plant',
                            textAlign: TextAlign.end,
                            style: Styles.plantInfoValueText(themeData),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              height: 300,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SingleChildScrollView(
                  child: Text(
                    selectedPlant.description,
                    style: Styles.plantInfoDetailText(themeData),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
