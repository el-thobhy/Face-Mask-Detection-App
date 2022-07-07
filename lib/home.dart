import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraImage? imgCamera;
  CameraController? cameraController;
  bool isWorking = false;
  String result = "";

  initCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController!.startImageStream((imageFromStream) {
          if (!isWorking) {
            isWorking = true;
            imgCamera = imageFromStream;
          }
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Face Mask Detection',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Positioned(
                top: 0,
                left: 0,
                width: size.width,
                height: size.height,
                child: Container(
                  height: size.height-90,
                  child: (!cameraController!.value.isInitialized)
                      ? Container(
                          child: Text(
                            'Kamera Belum diinisislisasi',
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      : AspectRatio(
                          aspectRatio: cameraController!.value.aspectRatio,
                          child: CameraPreview(cameraController!),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
