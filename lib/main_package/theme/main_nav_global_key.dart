import 'package:flutter/material.dart';

class MainNavGlobalKey {
  static MainNavGlobalKey? _instance;
  final navKey = GlobalKey<NavigatorState>();

  MainNavGlobalKey._();

  static MainNavGlobalKey get instance => _instance ??= MainNavGlobalKey._();
}
