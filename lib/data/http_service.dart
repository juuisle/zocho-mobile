import 'dart:convert';

import 'package:http/http.dart';
import 'plant.dart';

class HttpService {
  final String plantsAPI = 'http://64.225.97.160/plants';

  Future<List<Plant>> getPlants() async {
    Response response = await get(plantsAPI);

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Plant> plants =
          body.map((dynamic item) => Plant.fromJson(item)).toList();
      return plants;
    } else {
      throw 'Cant get post';
    }
  }
}
