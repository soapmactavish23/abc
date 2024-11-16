import 'dart:developer';

import 'package:radar_peconhento_mobile/main_package/services/config/config.dart';
import 'package:radar_peconhento_mobile/main_package/services/crud/crud_service.dart';
import 'package:radar_peconhento_mobile/models/class/category.dart';
import 'package:radar_peconhento_mobile/services/category/category_service.dart';

class CategoryServiceImpl extends CrudService with CategoryService {
  CategoryServiceImpl({super.url = "/categorias"});

  @override
  Future<List<Category>> findAll() async {
    try {
      final List<Map<String, dynamic>> list = await readAll();
      return list.map<Category>((e) => Category.fromMap(e)).toList();
    } catch (e, s) {
      log('Erro ao listar categorias', error: e, stackTrace: s);
      return Future.error(e);
    }
  }

  @override
  Future<List<Category>> findByAnimalActive() async {
    try {
      final response = await executeUnAuth(
        url: '$url/animais-ativos',
        httpMethod: HttpMethods.get,
      );

      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
        response.data,
      ).toList();
      return list.map<Category>((e) => Category.fromMap(e)).toList();
    } catch (e, s) {
      log('Erro ao listar categorias', error: e, stackTrace: s);
      return Future.error(e);
    }
  }
}
