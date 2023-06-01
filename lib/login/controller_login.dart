import 'dart:convert';
import 'dart:io';

import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/dasbor/notif.dart';
import 'package:app_movie/login/login.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/otp/otp.dart';
import 'package:app_movie/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import '../otp/email_otp.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:flutter_sms/flutter_sms.dart';

class HttpService {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse(ip_universal + 'login');

  static flutter_login(email, password, context) async {
    http.Response response = await _client.post(
      _loginUrl,
      body: {
        "email": email,
        "password": password,
      },
    );

    var json = jsonDecode(response.body);
    var token = json['token'];
    // var basic = json['basic'];

    if (response.statusCode == 200) {
      // Jika sudah ada maka tidak dapat masuk
      if (json['message'] == 'Berhasil Login!') {
        await EasyLoading.showSuccess(json['message']);

        try {
          var userEmail = 'mfiqiherinsyah90@gmail.com';
          final message = Message()
            ..from = Address(userEmail, 'Token Verification')
            ..recipients.add(email)
            ..subject = 'Sign with this Token'
            ..html =
                "<h3>Masukan token ini untuk login : </h3>\n<p>${token}</p>";

          final smtpServer = gmail(userEmail, 'tjtgpeymuxkbbewc');

          try {
            final sendReport = await send(message, smtpServer);
            print('Token berhasil dikirim: ' + sendReport.toString());
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => OTP()));
            NotificationWidget.showNotification(
                title: "Movielem",
                body: 'Token login berhasil dikirim ke email!');
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
        print("Gagal login");
        var gagal_login = "Gagal Login!";
        EasyLoading.showError(gagal_login);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}

class Resend {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse(ip_universal + 'login');

  static flutter_login(email, password, context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      "email": email,
      "password": password,
    });

    var json = jsonDecode(response.body);
    var token = json['token'];

    if (response.statusCode == 200) {
      // Jika sudah ada maka tidak dapat masuk
      if (json['message'] == 'Success! Cek Email Token!') {
        await EasyLoading.showSuccess(json['message']);
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => OTP()));
        try {
          var userEmail = 'mfiqiherinsyah90@gmail.com';
          final message = Message()
            ..from = Address(userEmail, 'Token Verification')
            ..recipients.add(email)
            ..subject = 'Sign with this Token'
            ..html =
                "<h3>Masukan token ini untuk login  : </h3>\n<p>${token}</p>";

          final smtpServer = gmail(userEmail, 'ngxpfkruwxpuptdz');

          try {
            final sendReport = await send(message, smtpServer);
            print('Token berhasil dikirim: ' + sendReport.toString());
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => OTP()));
            NotificationWidget.showNotification(
                title: "Resend Token", body: 'Resend token berhasil!');
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
        print("Gagal login");
        var gagal_login = "Gagal Login!";
        EasyLoading.showError(gagal_login);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
