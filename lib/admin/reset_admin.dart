import 'package:app_movie/admin/navbar_admin.dart';
import 'package:app_movie/reset/controller_reset.dart';
import 'package:app_movie/settings/settings_admin.dart';
import 'package:app_movie/splash/onGoing.dart';
import 'package:app_movie/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../login/controller_login.dart';

class ResetAdmin extends StatefulWidget {
  @override
  _ResetAdminState createState() => _ResetAdminState();
}

class _ResetAdminState extends State<ResetAdmin> {
  late String? reset_email, password;
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 120, 167),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SettingsPageAdmin()));
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 70),
        child: SingleChildScrollView(
          // padding: EdgeInsets.symmetric(horizontal: 32, vertical: 50),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 10,
                    child: SvgPicture.asset(
                      "assets/images/log/reset.svg",
                      height: 220,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Masukan email untuk link reset password",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 10),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                // keyboardType: TextInputType.number,
                                obscureText: false,
                                // controller: otpController,
                                decoration: InputDecoration(
                                  icon: new Icon(Icons.email),
                                  border: InputBorder.none,
                                  hintText: 'Masukan Email Akun!',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    reset_email = value;
                                  });
                                },
                                validator: ((value) {
                                  if (value == '') {
                                    return "Masukan Email terlebih dahulu!";
                                  }
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () async {
                        if (_formState.currentState!.validate()) {
                          // print("Validation Success");
                          // print("email : " + email!);
                          print("email : " + reset_email!);
                          await Reset_pw.send_reset(reset_email, context);
                        } else {
                          print("Validation Error");
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 110),
                            Text(
                              "Kirim Reset",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            SizedBox(width: 80),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 25,
                            )
                          ],
                        ),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 120, 167),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavbarAdmin(),
    );
  }
}
