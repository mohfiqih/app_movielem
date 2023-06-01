import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/dasbor/film_dewasa/NavbarDewasa.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:app_movie/dasbor/film_anak/NavbaraAnak.dart';

class HomePageDewasa extends StatefulWidget {
  const HomePageDewasa({super.key});

  @override
  State<HomePageDewasa> createState() => _HomePageDewasaState();
}

class _HomePageDewasaState extends State<HomePageDewasa> {
  // final flutterWebviewPlugin = FlutterWebviewPlugin();
  late InAppWebViewController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'Home Page Anak',
        //   style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        // ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 5,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('https://www.p8uh60hx4k.my.id/'),
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
      bottomNavigationBar: NavbarDewasa(),
    );
  }
}
