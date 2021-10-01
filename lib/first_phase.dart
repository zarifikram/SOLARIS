import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solar_app/theme.dart';
import "package:velocity_x/velocity_x.dart";
import 'info.dart' ;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Widgets/energy_gain_show.dart';
import 'Widgets/tilt_angle_show.dart';

class FirstPhase extends StatefulWidget {
  final LatLng latLng;
  const FirstPhase({Key? key, required this.latLng}) : super(key: key);
  
  
  @override
  _FirstPhaseState createState() => _FirstPhaseState(latLng);
  
}
  
class _FirstPhaseState extends State<FirstPhase> {
  final LatLng latLng;
  late Future<Info> futureInfo;
  late Info info;

  _FirstPhaseState(this.latLng);
  @override
  void initState() {
    super.initState();
    futureInfo = Info.fetchInfo(latLng);  // I want to send latLng to fetchInfo()
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle : true,
        title: SizedBox(
          child: Text(
              "SOLARIS",
              style: GoogleFonts.righteous(textStyle: TextStyle(color: Color(0xFFFD8E03),fontWeight: FontWeight.bold,fontSize: 40) )
          ),
        ),),
        body:  FutureBuilder<Info>(
          future: futureInfo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  TiltAngleShow(tiltAngle: snapshot.data!.optimumTiltAngle),
                  EnergyGainShow(
                    dailyGain: [20, 23, 30, 50, 10, 50, 2, 5],
                    monthlyGain: [56, 47, 10, 50, 10, 50, 12, 60,],
                  ),
                ],
              );Text(snapshot.data!.regularPowerPerSqmeter.toString());
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
    );
  }

}
