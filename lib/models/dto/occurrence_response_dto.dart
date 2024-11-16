// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:radar_peconhento_mobile/models/class/accident.dart';
import 'package:radar_peconhento_mobile/models/class/occurrence.dart';

class OccurrenceResponseDto {
  Occurrence? occurrence;
  List<Accident>? accidents;
  OccurrenceResponseDto({
    this.occurrence,
    this.accidents,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'occurrence': occurrence?.toMap(),
      'accidents': accidents?.map((x) => x.toMap()).toList(),
    };
  }

  factory OccurrenceResponseDto.fromMap(Map<String, dynamic> map) {
    return OccurrenceResponseDto(
      occurrence: map['occurrence'] != null
          ? Occurrence.fromMap(map['occurrence'] as Map<String, dynamic>)
          : null,
      accidents: map['accidents'] != null
          ? List<Accident>.from(
              (map['accidents'] as List<int>).map<Accident?>(
                (x) => Accident.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OccurrenceResponseDto.fromJson(String source) =>
      OccurrenceResponseDto.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OccurrenceResponseDto(occurrence: $occurrence, accidents: $accidents)';
}
