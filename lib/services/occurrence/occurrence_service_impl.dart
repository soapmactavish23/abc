import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:radar_peconhento_mobile/main_package/services/config/config.dart';
import 'package:radar_peconhento_mobile/main_package/services/crud/crud_service.dart';
import 'package:radar_peconhento_mobile/models/class/occurrence.dart';
import 'package:radar_peconhento_mobile/services/occurrence/occurrence_service.dart';

class OccurrenceServiceImpl extends CrudService with OccurrenceService {
  OccurrenceServiceImpl({super.url = "/ocorrencias"});

  @override
  Future<Occurrence> register({
    required File image,
    required double latitude,
    required double longitude,
    required int? animalSupposedId,
    required int? categoryId,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          image.path,
        ),
        'latitude': latitude,
        'longitude': longitude,
        'animalSupposedId': animalSupposedId ?? 0,
        'categoryId': categoryId ?? 0,
      });

      final response = await unAuth.request(
        url,
        data: formData,
        options: Options(
          method: HttpMethods.post,
          headers: {
            Headers.contentTypeHeader: "multipart/form-data",
          },
          receiveTimeout: const Duration(seconds: 120),
        ),
      );

      return Occurrence.fromMap(response.data);
    } catch (e, s) {
      log('Erro ao registrar ocorrencia', error: e, stackTrace: s);
      return Future.error(e);
    }
  }
}
