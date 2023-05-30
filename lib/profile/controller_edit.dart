import 'dart:convert';
import 'dart:io';

import 'package:app_movie/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EditProfil {
  static final _client = http.Client();

  static var _editProfilUrl = Uri.parse('http://192.168.0.102:5000/editProfil');

  static edit(email, name, context) async {
    http.Response response = await _client.post(_editProfilUrl, body: {
      "email": email,
      "name": name,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // Jika sudah ada maka tidak dapat masuk
      if (json[0] == 'Email tidak Ada!') {
        EasyLoading.showError(json[0]);
      } else {
        await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Profile()));
      }
    } else {
      await EasyLoading.showError("Gagal : ${response.statusCode.toString()}");
    }
  }
}
