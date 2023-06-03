import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/dasbor/film_remaja/NavbarRemaja.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:app_movie/dasbor/film_anak/NavbaraAnak.dart';

class BacaAnak extends StatefulWidget {
  const BacaAnak({super.key});

  @override
  State<BacaAnak> createState() => _BacaAnakState();
}

class _BacaAnakState extends State<BacaAnak> {
  // final flutterWebviewPlugin = FlutterWebviewPlugin();
  late InAppWebViewController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 10,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('https://bukudigital.kpk.go.id/kategori/Anak'),
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
        onWebViewCreated: (controller) {
          webviewController = controller;
        },
      ),
      bottomNavigationBar: NavbarAnak(),
    );
  }
}
