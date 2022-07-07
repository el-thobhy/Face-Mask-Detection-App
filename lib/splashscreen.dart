import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';

class MySplashPage extends StatefulWidget {
  const MySplashPage({Key? key}) : super(key: key);

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      title: Text(
        'Face Mask Detection',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
      image: Image.asset('assets/mask_icon.png', color: Colors.white,),
      navigateAfterSeconds: Home(),
      loadingText: Text(
        'by El Thobhy',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16
        ),
      ),
      loaderColor: Colors.white,
      photoSize: 130,
      backgroundColor: Colors.black,
    );
  }
}
