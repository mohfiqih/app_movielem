import 'dart:async';
import 'package:app_movie/admin/navbar_admin.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(LiveStreamApp(cameras: cameras));
}

class LiveStreamApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const LiveStreamApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Stream',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraScreen(cameras: cameras),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    if (widget.cameras.isNotEmpty) {
      final camera = widget.cameras[0];
      _cameraController = CameraController(camera, ResolutionPreset.medium);
      await _cameraController.initialize();
      if (!mounted) {
        return;
      }
      setState(() {
        _isCameraInitialized = true;
      });
    } else {
      EasyLoading.showError("Tidak Ada Kamera");
      print('Tidak ada kamera yang tersedia');
      return;
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Stream'),
      ),
      body: AspectRatio(
        aspectRatio: _cameraController.value.aspectRatio,
        child: CameraPreview(_cameraController),
      ),
      bottomNavigationBar: NavbarAdmin(),
    );
  }
}
