import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/main_package/theme/constants.dart';

enum Danger { light, moderate, serious }

abstract class DangerState {
  static String convertStr(Danger danger) {
    switch (danger) {
      case Danger.light:
        return "Leve";
      case Danger.moderate:
        return "Moderado";
      case Danger.serious:
        return "Grave";
      default:
        return "Leve";
    }
  }

  static Danger convertEnum(String danger) {
    switch (danger) {
      case "LIGHT":
        return Danger.light;
      case "MODERATE":
        return Danger.moderate;
      case "SERIOUS":
        return Danger.serious;
      default:
        return Danger.light;
    }
  }

  static String convertEnumSend(Danger danger) {
    switch (danger) {
      case Danger.light:
        return "LIGHT";
      case Danger.moderate:
        return "MODERATE";
      case Danger.serious:
        return "SERIOUS";
      default:
        return "LIGHT";
    }
  }

  static Color convertEnumColor(Danger danger) {
    switch (danger) {
      case Danger.light:
        return ColorsConstants.success;
      case Danger.moderate:
        return Colors.orange;
      case Danger.serious:
        return ColorsConstants.danger;
      default:
        return ColorsConstants.success;
    }
  }
}
