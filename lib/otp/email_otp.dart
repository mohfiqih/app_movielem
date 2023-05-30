import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

final formState = GlobalKey<FormState>();

final textControllerEmail = TextEditingController();
// final textControllerPassword = TextEditingController();

final otpController = TextEditingController();




// Cek Token

// Future<void> sendOTP() async {
//   EmailAuth emailAuth = new EmailAuth(sessionName: "name");
//   var res =
//       await emailAuth.sendOtp(recipientMail: textControllerEmail.value.text);
//   if (res) {
//     print("Verification Code Sent!");
//   } else {
//     print("Failed to send the verification code");
//   }
// }

// Future<void> verifyOTP() async {
//   EmailAuth emailAuth = new EmailAuth(sessionName: "name");
//   var res = emailAuth.validateOtp(
//       recipientMail: textControllerEmail.value.text,
//       userOtp: otpController.value.text);
//   if (res) {
//     print("Email Verified!");
//   } else {
//     print("Invalid Verification Code");
//   }
// }
