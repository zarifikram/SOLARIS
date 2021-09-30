import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../theme.dart';

class EnergyGainShow extends StatefulWidget{
  final List<int> monthlyGain;
  final List<int> dailyGain;

  const EnergyGainShow({Key? key, required this.monthlyGain, required this.dailyGain}) : super(key: key);
  @override
  State<EnergyGainShow> createState() => _EnergyGainShowState(dailyGain, monthlyGain);
}

class _EnergyGainShowState extends State<EnergyGainShow> {
  final List<String> months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  final List<String> days = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10",
    "Day 11", "Day 12", "Day 13", "Day 14", "Day 15", "Day 16", "Day 17", "Day 18", "Day 19", "Day 20",
    "Day 21", "Day 22", "Day 23", "Day 24", "Day 25", "Day 26", "Day 27", "Day 28", "Day 29", "Day 30", "Day 31"];
  late List<String> currentMode;
  final List<int> monthlyGain;
  final List<int> dailyGain;
  late List<int> currentGain;
  _EnergyGainShowState(this.monthlyGain, this.dailyGain);
  @override
  void initState() {
    super.initState();
    currentGain = monthlyGain;
    currentMode = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Energy gain".text.white.semiBold.xl2.make(),
            Row(
              children: [
                ElevatedButton(onPressed: () {currentGain = monthlyGain; currentMode = months;setState(() {});},
                child: "Monthly".text.make(), style: ElevatedButton.styleFrom(),),
                VxBox().width(10).make(),
                ElevatedButton(onPressed: () {currentGain = dailyGain; currentMode = days; setState(() {}); },
                child: "Daily".text.make()),
              ],
            ),
          ],
        ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: currentGain.length,
          itemBuilder: (BuildContext context, int index)=>Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentGain[index].text.white.extraBold.xl4.make().p8(),
              currentMode[index].text.orange200.make(),
            ],
          ).box.color(Themes.darkOrangeColor).roundedSM.width(130).make().p8(),
        ).py12().expand(),
      ],
    ).box.height(220).color(Themes.lightOrangeColor).roundedSM.p20.make().p16();
  }
}