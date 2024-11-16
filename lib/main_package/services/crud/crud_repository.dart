import 'package:dio/dio.dart';

mixin CrudRepository {
  Future<void> create(String obj);
  Future<void> update(String obj);

  Future<List<Map<String, dynamic>>> readAll();

  Future<void> deleteById(int? id);

  Future<Map<String, dynamic>> readById(int? id);

  Future<List<Map<String, dynamic>>> readPageable(String query);

  Future<Response> executeAuth(
      {required String httpMethod, required String url, Object? data});

  Future<Response> executeUnAuth({
    required String httpMethod,
    required String url,
    Object? data,
  });

  Future<Response> uploadAuth({
    required String httpMethod,
    required String url,
    required FormData formData,
  });
}
