import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EndCredits extends StatefulWidget {


  @override
  _EndCreditsState createState() => _EndCreditsState();
}

class _EndCreditsState extends State<EndCredits> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: height*0.15,horizontal: width*0.070),
        height: height*1.0,
        width: width*1.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(49, 51, 61, 1.0),
                  Color.fromRGBO(0,0,0, 0.93)
                ],
                stops: [0.1,0.8]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height*0.50,
              width: width*0.90,
              color: Colors.transparent,
              child: Lottie.asset(
                'images/end.json',
                height: MediaQuery.of(context).size.height * 1,
                width: width*1.0,
                repeat: true,
                animate: true,
              ),
            ),
            SizedBox(
              height: height*0.020,
            ),
            Text(" Happy Diwali ",
              style: GoogleFonts.roboto(
                color: Color.fromRGBO(255, 255, 255, 1.0),
                fontWeight: FontWeight.bold,
                fontSize: height*0.046,
              ),
            ),
            SizedBox(
              height: height*0.010,
            ),
            Text(" Your rocket launched successfully ",
              style: GoogleFonts.roboto(
                color: Color.fromRGBO(255, 255, 255, 1.0),
                fontSize: height*0.016,
              ),
            ),
            SizedBox(
              height: height*0.030,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text(" Go Back "))

          ],
        ),
      ),
    );
  }
}
