import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LaboratoryExam {
  int id;
  String description;

  LaboratoryExam({
    required this.id,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  factory LaboratoryExam.fromMap(Map<String, dynamic> map) {
    return LaboratoryExam(
      id: map['id'] as int,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LaboratoryExam.fromJson(String source) =>
      LaboratoryExam.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LaboratoryExam(id: $id, description: $description)';
}
