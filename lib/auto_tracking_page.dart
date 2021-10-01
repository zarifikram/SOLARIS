import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AutoTrackingPage extends StatelessWidget {
  AutoTrackingPage({Key? key}) : super(key: key);

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.timer,color: Color(0xFFB95222),size: 150,),
              Container(
                child: Text("COMING SOON",
                    style: GoogleFonts.righteous(
                        textStyle: TextStyle(
                            color:  Color(0xFFB95222),
                            fontWeight: FontWeight.bold,
                            fontSize: 40))),
              ),
              SizedBox(height: 18,)
            ],
          ),
        ));
  }
}
