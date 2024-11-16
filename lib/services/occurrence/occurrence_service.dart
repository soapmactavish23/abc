import 'dart:io';

import 'package:radar_peconhento_mobile/models/class/occurrence.dart';

mixin OccurrenceService {
  Future<Occurrence> register({
    required File image,
    required double latitude,
    required double longitude,
    required int? animalSupposedId,
    required int? categoryId,
  });
}
