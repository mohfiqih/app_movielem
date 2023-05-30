import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/admin/admin.dart';
import 'package:app_movie/record/record.dart';
import 'package:app_movie/splash/complete.dart';
import 'package:app_movie/splash/complete_otp.dart';
import 'package:app_movie/splash/onGoing.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:app_movie/dasbor/notif.dart';

class Cek_otp {
  static final _client = http.Client();

  static var _cekTokenUrl = Uri.parse(ip_otp);

  static flutter_token(email, token, context) async {
    http.Response response = await _client.post(
      _cekTokenUrl,
      body: {
        "email": email,
        "token": token,
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var pesan = json[0];
      if (json[0] == 'Anda masuk sebagai administrator!') {
        await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HalamanAdmin()));
      } else if (json[0] == 'Berhasil masuk!') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Complete_OTP()));
      }
    } else {
      await EasyLoading.showError("Gagal! Mohon cek ulang!");
    }
  }
}
