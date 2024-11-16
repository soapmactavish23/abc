import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/main_package/routes/routes_name.dart';
import 'package:radar_peconhento_mobile/views/accident/accident_view.dart';
import 'package:radar_peconhento_mobile/views/animal/animal_view.dart';
import 'package:radar_peconhento_mobile/views/base/base_view.dart';
import 'package:radar_peconhento_mobile/views/splash/splash_view.dart';

class Routes {
  static Route<dynamic> onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.baseRoute:
        return MaterialPageRoute(builder: (_) => BaseView());
      case RoutesName.animalList:
        return MaterialPageRoute(builder: (_) => const AnimalView());
      case RoutesName.accidentList:
        return MaterialPageRoute(builder: (_) => const AccidentView());
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
