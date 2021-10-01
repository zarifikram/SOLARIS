import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'first_phase.dart';
import 'home_page.dart';
import 'location_page.dart';
import 'package:flutter/services.dart';
void main() {

SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
  (_)
{
  runApp(SolarApp());
}
);
  
}

//0xfd8e03
//0xb95222
class SolarApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

