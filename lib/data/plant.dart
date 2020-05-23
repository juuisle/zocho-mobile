import 'package:flutter/foundation.dart';

class Plant {
  final String id;
  final String name;
  final String description;
  final String scientificName;
  final String livingCondition;
  final String growthPeriod;
  final double lifespan;
  final double price;
  final double temperatureMinimum;
  final double temperatureMaximum;
  final String picUrl;
  final String category;

  Plant(
      {@required this.id,
      @required this.name,
      @required this.scientificName,
      @required this.description,
      @required this.livingCondition,
      @required this.growthPeriod,
      @required this.lifespan,
      @required this.price,
      @required this.temperatureMinimum,
      @required this.temperatureMaximum,
      @required this.picUrl,
      @required this.category});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['_id']['\$oid'],
      name: json['name'],
      scientificName: json['scientific_name'],
      description: json['description'],
      livingCondition: json['living_condition'],
      growthPeriod: json['growth_period'],
      lifespan: json['lifespan'],
      price: json['price'],
      temperatureMinimum: json['temperature_minimum'],
      temperatureMaximum: json['temperature_maximum'],
      picUrl: json['pic_url'],
      category: json['category'],
    );
  }
}
