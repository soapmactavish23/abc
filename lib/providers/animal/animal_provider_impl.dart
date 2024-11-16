import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/models/class/animal.dart';
import 'package:radar_peconhento_mobile/providers/animal/animal_provider.dart';
import 'package:radar_peconhento_mobile/services/animal/animal_service_impl.dart';

class AnimalProviderImpl extends ChangeNotifier with AnimalProvider {
  Animal obj = Animal();
  List<Animal> list = [];
  List<Animal> listFiltered = [];
  bool _loading = false;
  List<Animal> animalsScanners = [];
  int? categoryId;

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  AnimalServiceImpl service = AnimalServiceImpl();

  AnimalProviderImpl();

  @override
  Future<void> findByCategory() async {
    try {
      loading = true;
      list = await service.findByCategory(categoryId!);
      listFiltered = list;
      loading = false;
    } catch (e) {
      loading = false;
      return Future.error(e);
    }
  }

  @override
  void search(String search) {
    listFiltered = list
        .where((element) =>
            element.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
    notifyListeners();
  }

  @override
  Future<void> findByCategoryScanner(int categoryId) async {
    try {
      loading = true;
      animalsScanners = await service.findByCategoryScanner(categoryId);
      loading = false;
    } on Exception catch (e) {
      loading = false;
      return Future.error(e);
    }
  }
}
