// Get User
import 'dart:convert';

import 'package:flutter/src/material/data_table.dart';

List<Gender> genderFromJson(String str) =>
    List<Gender>.from(json.decode(str).map((x) => Gender.fromJson(x)));

String genderToJson(List<Gender> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gender {
  Gender({
    required this.id,
    required this.jenis_kelamin,
    required this.rentang_umur,
    required this.label,
    required this.date_created,
  });

  int id;
  String jenis_kelamin;
  String rentang_umur;
  String label;
  String date_created;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["id"],
        jenis_kelamin: json["jenis_kelamin"],
        rentang_umur: json["rentang_umur"],
        label: json["label"],
        date_created: json["date_created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_kelamin": jenis_kelamin,
        "rentang_umur": rentang_umur,
        "label": label,
        "date_created": date_created
      };
  @override
  String toString() {
    String result = jenis_kelamin;
    return result;
  }

  static map(DataRow Function(dynamic p) param0) {}
}
