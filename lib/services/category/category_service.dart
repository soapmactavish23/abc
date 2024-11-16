import 'package:radar_peconhento_mobile/models/class/category.dart';

mixin CategoryService {
  Future<List<Category>> findAll();
  Future<List<Category>> findByAnimalActive();
}
