import 'package:app_movie/dasbor/film_dewasa/NavbarDewasa.dart';
import 'package:app_movie/dasbor/film_remaja/NavbarRemaja.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:app_movie/splash/wait.dart';
import 'package:flutter/material.dart';

class SettingsPageRemaja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromARGB(255, 0, 120, 167),
        toolbarHeight: 60,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text("Alerts"),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text(
              'Notification',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: Color.fromARGB(255, 0, 120, 167),
            ),
          ),
          ListTile(
            leading: Icon(Icons.light),
            title: Text(
              'Mode',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text("Common"),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text(
              'Language',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman pengaturan bahasa
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text(
              'Privacy',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman pengaturan privasi
            },
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text("Account"),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(
              'Email',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman pengaturan privasi
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              'Nomor',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman pengaturan privasi
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text(
              'Change Password',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman pengaturan privasi
            },
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text("Movielem"),
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text(
              'About',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman pengaturan privasi
            },
          ),
          ListTile(
            leading: Icon(Icons.festival_outlined),
            title: Text(
              'Fitur',
              style: TextStyle(fontSize: 17),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman pengaturan privasi
            },
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Wait(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 150),
                  Text(
                    "Logout",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  SizedBox(width: 120),
                  Icon(
                    Icons.logout,
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
      bottomNavigationBar: NavbarRemaja(),
    );
  }
}
