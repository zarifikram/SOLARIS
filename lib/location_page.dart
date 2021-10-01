import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solar_app/theme.dart';
import "package:velocity_x/velocity_x.dart";

import 'first_phase.dart';
class LocationPage extends StatelessWidget {
  LocationPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
  var latLong = null;
  static final LatLng _kMapCenter =
    LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
    CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle : true,
          title: SizedBox(
            child: Text(
              "SOLARIS",
              style: GoogleFonts.righteous(textStyle: TextStyle(color: Color(0xFFFD8E03),fontWeight: FontWeight.bold,fontSize: 40) )
            ),
          ),
        ),
       body: Column(
          children: [

            GoogleMap(
              myLocationButtonEnabled: true,
              onTap: (LatLan)=>latLong = LatLan,
              initialCameraPosition: _kInitialPosition,
              markers: Set<Marker>.of(
          <Marker>[Marker(
          onTap: () {
            print('Tapped');
          },
          draggable: true,
          markerId: MarkerId('Marker'),
          position: LatLng(19.018255973653343, 72.84793849278007),
          onDragEnd: ((newPosition) {
            latLong = newPosition ;
          }))]),
            ).box.size(400,400).make().p32(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstPhase(latLng: latLong)));},
                  child: "Proceed".text.make().pSymmetric(h:32, v:16),
                )
              ],
            ),
          ],
        ),
        );
  }
}