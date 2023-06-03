import 'dart:convert';
import 'dart:io';

import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/dasbor/notif.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:flutter_sms/flutter_sms.dart';

class Reset_pw {
  static final _clientreset = http.Client();

  static var _reset = Uri.parse(ip_universal + 'send-reset');

  static send_reset(email, context) async {
    http.Response response = await _clientreset.post(
      _reset,
      body: {
        "email": email,
      },
    );

    var json = jsonDecode(response.body);
    print(json);
    var link = json['link'];

    if (response.statusCode == 200) {
      // Jika sudah ada maka tidak dapat masuk
      if (json['message'] == 'Berhasil Kirim Link!') {
        await EasyLoading.showSuccess(json['message']);

        try {
          var userEmail = 'mfiqiherinsyah90@gmail.com';
          final message = Message()
            ..from = Address(userEmail, 'Link Reset Password 🔓')
            ..recipients.add(email)
            ..subject = 'Reset Password'
            ..html = "<h3>Link Reset Password anda : </h3>\n<p>${link}</p>";

          final smtpServer = gmail(userEmail, 'tjtgpeymuxkbbewc');

          try {
            final sendReport = await send(message, smtpServer);
            print('Link berhasil dikirim: ' + sendReport.toString());
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => Welcome()));
            NotificationWidget.showNotification(
                title: "Reset Password",
                body: 'Link Reset berhasil dikirim ke email!');
          } on MailerException catch (e) {
            print('Token gagal dikirim!');
            for (var p in e.problems) {
              print('Problem: ${p.code}: ${p.msg}');
            }
          }
        } catch (e) {
          print("Gagal kirim Token!");
          var gagal_token = "Gagal kirim Token!";
          EasyLoading.showError(gagal_token);
        }
      } else {
        print("Gagal!");
        var gagal_login = "Gagal Login!";
        EasyLoading.showError(gagal_login);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
