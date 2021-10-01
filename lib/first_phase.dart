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
  
  Future<Info> fetchInfo() async {
  final response = await http
      .get(Uri.parse('rafeedbhuiyan17.pythonanywhere.com/api/temporal/daily/optimum?latitude=${latLng.latitude}&longitude=${latLng.longitude}'));

  if (response.statusCode == 200) {
    return Info.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
  @override
  _FirstPhaseState createState() => _FirstPhaseState();
  
}
  
  class _FirstPhaseState extends State<FirstPhase> {
      late Future<Info> futureInfo;

  @override
  void initState() {
    super.initState();
    futureInfo = fetchInfo();
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
      body: Column(
        children: [
          TiltAngleShow(tiltAngle: 124.5,),
          EnergyGainShow(
            dailyGain: [20, 23, 30, 50, 10, 50, 2, 5],
            monthlyGain: [56, 47, 10, 50, 10, 50, 12, 60,],
          ),
        ],
      )
    );
  }

}

