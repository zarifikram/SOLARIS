import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Info{
  late double optimumPowerPerSqmeter ;
  late double optimumTiltAngle ;
  late double profitPercentage ;
  late double regularPowerPerSqmeter ;


  Info({
   required this.optimumPowerPerSqmeter ,
   required this.optimumTiltAngle ,
   required this.profitPercentage,
   required this.regularPowerPerSqmeter
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      optimumPowerPerSqmeter: json['optimum_power_per_sqmeter'],
      optimumTiltAngle: json['optimum_tilt_angle'] , 
      profitPercentage: json['profit_percentage'] , 
      regularPowerPerSqmeter: json['regular_power_per_sqmeter']
    );
  }

  static Future<Info> fetchInfo(LatLng latLng) async {
  final response = await http
      .get(Uri.parse('http://rafeedbhuiyan17.pythonanywhere.com/api/temporal/daily/optimum?latitude=${latLng.latitude}&longitude=${latLng.longitude}'));

  if (response.statusCode == 200) {
    return Info.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
}
