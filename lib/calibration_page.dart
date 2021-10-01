import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import "package:velocity_x/velocity_x.dart";
//import "package:sensors_plus/sensors_plus.dart";
//import 'package:aeyrium_sensor/aeyrium_sensor.dart';
//import 'dart:async';
class CalibrationPage extends StatefulWidget{
  final double tiltAngle;
  
  const CalibrationPage({Key? key, required this.tiltAngle }) : super(key: key);

  @override
  State<CalibrationPage> createState() => _CalibrationPageState();
}


class _CalibrationPageState extends State<CalibrationPage> {
  late int x,y,z;
  String _data = "";
/*
  StreamSubscription<dynamic>  _streamSubscriptions;

  @override
  void initState() {
    _streamSubscriptions = AeyriumSensor.sensorEvents.listen((event) {
      setState(() {
        _data = "Pitch ${event.pitch} , Roll ${event.roll}";
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    if (_streamSubscriptions != null) {
      _streamSubscriptions.cancel();
    }
    super.dispose();
  }

*/
//  @override
//  void initState() {
//    accelerometerEvents.listen((event) {

//    });
//    super.initState();
  //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar( elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle : true,
        title: SizedBox(
          child: Text(
              "SOLARIS",
              style: GoogleFonts.righteous(textStyle: TextStyle(color: Color(0xFFFD8E03),fontWeight: FontWeight.bold,fontSize: 40) )
          ),
        ),),
     // body: Text('Device : $_data'),
      /*Row(
        children: [
          x.text.make(),
          y.text.make(),
          z.text.make(),
        ],
      ),*/
    );
  }
}