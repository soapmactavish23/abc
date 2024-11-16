import 'dart:developer';

import 'package:radar_peconhento_mobile/main_package/services/config/config.dart';
import 'package:radar_peconhento_mobile/main_package/services/crud/crud_service.dart';
import 'package:radar_peconhento_mobile/models/class/animal.dart';
import 'package:radar_peconhento_mobile/services/animal/animal_service.dart';

class AnimalServiceImpl extends CrudService with AnimalService {
  AnimalServiceImpl({super.url = "/animais"});

  @override
  Future<List<Animal>> findByCategory(int categoryId) async {
    try {
      final response = await executeUnAuth(
        url: '$url/categoria/$categoryId',
        httpMethod: HttpMethods.get,
      );

      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
        response.data,
      ).toList();

      return list.map<Animal>((e) => Animal.fromMap(e)).toList();
    } catch (e, s) {
      String msg = 'Erro ao listar animais por categoria';
      log(msg, error: e, stackTrace: s);
      return Future.error(msg);
    }
  }

  @override
  Future<List<Animal>> findByCategoryScanner(int categoryId) async {
    try {
      final response = await executeUnAuth(
        url: '$url/categoria/$categoryId/scanner',
        httpMethod: HttpMethods.get,
      );

      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
        response.data,
      ).toList();

      return list.map<Animal>((e) => Animal.fromMap(e)).toList();
    } catch (e, s) {
      String msg = 'Erro ao listar animais por categoria';
      log(msg, error: e, stackTrace: s);
      return Future.error(msg);
    }
  }
}
