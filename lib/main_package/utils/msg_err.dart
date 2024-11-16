import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:radar_peconhento_mobile/main_package/utils/msgs_custom.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MsgErr {
  String? mensagemUsuario;
  String? mensagemDesenvolvedor;

  MsgErr({
    this.mensagemUsuario,
    this.mensagemDesenvolvedor,
  });

  static String getErrorForCode(int code) {
    if (code == 401) {
      return MsgsCustom.msg401;
    } else if (code == 404) {
      return MsgsCustom.msg404;
    } else {
      return MsgsCustom.msg400;
    }
  }

  static String getError(Response response) {
    String msg = "";
    if (response.body != "") {
      var decoded = utf8.decode(response.bodyBytes);
      List<dynamic> map = jsonDecode(decoded) as List<dynamic>;

      MsgErr msgErr = MsgErr.fromMap(map.first);

      msg = msgErr.mensagemUsuario ?? MsgsCustom.msg400;

      bool hasNegException = msgErr.mensagemDesenvolvedor!
          .contains("br.gov.pa.saude.api.exceptionhandler.NegocioException: ");

      if (hasNegException) {
        msg = msgErr.mensagemDesenvolvedor!.replaceAll(
            "br.gov.pa.saude.api.exceptionhandler.NegocioException: ", "");
      }
    } else {
      msg = MsgErr.getErrorForCode(response.statusCode);
    }

    debugPrint("HttpStatus: ${response.statusCode}");

    return msg;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mensagemUsuario': mensagemUsuario,
      'mensagemDesenvolvedor': mensagemDesenvolvedor,
    };
  }

  factory MsgErr.fromMap(Map<String, dynamic> map) {
    return MsgErr(
      mensagemUsuario: map['mensagemUsuario'] != null
          ? map['mensagemUsuario'] as String
          : null,
      mensagemDesenvolvedor: map['mensagemDesenvolvedor'] != null
          ? map['mensagemDesenvolvedor'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MsgErr.fromJson(String source) =>
      MsgErr.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MsgErr(mensagemUsuario: $mensagemUsuario, mensagemDesenvolvedor: $mensagemDesenvolvedor)';
}
