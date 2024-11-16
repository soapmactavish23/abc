import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:radar_peconhento_mobile/main_package/models/auth.dart';
import 'package:radar_peconhento_mobile/main_package/services/auth/auth_repository.dart';
import 'package:radar_peconhento_mobile/main_package/services/config/config.dart';
import 'package:radar_peconhento_mobile/main_package/utils/msgs_custom.dart';

class AuthService extends Config with AuthRepository {
  @override
  Future<void> login(String email, String password) async {
    try {
      final response = await unAuth.post(
        '/oauth/token',
        data: "username=$email&password=$password&grant_type=password",
        options: Options(
          headers: {
            "Content-type": "application/x-www-form-urlencoded",
            "Authorization": "Basic c2VzcGF3ZWI6IyQzJHBAY3QxJCM=",
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonEncode(response.data);

        await saveToken(data, email, password);
        return Future.value();
      }
    } on DioException catch (e, s) {
      log(
        MsgsCustom.msg401,
        error: e,
        stackTrace: s,
      );
      return Future.error(MsgsCustom.msg401);
    } on Exception catch (e, s) {
      log(
        'Erro interno ao efeturar login',
        error: e,
        stackTrace: s,
      );
      return Future.error(MsgsCustom.msg400);
    }
  }

  saveToken(token, email, password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    prefs.setString("email", email);
    prefs.setString("password", password);
  }

  Future<Auth?> getAuth() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      var map = jsonDecode(token);
      Auth auth = Auth.fromMap(map);

      if (JwtDecoder.isExpired(auth.access_token)) {
        String? email = prefs.getString("email");
        String? password = prefs.getString("password");
        if (password != null) {
          await login(email ?? "", password);
          return auth;
        } else {
          await signOut();
          return null;
        }
      }

      return auth;
    } else {
      return null;
    }
  }

  Future<String> getToken() async {
    Auth? auth = await getAuth();
    if (auth != null) {
      return auth.access_token;
    } else {
      return "";
    }
  }

  Future<Map<String, String>> getTokenHeaders() async {
    return {'Authorization': 'Bearer ${await getToken()}'};
  }

  @override
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
