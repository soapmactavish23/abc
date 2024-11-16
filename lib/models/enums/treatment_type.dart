import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/main_package/theme/constants.dart';

enum TreatmentType { specific, nonspecific }

abstract class TreatmentTypeState {
  static String convertStr(TreatmentType treatmentType) {
    switch (treatmentType) {
      case TreatmentType.specific:
        return "Específico";
      case TreatmentType.nonspecific:
        return "Inespecífico";
      default:
        return "Específico";
    }
  }

  static TreatmentType convertEnum(String treatmentType) {
    switch (treatmentType) {
      case "SPECIF":
        return TreatmentType.specific;
      case "NONSPECIFC":
        return TreatmentType.nonspecific;
      default:
        return TreatmentType.specific;
    }
  }

  static String convertEnumSend(TreatmentType treatmentType) {
    switch (treatmentType) {
      case TreatmentType.specific:
        return "SPECIF";
      case TreatmentType.nonspecific:
        return "NONSPECIFC";
      default:
        return "SPECIF";
    }
  }

  static Color convertEnumColor(TreatmentType treatmentType) {
    switch (treatmentType) {
      case TreatmentType.specific:
        return ColorsConstants.info;
      case TreatmentType.nonspecific:
        return ColorsConstants.primary;
      default:
        return ColorsConstants.info;
    }
  }
}
