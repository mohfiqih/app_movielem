import 'dart:async';
import 'dart:io';
import 'package:app_movie/IP/ip.dart';
import 'package:app_movie/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(CameraApp());
}

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (cameras == null) {
      return Container();
    }
    return MaterialApp(
      title: 'IP Camera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;
  bool _isCameraFront = false;
  List<dynamic>? _boundingBoxes;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      print('No cameras available');
      return;
    }

    final camera = _isCameraFront ? cameras.last : cameras.first;

    _cameraController = CameraController(camera, ResolutionPreset.medium);
    await _cameraController.initialize();

    if (!mounted) {
      return;
    }

    setState(() {
      _isCameraInitialized = true;
    });

    _cameraController.setFlashMode(FlashMode.off); // Disable flash mode
    _startStreaming();
  }

  void _startStreaming() async {
    if (_isCameraInitialized) {
      while (true) {
        final image = await _cameraController!.takePicture();
        final bytes = await image.readAsBytes();
        _sendFrame(bytes);
      }
    }
  }

  void _sendFrame(List<int> frame) async {
    final url = ip_universal + 'process_image';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: frame,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/octet-stream',
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.body;
        final boundingBoxes = parseBoundingBoxes(responseData);
        setState(() {
          _boundingBoxes = boundingBoxes;
        });
      }
    } catch (error) {
      print('Error sending frame: $error');
    }
  }

  List<dynamic> parseBoundingBoxes(String response) {
    // Parse the response and return a list of bounding boxes
    // Example parsing logic:
    // final List<dynamic> boundingBoxes = json.decode(response)['bounding_boxes'];
    // return boundingBoxes;
    return []; // Dummy implementation
  }

  IconData _getCameraLensIcon() {
    return _isCameraFront ? Icons.camera_front : Icons.camera_rear;
  }

  void _toggleCameraLens() {
    setState(() {
      _isCameraFront = !_isCameraFront;
      _initializeCamera();
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Camera'),
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 192, 0, 29),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Onboarding(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(_getCameraLensIcon()),
            onPressed: _toggleCameraLens,
          ),
        ],
      ),
      body: FittedBox(
        fit: BoxFit.cover,
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Stack(
            children: [
              SizedBox(
                width: _cameraController.value.previewSize?.height,
                height: _cameraController.value.previewSize?.width,
                child: CameraPreview(_cameraController),
              ),
              if (_boundingBoxes != null)
                Positioned.fill(
                  child: CustomPaint(
                    painter: BoundingBoxPainter(
                      _boundingBoxes!,
                      _cameraController.value.previewSize!.width,
                      _cameraController.value.previewSize!.height,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoundingBoxPainter extends CustomPainter {
  final List<dynamic> boundingBoxes;
  final double previewWidth;
  final double previewHeight;

  BoundingBoxPainter(
    this.boundingBoxes,
    this.previewWidth,
    this.previewHeight,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / previewWidth;
    final scaleY = size.height / previewHeight;

    for (var boundingBox in boundingBoxes) {
      final left = boundingBox['left'] * scaleX;
      final top = boundingBox['top'] * scaleY;
      final right = boundingBox['right'] * scaleX;
      final bottom = boundingBox['bottom'] * scaleY;

      final rect = Rect.fromLTRB(left, top, right, bottom);
      final paint = Paint()
        ..color = Colors.green
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
