import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_app/first_phase.dart';
import 'package:solar_app/home_page.dart';
import 'package:solar_app/theme.dart';
import "package:velocity_x/velocity_x.dart";
import "package:sensors_plus/sensors_plus.dart";
import 'dart:async';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class CalibrationPage extends StatefulWidget{
  final double tiltAngle;

  const CalibrationPage({Key? key, required this.tiltAngle }) : super(key: key);

  @override
  State<CalibrationPage> createState() => _CalibrationPageState(tiltAngle);
}


class _CalibrationPageState extends State<CalibrationPage> {
  Vector3 _absoluteOrientation = Vector3.zero();
  final double tiltAngle;

  int? _groupValue = 0;

  _CalibrationPageState(this.tiltAngle);
  @override
  void initState() {
    super.initState();
    motionSensors.absoluteOrientation.listen((AbsoluteOrientationEvent event) {
      setState(() {
        _absoluteOrientation.setValues(event.yaw, event.pitch, event.roll);
      });
    });
  }

  void setUpdateInterval(int? groupValue, int interval) {
    motionSensors.orientationUpdateInterval = interval;
    motionSensors.absoluteOrientationUpdateInterval = interval;
    setState(() {
      _groupValue = groupValue;
    });
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          "Place the bubble to the center by tilting your panel.".text.extraBold.xl3.color(Themes.darkOrangeColor).center.make().p8(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "-".text.extraBold.xl6.make(),
              Transform.translate(
                offset: Offset(0, - 4*(tiltAngle) + 4*(degrees(_absoluteOrientation.y))),
                child: CircleAvatar(foregroundColor: Themes.darkOrangeColor,radius: 20,),
              ),
              "-".text.extraBold.xl6.make(),
            ],
          ).box.height(400).make(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Themes.lightOrangeColor,
                  ),
                  onPressed: (){Navigator.pop(context);},
                  child: "Go back".text.make().pSymmetric(h:32, v:16),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Themes.lightOrangeColor,
                  ),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
                  child: "Next".text.make().pSymmetric(h:32, v:16),
                )
              ],
            ).p16(),
        ],
      ),
    );
  }
}