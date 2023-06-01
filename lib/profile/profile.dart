// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:app_movie/dasbor/film_dewasa/Home_dewasa.dart';
import 'package:app_movie/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:app_movie/profile/controller_edit.dart';

import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String email, name;
  late String password, repassword;

  final _formState = GlobalKey<FormState>();

  final _formStateProfil = GlobalKey<FormState>();
  // final textControllerChangeName = TextEditingController();
  // final textControllerChangeEmail = TextEditingController();

  // final textControllerChangePassword = TextEditingController();
  // final textControllerChangeRePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePageDewasa()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              CircleAvatar(
                radius: 120,
                backgroundImage: NetworkImage(
                    "https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2019/12/12/60017812.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Moh. Fiqih Erinsyah",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "mohfiqiherinsyah@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // ------------------------- SHOW EDIT PASSWORD ------------------------ //
              InkWell(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('Edit Password'),
                          content: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Form(
                              key: _formState,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Container(
                                      child: Text(
                                        "Jika ingin mengubah password, masukan email yang sekarang anda gunakan dan ubah password yang ingin diubah.",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: false,
                                              onChanged: (value) {
                                                // setState(() {
                                                //   email = value;
                                                // });
                                              },
                                              // controller:
                                              //     textControllerChangeEmail,
                                              validator: ((value) {
                                                if (value == '') {
                                                  return "Mohon isi terlebih dahulu!";
                                                }
                                              }),
                                              decoration: InputDecoration(
                                                icon: new Icon(Icons.email),
                                                border: InputBorder.none,
                                                hintText: 'Masukan Email',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: true,
                                              onChanged: (value) {
                                                // setState(() {
                                                //   email = value;
                                                // });
                                              },
                                              // controller:
                                              //     textControllerChangePassword,
                                              validator: ((value) {
                                                if (value == '') {
                                                  return "Mohon isi terlebih dahulu!";
                                                }
                                              }),
                                              decoration: InputDecoration(
                                                icon: new Icon(Icons.password),
                                                border: InputBorder.none,
                                                hintText: 'New Passoword',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (_formState.currentState!.validate()) {
                                        print("Validation Success");
                                      } else {
                                        print("Validation Error");
                                      }
                                    },
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(width: 30),
                                          Text(
                                            "Update Password",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                          SizedBox(width: 70),
                                          Icon(
                                            Icons.update,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ],
                                      ),
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 141, 20, 206),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [],
                        );
                      });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 100),
                      Text(
                        "Edit Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      SizedBox(width: 50),
                      Icon(
                        Icons.edit_note,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 141, 20, 206),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Text('Edit Profil'),
                            content: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Form(
                                key: _formStateProfil,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Container(
                                        child: Text(
                                          "Jika hanya ingin mengubah nama, tetap masukan email yang sekarang anda gunakan dan nama yang ingin diubah.",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Container(
                                        padding: const EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                obscureText: false,
                                                onChanged: (value) {
                                                  setState(() {
                                                    email = value;
                                                  });
                                                },
                                                // controller:
                                                //     textControllerChangeEmail,
                                                validator: ((value) {
                                                  if (value == '') {
                                                    return "Mohon isi terlebih dahulu!";
                                                  }
                                                }),
                                                decoration: InputDecoration(
                                                  icon: new Icon(Icons.email),
                                                  border: InputBorder.none,
                                                  hintText: 'Update Email',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Container(
                                        padding: const EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                obscureText: false,
                                                onChanged: (value) {
                                                  setState(() {
                                                    name = value;
                                                  });
                                                },
                                                // controller:
                                                //     textControllerChangeName,
                                                validator: ((value) {
                                                  if (value == '') {
                                                    return "Mohon isi terlebih dahulu!";
                                                  }
                                                }),
                                                decoration: InputDecoration(
                                                  icon: new Icon(Icons.people),
                                                  border: InputBorder.none,
                                                  hintText: 'Update Nama',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_formStateProfil.currentState!
                                            .validate()) {
                                          print("Validation Success");
                                          print("email : " + email);
                                          print("name : " + name);
                                          await EditProfil.edit(
                                              email, name, context);
                                        } else {
                                          print("Validation Error");
                                        }
                                      },
                                      child: Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(width: 30),
                                            Text(
                                              "Update Profil",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(width: 100),
                                            Icon(
                                              Icons.update,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                          ],
                                        ),
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 40),
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Edit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      // var _logoutUrl =
                      //     Uri.parse('http://192.168.0.102:5000/logout');
                      // var request = new http.Request("POST", _logoutUrl);
                      // var response_send = await request.send();

                      // var response =
                      //     await http.Response.fromStream(response_send);

                      // if (response.statusCode == 200) {
                      //   var parsed = jsonDecode(response.body);

                      //   Navigator.pushReplacement(context,
                      //       MaterialPageRoute(builder: (context) => Welcome()));
                      //   await EasyLoading.showSuccess(parsed[0]);
                      // } else {
                      //   var gagal = "Gagal Logout!";
                      //   await EasyLoading.showSuccess(gagal);
                      // }
                      var json = "Berhasil Logout!";
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Welcome()));
                      await EasyLoading.showSuccess(json);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 30),
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ]),

              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
