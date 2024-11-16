import 'dart:io';

mixin OccurrenceProvider {
  Future<void> register({
    required File image,
    required double latitude,
    required double longitude,
    required int? animalSupposedId,
    required int? categoryId,
  });
}
