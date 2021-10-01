import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_compass/flutter_compass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'entypo_icons.dart';
import 'calibration_page.dart';
import 'theme.dart';
import "package:velocity_x/velocity_x.dart";

class RotatePage extends StatefulWidget {
  final double tiltAngle;
  RotatePage({Key? key, required this.tiltAngle}) : super(key: key);

  @override
  _RotatePageState createState() => _RotatePageState(tiltAngle);
}

class _RotatePageState extends State<RotatePage> {
  bool _hasPermissions = false;
  CompassEvent? _lastRead;
  DateTime? _lastReadAt;
  late double _dir;
  final double tiltAngle;

  _RotatePageState(this.tiltAngle);
  @override
  void initState() {
    super.initState();

    // _fetchPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SizedBox(
          child: Text("SOLARIS",
              style: GoogleFonts.righteous(
                  textStyle: TextStyle(
                      color: Color(0xFFFD8E03),
                      fontWeight: FontWeight.bold,
                      fontSize: 40))),
        ),
      ),
      body: Builder(builder: (context) {
        // if (_hasPermissions) {
        return Column(
          children: <Widget>[
            //  _buildManualReader(),
            Expanded(child: _buildCompass()),

            Row(
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
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CalibrationPage(tiltAngle: tiltAngle)));},
                  child: "Next".text.make().pSymmetric(h:32, v:16),
                )
              ],
            )
          ],
        );
        // } else {
        //   return _buildPermissionSheet();
        // }
      }),
    );
  }

/*
  Widget _buildManualReader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            child: Text('Read Value'),
            onPressed: ()  {
              // final CompassEvent tmp = await FlutterCompass.events!.first;
              // setState(() {
              //   _lastRead = tmp;
              //   _lastReadAt = DateTime.now();
              // });
              Navigator.push(context, MaterialPageRoute(builder:(context)=>CalibrationPage(tiltAngle:tiltAngle)));
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$_lastRead',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '$_lastReadAt',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

*/
  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;

        // if direction is null, then device does not support this sensor
        // show error message
        if (direction == null)
          return Center(
            child: Text("Device does not have sensors !"),
          );

        return Material(
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: (direction * (math.pi / 180) * -1),
                child: FittedBox(
                    child: Icon(
                  Entypo.down_circled,
                  color: Color(0xFFFD8E03),
                  size: 300,
                )),
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget _buildPermissionSheet() {
  //   return Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         Text('Location Permission Required'),
  //         ElevatedButton(
  //           child: Text('Request Permissions'),
  //           onPressed: () {
  //             Permission.locationWhenInUse.request().then((ignored) {
  //               _fetchPermissionStatus();
  //             });
  //           },
  //         ),
  //         SizedBox(height: 16),
  //         ElevatedButton(
  //           child: Text('Open App Settings'),
  //           onPressed: () {
  //             openAppSettings().then((opened) {
  //               //
  //             });
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // void _fetchPermissionStatus() {
  //   Permission.locationWhenInUse.status.then((status) {
  //     if (mounted) {
  //       setState(() => _hasPermissions = status == PermissionStatus.granted);
  //     }
  //   });
  // }
}
