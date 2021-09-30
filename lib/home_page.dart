import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_app/first_phase.dart';


import 'location_page.dart';

class HomePage extends StatelessWidget{
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
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
          MainScreenWidget("I want to place a new solar panel",(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocationPage()),
            );
          }),
          MainScreenWidget("I have Solaris Auto Tracking Panel",(){}),
          MainScreenWidget("I want to adjust my solar panel manually",(){})
        ],
      ),
    );
  }

}

class MainScreenWidget extends StatelessWidget {
  final String widgettext;
  final void Function () F ;
  MainScreenWidget(this.widgettext, this.F );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: F,
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFFD8E03),
          fixedSize: Size(double.infinity, 60),)
        ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(child: Text(widgettext,overflow: TextOverflow.clip,style: TextStyle(fontSize: 20),)),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color:Color(0xFFB95222),
                borderRadius: BorderRadius.circular(50 / 2),
              ),
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
