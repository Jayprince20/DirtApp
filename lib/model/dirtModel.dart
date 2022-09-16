// To parse this JSON data, do
//
//     final dirtModel = dirtModelFromMap(jsonString);

import 'dart:convert';

DirtModel dirtModelFromMap(String str) => DirtModel.fromMap(json.decode(str));

String dirtModelToMap(DirtModel data) => json.encode(data.toMap());

class DirtModel {
  DirtModel({
    this.message,
    this.picture,
    this.status,
    this.idplace,
  });

  String? message;
  String? picture;
  String? status;
  String? idplace;

  factory DirtModel.fromMap(Map<String, dynamic> json) => DirtModel(
        message: json["message"],
        picture: json["picture"],
        status: json["status"],
        idplace: json["idplace"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "picture": picture,
        "status": status,
        "idplace": idplace,
      };
}
