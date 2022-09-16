import 'dart:convert';

List<PlaceModel> placeModelFromMap(String str) =>
    List<PlaceModel>.from(json.decode(str).map((x) => PlaceModel.fromMap(x)));

String placeModelToMap(List<PlaceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PlaceModel {
  PlaceModel({
    this.idplace,
    this.placeName,
  });

  int? idplace;
  String? placeName;

  factory PlaceModel.fromMap(Map<String, dynamic> json) => PlaceModel(
        idplace: json["idplace"],
        placeName: json["place_name"],
      );

  Map<String, dynamic> toMap() => {
        "idplace": idplace,
        "place_name": placeName,
      };
}
