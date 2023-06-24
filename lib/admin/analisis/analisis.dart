import 'package:app_movie/IP/ip.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Analisis extends StatefulWidget {
  const Analisis({super.key});

  @override
  State<Analisis> createState() => _AnalisisState();
}

class _AnalisisState extends State<Analisis> {
  // final flutterWebviewPlugin = FlutterWebviewPlugin();
  late InAppWebViewController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analisis',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 0, 120, 167),
        toolbarHeight: 60,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(ip_analisis),
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
      bottomNavigationBar: NavbarAdmin(),
    );
  }
}
