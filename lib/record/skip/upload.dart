import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class UploadFile extends StatelessWidget {
  const UploadFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: TextButton(
          onPressed: () {
            // uploadFile();
          },
          child: Text('Upload'),
        )),
      ),
    );
  }
}

// uploadFile() async {
//   var request = http.MultipartRequest("POST", Uri.parse(""));

//   request.fields['audio'] = "audio";
//   request.fields['file'] = "folder";
//   request.headers['Authorization'] = "";

//   var audio =
//       http.MultipartFile.fromBytes('audio', (await rootBundle.load('assets/'),), filename: 'test.wav');
// }
