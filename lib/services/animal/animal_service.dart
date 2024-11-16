import 'package:radar_peconhento_mobile/models/class/animal.dart';

mixin AnimalService {
  Future<List<Animal>> findByCategory(int categoryId);
  Future<List<Animal>> findByCategoryScanner(int categoryId);
}
