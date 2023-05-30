import 'dart:convert';

// Contoh
List<GenderModel> genderModelFromJson(List data) => List<GenderModel>.from(
      data.map(
        (x) => GenderModel.fromJson(x),
      ),
    );

class GenderModel {
  GenderModel({
    // required this.name,
    // required this.gender,
    // required this.probability,
    required this.total,
    required this.status_validasi,
    required this.level,
  });

  // String name;
  // String gender;
  // double probability;
  int total;
  String status_validasi;
  String level;

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
        // name: json["name"],
        // gender: json["gender"],
        // probability: json["probability"].toDouble(),
        total: json["total"],
        level: json["level"],
        status_validasi: json["status_validasi"],
      );
}
