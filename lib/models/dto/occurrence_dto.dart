// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OccurrenceDto {
  dynamic image;
  double? latitude;
  double? longitude;
  int? animalSupposedId;
  int? categoryId;
  OccurrenceDto({
    this.image,
    this.latitude,
    this.longitude,
    this.animalSupposedId,
    this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
      'animalSupposedId': animalSupposedId,
      'categoryId': categoryId,
    };
  }

  factory OccurrenceDto.fromMap(Map<String, dynamic> map) {
    return OccurrenceDto(
      image: map['image'] as dynamic,
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      animalSupposedId: map['animalSupposedId'] != null
          ? map['animalSupposedId'] as int
          : null,
      categoryId: map['categoryId'] != null ? map['categoryId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OccurrenceDto.fromJson(String source) =>
      OccurrenceDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OccurrenceDto(image: $image, latitude: $latitude, longitude: $longitude, animalSupposedId: $animalSupposedId, categoryId: $categoryId)';
  }
}
