import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart';
import 'package:dio/src/response.dart';
import 'package:radar_peconhento_mobile/main_package/services/config/config.dart';
import 'package:radar_peconhento_mobile/main_package/services/crud/crud_repository.dart';
import 'package:radar_peconhento_mobile/main_package/utils/msgs_custom.dart';

class CrudService extends Config with CrudRepository {
  String url;

  CrudService({
    required this.url,
  });

  @override
  Future<void> create(String obj) async {
    try {
      await executeAuth(httpMethod: HttpMethods.post, url: url, data: obj);
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> deleteById(int? id) async {
    try {
      await executeAuth(httpMethod: HttpMethods.delete, url: "$url/$id");
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> readAll() async {
    try {
      final response =
          await executeUnAuth(url: url, httpMethod: HttpMethods.get);

      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
        response.data,
      ).toList();
      return Future.value(list);
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> update(String obj) async {
    try {
      await executeAuth(url: url, data: obj, httpMethod: HttpMethods.put);
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<Map<String, dynamic>> readById(int? id) async {
    try {
      final response = await executeAuth(
        url: '$url/$id',
        httpMethod: HttpMethods.get,
      );
      return response.data;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> readPageable(String query) async {
    try {
      final response = await executeAuth(
        httpMethod: HttpMethods.get,
        url: '$url?$query',
      );

      List<dynamic> pageable = response.data['content'];

      return List<Map<String, dynamic>>.from(pageable).toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<Response> executeAuth({
    required String httpMethod,
    required String url,
    Object? data,
  }) async {
    try {
      return await auth.request(
        url,
        options: Options(method: httpMethod),
        data: data,
      );
    } on DioException catch (e, s) {
      if (e.response!.statusCode == 400) {
        final error = e.response!.data[0]["mensagemDesenvolvedor"];
        final errorMsg = error.toString().replaceAll(
            "br.com.hkprogrammer.api.exceptionhandler.NegocioException: ", "");
        log(MsgsCustom.msgConection, error: e, stackTrace: s);
        if (errorMsg != "") {
          return Future.error(errorMsg);
        }
      } else if (e.response!.statusCode == 401) {
        log(MsgsCustom.msg401Expired, error: e, stackTrace: s);
        return Future.error(MsgsCustom.msg401Expired);
      }
      return Future.error(MsgsCustom.msgConection);
    } on Exception catch (e, s) {
      log(MsgsCustom.msgInternalError, error: e, stackTrace: s);
      return Future.error(MsgsCustom.msg400);
    }
  }

  @override
  Future<Response> executeUnAuth({
    required String httpMethod,
    required String url,
    Object? data,
  }) async {
    try {
      return await unAuth.request(
        url,
        options: Options(method: httpMethod),
        data: data,
      );
    } on DioException catch (e, s) {
      log(MsgsCustom.msgConection, error: e, stackTrace: s);
      if (e.response!.statusCode == 400) {
        final error = e.response!.data[0]["mensagemDesenvolvedor"];
        final errorMsg = error.toString().replaceAll(
            "br.com.hkprogrammer.api.exceptionhandler.NegocioException: ", "");
        if (errorMsg != "") {
          return Future.error(errorMsg);
        }
      }
      return Future.error(MsgsCustom.msgConection);
    } on Exception catch (e, s) {
      log(MsgsCustom.msgInternalError, error: e, stackTrace: s);
      return Future.error(MsgsCustom.msg400);
    }
  }

  @override
  Future<Response> uploadAuth({
    required String httpMethod,
    required String url,
    required FormData formData,
  }) async {
    try {
      return await auth.request(
        url,
        data: formData,
        options: Options(
          method: httpMethod,
          contentType: 'multipart/form-data',
        ),
      );
    } on DioException catch (e, s) {
      log(MsgsCustom.msgConection, error: e, stackTrace: s);
      if (e.response!.statusCode == 400) {
        final error = e.response!.data[0]["mensagemDesenvolvedor"];
        final errorMsg = error.toString().replaceAll(
            "br.com.hkprogrammer.api.exceptionhandler.NegocioException: ", "");
        if (errorMsg != "") {
          return Future.error(errorMsg);
        }
      }
      return Future.error(MsgsCustom.msgConection);
    } on Exception catch (e, s) {
      log(MsgsCustom.msgInternalError, error: e, stackTrace: s);
      return Future.error(MsgsCustom.msg400);
    }
  }
}
