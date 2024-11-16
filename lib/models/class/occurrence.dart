// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:radar_peconhento_mobile/models/class/animal.dart';

class Occurrence {
  int? id;
  Animal? animal;
  DateTime? date;
  double? latitude;
  double? longitude;

  Occurrence({
    this.id,
    this.animal,
    this.date,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'animal': animal!.toMap(),
      'date': date!.millisecondsSinceEpoch,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Occurrence.fromMap(Map<String, dynamic> map) {
    return Occurrence(
      id: map['id'] as int,
      animal: Animal.fromMap(map['animal'] as Map<String, dynamic>),
      date: DateTime.parse(map['date']),
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Occurrence.fromJson(String source) =>
      Occurrence.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Occurrence(id: $id, animal: $animal, date: $date, latitude: $latitude, longitude: $longitude)';
  }
}
