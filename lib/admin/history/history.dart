import 'package:app_movie/admin/history/data/data_admin.dart';
import 'package:app_movie/admin/history/data/data_gender.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:app_movie/register/controller_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuHistory extends StatefulWidget {
  const MenuHistory({super.key});

  @override
  State<MenuHistory> createState() => _MenuHistoryState();
}

class _MenuHistoryState extends State<MenuHistory> {
  late String name;
  late String email;
  // late String no_telp;
  late String password;
  late String re_password;

  final _formState = GlobalKey<FormState>();
  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final textControllerRePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Data History",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Halaman History",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Color.fromARGB(255, 99, 99, 99),
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "assets/images/dasbor/history.jpg",
                          height: 290,
                          width: 370,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DataAdmin()));
                },
                child: Container(
                  width: 370,
                  height: 90,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 71, 202),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 150, 150, 150).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add_chart_outlined,
                                    size: 28,
                                    color: Color.fromARGB(255, 254, 254, 254),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Data Admin",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DataGender()));
                },
                child: Container(
                  width: 370,
                  height: 90,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 71, 202),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 150, 150, 150).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add_chart_outlined,
                                    size: 28,
                                    color: Color.fromARGB(255, 254, 254, 254),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Data Gender",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 20, bottom: 10),
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text('Register Admin'),
                  content: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Form(
                      key: _formState,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Container(
                              width: 1000,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Container(
                                      child: Text(
                                        "Email Address",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
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
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: false,
                                              controller: textControllerEmail,
                                              onChanged: (value) {
                                                setState(() {
                                                  email = value;
                                                });
                                              },
                                              validator: ((value) {
                                                if (value == '') {
                                                  return "Mohon isi terlebih dahulu!";
                                                }
                                              }),
                                              decoration: InputDecoration(
                                                icon: new Icon(Icons.email),
                                                border: InputBorder.none,
                                                hintText: 'Masukan Email..',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Container(
                                      child: Text(
                                        "Nama Lengkap",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
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
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: false,
                                              controller: textControllerName,
                                              onChanged: (value) {
                                                setState(() {
                                                  name = value;
                                                });
                                              },
                                              validator: ((value) {
                                                if (value == '') {
                                                  return "Mohon isi terlebih dahulu!";
                                                }
                                              }),
                                              decoration: InputDecoration(
                                                icon: new Icon(Icons.people),
                                                border: InputBorder.none,
                                                hintText: 'Masukan Nama..',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Container(
                                      child: Text(
                                        "Password",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
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
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: true,
                                              controller:
                                                  textControllerPassword,
                                              onChanged: (value) {
                                                setState(() {
                                                  password = value;
                                                });
                                              },
                                              validator: ((value) {
                                                if (value == '') {
                                                  return "Mohon isi terlebih dahulu!";
                                                }
                                              }),
                                              decoration: InputDecoration(
                                                icon: new Icon(Icons.password),
                                                border: InputBorder.none,
                                                hintText: 'Masukan Password..',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Container(
                                      child: Text(
                                        "Repeat Password",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
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
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: true,
                                              onChanged: (value) {
                                                setState(() {
                                                  re_password = value;
                                                });
                                              },
                                              controller:
                                                  textControllerRePassword,
                                              validator: ((value) {
                                                if (value == '') {
                                                  return "Mohon isi terlebih dahulu!";
                                                }
                                              }),
                                              decoration: InputDecoration(
                                                icon: new Icon(Icons.repeat),
                                                border: InputBorder.none,
                                                hintText:
                                                    'Masukan re-Password..',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  InkWell(
                                    onTap: () async {
                                      if (_formState.currentState!.validate()) {
                                        print("Validation Success");
                                        print("email : " + email);
                                        print("name : " + name);
                                        print("password : " + password);
                                        print("re_password : " + re_password);
                                        await RegisterAdmin.register_admin(
                                            email,
                                            name,
                                            password,
                                            re_password,
                                            context);
                                      } else {
                                        print("Validation Error");
                                      }
                                    },
                                    // onTap: () {

                                    // },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(width: 80),
                                          Text(
                                            "Register",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          SizedBox(width: 50),
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
                                          color:
                                              Color.fromARGB(255, 0, 71, 202),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
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
          tooltip: 'Tambah',
          child: const Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 0, 71, 202),
        ),
      ),
      bottomNavigationBar: NavbarAdmin(),
    );
  }
}
