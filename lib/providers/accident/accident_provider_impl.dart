import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/models/class/accident.dart';
import 'package:radar_peconhento_mobile/providers/accident/accident_provider.dart';
import 'package:radar_peconhento_mobile/services/accident/accident_service_impl.dart';

class AccidentProviderImpl extends ChangeNotifier with AccidentProvider {
  List<Accident> list = [];
  List<Accident> listFiltered = [];
  bool _loading = false;

  Accident obj = Accident();

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  AccidentServiceImpl service = AccidentServiceImpl();

  @override
  Future<void> findByAnimal(int animalId) async {
    try {
      loading = true;
      list = await service.findByAnimal(animalId);
      listFiltered = list;
      loading = false;
    } catch (e) {
      loading = false;
      return Future.error(e);
    }
  }
}
