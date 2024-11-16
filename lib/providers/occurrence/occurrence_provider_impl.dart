import 'dart:io';

import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/models/class/occurrence.dart';
import 'package:radar_peconhento_mobile/providers/occurrence/occurrence_provider.dart';
import 'package:radar_peconhento_mobile/services/occurrence/occurrence_service_impl.dart';

class OccurrenceProviderImpl extends ChangeNotifier with OccurrenceProvider {
  bool _loading = false;

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Occurrence obj = Occurrence();

  OccurrenceServiceImpl service = OccurrenceServiceImpl();

  OccurrenceProviderImpl();

  @override
  Future<void> register({
    required File image,
    required double latitude,
    required double longitude,
    required int? animalSupposedId,
    required int? categoryId,
  }) async {
    try {
      loading = true;
      obj = await service.register(
        image: image,
        latitude: latitude,
        longitude: longitude,
        animalSupposedId: animalSupposedId,
        categoryId: categoryId,
      );
      loading = false;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
