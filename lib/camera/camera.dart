import 'dart:convert';
import 'dart:io';
import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/opsi/opsi.dart';
import 'package:app_movie/splash/recording/SuccessAnak.dart';
import 'package:app_movie/splash/recording/SuccessDewasa.dart';
import 'package:app_movie/splash/recording/SuccessRemaja.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Kamera extends StatefulWidget {
  @override
  _KameraState createState() => _KameraState();
}

class _KameraState extends State<Kamera> {
  File? _image;

  // Future<void> _getImageFromCamera() async {
  //   final image = await ImagePicker().getImage(source: ImageSource.camera);

  //   setState(() {
  //     _image = File(image!.path);
  //   });
  // }

  Future<void> _uploadImage() async {
    try {
      if (_image == null) {
        return;
      }

      final url = Uri.parse(ip_universal + 'model-wajah');
      final request = http.MultipartRequest('POST', url);
      request.files.add(
        await http.MultipartFile.fromPath('file', _image!.path),
      );

      final response = await request.send();
      final jsonString = await response.stream.bytesToString();
      final json = jsonDecode(jsonString);

      if (response.statusCode == 200) {
        var label = json['label'];
        print(label);
        if (label == 'Dewasa') {
          EasyLoading.showSuccess("Berhasil!");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SuccessDewasa()));
        } else if (label == 'Remaja') {
          EasyLoading.showSuccess("Berhasil!");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SuccessRemaja()));
        } else {
          EasyLoading.showSuccess("Berhasil!");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SuccessAnak()));
        }
      } else {
        print('Gagal mengirim gambar.');
        EasyLoading.showError("Gagal mengirim gambar!");
      }
    } catch (e) {
      print('Terjadi kesalahan saat mengirim audio ke API: $e');
    }
  }

  Future fotoKamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(imagePicked!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Opsi()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    "Hi, Movielas",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text('---------------------------------------------',
                    style: TextStyle(fontSize: 3), textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                    'Scan wajah anda terlebih dahulu\n Klik open your camera untuk membuka kamera',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 350,
                  height: 550,
                  margin: EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 193, 193, 193).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      if (_image == null)
                        GestureDetector(
                          child: Image.asset(
                            "assets/images/cam.png",
                            width: 350,
                            height: 450,
                            fit: BoxFit.cover,
                          ),
                          onTap: fotoKamera,
                        ),
                      if (_image != null)
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.file(
                            _image!,
                            width: 350,
                            height: 440,
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(width: 20),
                                Icon(
                                  Icons.image,
                                  size: 35,
                                  color: Color.fromARGB(255, 26, 25, 25),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Preview",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 120),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 23, 23, 23),
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: _uploadImage,
                                  child: Text("POST"),
                                ),
                              ],
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
      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(left: 50, bottom: 30),
      //   child: Row(
      //     children: [
      //       SizedBox(
      //         width: 110,
      //       ),
      //       FloatingActionButton(
      //         onPressed: fotoKamera,
      //         tooltip: 'Kamera',
      //         child: const Icon(Icons.camera_alt_outlined),
      //         backgroundColor: Color.fromARGB(255, 0, 120, 167),
      //       ),
      //       SizedBox(
      //         width: 25,
      //       ),
      //       FloatingActionButton(
      //         onPressed: _uploadImage,
      //         tooltip: 'Send',
      //         child: const Icon(Icons.send),
      //         backgroundColor: Color.fromARGB(255, 0, 120, 167),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
