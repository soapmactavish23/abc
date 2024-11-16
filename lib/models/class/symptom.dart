import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Symptom {
  int id;
  String description;

  Symptom({
    required this.id,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  factory Symptom.fromMap(Map<String, dynamic> map) {
    return Symptom(
      id: map['id'] as int,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Symptom.fromJson(String source) =>
      Symptom.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Symptom(id: $id, description: $description)';
}
