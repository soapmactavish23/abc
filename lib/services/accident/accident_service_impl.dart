import 'package:radar_peconhento_mobile/main_package/services/config/config.dart';
import 'package:radar_peconhento_mobile/main_package/services/crud/crud_service.dart';
import 'package:radar_peconhento_mobile/models/class/accident.dart';
import 'package:radar_peconhento_mobile/services/accident/accident_service.dart';

class AccidentServiceImpl extends CrudService with AccidentService {
  AccidentServiceImpl({super.url = '/acidentes'});

  @override
  Future<List<Accident>> findByAnimal(int animalId) async {
    final response = await executeUnAuth(
      url: '$url/animal/$animalId',
      httpMethod: HttpMethods.get,
    );

    List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
      response.data,
    ).toList();

    return list.map<Accident>((e) => Accident.fromMap(e)).toList();
  }
}
