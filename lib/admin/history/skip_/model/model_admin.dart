import 'dart:convert';

List<Admin> adminFromJson(String str) =>
    List<Admin>.from(json.decode(str).map((x) => Admin.fromJson(x)));

String adminToJson(List<Admin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Admin {
  Admin({
    required this.id,
    required this.email,
    required this.name,
    required this.status_validasi,
    required this.level,
    required this.created_at,
  });

  int id;
  String email;
  String name;
  String status_validasi;
  String level;
  String created_at;

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        status_validasi: json["status_validasi"],
        level: json["level"],
        created_at: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "status_validasi": status_validasi,
        "level": level,
        "created_at": created_at
      };
  @override
  String toString() {
    String result = email;
    return result;
  }
}
