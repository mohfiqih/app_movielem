import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/otp/skip_/otp_phone/phone.dart';
import 'package:app_movie/otp/skip_/otp_phone/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: 'phone',
      debugShowCheckedModeBanner: false,
      routes: {
        'phone': (context) => MyPhone(),
        'verify': (context) => MyVerify()
      },
    ),
  );
}

// class MyOTP extends StatelessWidget {
//   const MyOTP({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: 'phone',
//       debugShowCheckedModeBanner: false,
//       routes: {
//         'phone': (context) => MyPhone(),
//         'verify': (context) => MyVerify()
//       },
//     );
//   }
// }
