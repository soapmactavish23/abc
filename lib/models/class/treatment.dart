import 'dart:convert';

import 'package:radar_peconhento_mobile/models/enums/treatment_type.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Treatment {
  int id;
  String description;
  String obs;
  TreatmentType type;

  Treatment({
    required this.id,
    required this.description,
    required this.obs,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'obs': obs,
      'type': TreatmentTypeState.convertEnumSend(type),
    };
  }

  factory Treatment.fromMap(Map<String, dynamic> map) {
    return Treatment(
      id: map['id'] as int,
      description: map['description'] as String,
      obs: map['obs'] ?? "",
      type: TreatmentTypeState.convertEnum(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Treatment.fromJson(String source) =>
      Treatment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Treatment(id: $id, description: $description, obs: $obs, type: $type)';
  }
}
