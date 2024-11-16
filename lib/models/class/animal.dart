// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:radar_peconhento_mobile/models/class/category.dart';

class Animal {
  int? id;
  Category? category;
  String? name;
  String? description;
  String? scientificName;
  String? url;

  Animal({
    this.id,
    this.category,
    this.name,
    this.description,
    this.scientificName,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category!.toMap(),
      'name': name,
      'description': description,
      'scientificName': scientificName,
      'url': url,
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['id'] as int,
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
      name: map['name'] as String,
      description: map['description'] as String,
      scientificName: map['scientificName'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) =>
      Animal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Animal(id: $id, category: $category, name: $name, description: $description, scientificName: $scientificName, url: $url)';
  }
}
