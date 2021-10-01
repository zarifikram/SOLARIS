import 'package:http/http.dart' as http;
import 'dart:convert';
class Info{
  final double optimumPowerPerSqmeter ;
  final double optimumTiltAngle ;
  final double profitPercentage ;
  final double regularPowerPerSqmeter ;


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

  Future<Info> fetchInfo() async {
  final response = await http
      .get(Uri.parse('rafeedbhuiyan17.pythonanywhere.com/api/temporal/daily/optimum?latitude=23.8103&longitude=90.4125'));

  if (response.statusCode == 200) {
    return Info.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
}
