import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/models/class/category.dart';
import 'package:radar_peconhento_mobile/providers/category/category_provider.dart';
import 'package:radar_peconhento_mobile/services/category/category_service_impl.dart';

class CategoryProviderImpl extends ChangeNotifier with CategoryProvider {
  Category obj = Category();
  List<Category> list = [];
  List<Category> listFiltered = [];
  List<Category> listCombo = [];
  bool _loading = false;

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  CategoryServiceImpl service = CategoryServiceImpl();

  CategoryProviderImpl() {
    findAll();
  }

  @override
  Future<void> findAll() async {
    try {
      loading = true;
      list = await service.findAll();
      listFiltered = list;
      loading = false;
    } catch (e) {
      loading = false;
      return Future.error(e);
    }
  }

  @override
  Future<void> findByAnimalActive() async {
    try {
      loading = true;
      listCombo = await service.findByAnimalActive();
      loading = false;
    } catch (e) {
      loading = false;
      listCombo = [];
      return Future.error(e);
    }
  }
}
