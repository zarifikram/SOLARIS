import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

import '../calibration_page.dart';
import '../rotate_page.dart';
import '../theme.dart';

class TiltAngleShow extends StatelessWidget {
  final double tiltAngle;

  const TiltAngleShow({Key? key, required this.tiltAngle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Optimum tilt angle".text.white.xl.make(),
              (tiltAngle.toStringAsFixed(2)+"°").text.white.xl3.bold.make(),
            ],
          ),
          InkWell(
            child: Icon(Icons.remove_red_eye_outlined, color: Colors.white,size:36).box.roundedFull.color(Themes.darkOrangeColor).p8.make(),

            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>RotatePage(tiltAngle:tiltAngle))),
          ),
        ],
      ),
    ).color(Themes.lightOrangeColor).p24.roundedSM.make().p16();
  }

}