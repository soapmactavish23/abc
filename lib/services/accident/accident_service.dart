import 'package:radar_peconhento_mobile/models/class/accident.dart';

mixin AccidentService {
  Future<List<Accident>> findByAnimal(int animalId);
}
