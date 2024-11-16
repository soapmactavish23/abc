// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:radar_peconhento_mobile/models/class/animal.dart';
import 'package:radar_peconhento_mobile/models/class/laboratory_exam.dart';
import 'package:radar_peconhento_mobile/models/class/symptom.dart';
import 'package:radar_peconhento_mobile/models/class/treatment.dart';
import 'package:radar_peconhento_mobile/models/enums/danger.dart';

class Accident {
  int? id;
  Danger? danger;
  Animal? animal;
  List<LaboratoryExam>? exams;
  List<Symptom>? symptoms;
  List<Treatment>? treatments;

  Accident({
    this.id,
    this.danger,
    this.animal,
    this.exams,
    this.symptoms,
    this.treatments,
  });

  // 'danger': DangerState.convertEnumSend(danger),
  // danger: DangerState.convertEnum(map['danger']),

  @override
  String toString() {
    return 'Accident(id: $id, danger: $danger, animal: $animal, exams: $exams, symptoms: $symptoms, treatments: $treatments)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'danger': DangerState.convertEnumSend(danger!),
      'animal': animal?.toMap(),
      'exams': exams!.map((x) => x.toMap()).toList(),
      'symptoms': symptoms!.map((x) => x.toMap()).toList(),
      'treatments': treatments!.map((x) => x.toMap()).toList(),
    };
  }

  factory Accident.fromMap(Map<String, dynamic> map) {
    return Accident(
      id: map['id'] != null ? map['id'] as int : null,
      danger: DangerState.convertEnum(map['danger']),
      animal: map['animal'] != null
          ? Animal.fromMap(map['animal'] as Map<String, dynamic>)
          : null,
      exams: map['exams'] != null
          ? List<LaboratoryExam>.from(
              (map['exams'] as List<dynamic>).map<LaboratoryExam?>(
                (x) => LaboratoryExam.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      symptoms: map['symptoms'] != null
          ? List<Symptom>.from(
              (map['symptoms'] as List<dynamic>).map<Symptom?>(
                (x) => Symptom.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      treatments: map['treatments'] != null
          ? List<Treatment>.from(
              (map['treatments'] as List<dynamic>).map<Treatment?>(
                (x) => Treatment.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Accident.fromJson(String source) =>
      Accident.fromMap(json.decode(source) as Map<String, dynamic>);
}
