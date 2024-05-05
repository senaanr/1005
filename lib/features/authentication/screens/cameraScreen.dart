import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      _initializeControllerFuture = _controller?.initialize();
      _initializeControllerFuture?.then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Color(0xFF2B963F),
            child: Icon(Icons.photo_library),
            onPressed: () async {
              final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                final savedImage = await _saveImageToGallery(image.path);
                if (savedImage != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(imagePath: savedImage),
                    ),
                  );
                }
              }
            },
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: FloatingActionButton(
              backgroundColor: Color(0xFFAACA61),
              child: Icon(Icons.camera_alt),
              onPressed: () async {
                try {
                  await _initializeControllerFuture;
                  final XFile? picture = await _controller?.takePicture();
                  if (picture != null) {
                    final savedImage = await _saveImageToGallery(picture.path);
                    if (savedImage != null) {

                    }
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Color(0xFF2B963F),
            child: Icon(Icons.cameraswitch_sharp),
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                CameraDescription? currentCameraDescription = _controller?.description;
                final cameras = await availableCameras();
                int currentCameraIndex = cameras.indexWhere((camera) => camera == currentCameraDescription);
                int nextCameraIndex = (currentCameraIndex + 1) % cameras.length;
                CameraDescription nextCameraDescription = cameras[nextCameraIndex];
                await _controller?.dispose();
                _controller = CameraController(nextCameraDescription, ResolutionPreset.medium);
                _initializeControllerFuture = _controller?.initialize();
                setState(() {});
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<String?> _saveImageToGallery(String imagePath) async {
    try {
      final result = await ImageGallerySaver.saveFile(imagePath);
      return result['filePath'];
    } catch (e) {
      print(e);
      return null;
    }
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resim'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Image.file(File(imagePath)),
    );
  }
}

