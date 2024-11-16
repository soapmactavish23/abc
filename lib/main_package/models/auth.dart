import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Auth {
  String access_token;
  String? name;
  int? code;
  String? contact;
  String? cpf;
  String? email;
  DateTime? generate;

  getAuthorities() {
    final str = JwtDecoder.decode(access_token);
    return str['authorities'];
  }

  Auth({
    this.access_token = '',
    this.name,
    this.code,
    this.contact,
    this.cpf,
    this.email,
    this.generate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': access_token,
      'name': name,
      'code': code,
      'contact': contact,
      'cpf': cpf,
      'email': email,
      'generate': generate?.millisecondsSinceEpoch,
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      access_token: map['access_token'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as int : null,
      contact: map['contact'] != null ? map['contact'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      generate:
          map['generate'] != null ? DateTime.parse(map['generate']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) =>
      Auth.fromMap(json.decode(source) as Map<String, dynamic>);
}
