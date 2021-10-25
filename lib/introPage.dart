import 'package:crackers/launchScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: Text('Warning',style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),),
          content: Text('Do you really want to exit',style: TextStyle(color: Colors.white60),),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: () => Navigator.pop(context, true),
            ),
            TextButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        ),
      ),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: height*0.10,horizontal: width*0.070),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Fire on ",
                style: GoogleFonts.roboto(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: height*0.046,
                ),
              ),
              SizedBox(
                height: height*0.020,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(" Instruction: ",
                    style: GoogleFonts.roboto(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: height*0.016,
                    ),
                  ),
                  Text("  Designed with performance in mind—Framer is \n  cross-platform and gives you a fast and stable ",
                    style: GoogleFonts.roboto(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: height*0.011,
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: height*0.15,
              ),
              Center(
                child: Text(" Ready to launch ",
                  style: GoogleFonts.roboto(
                    color: Color.fromRGBO(166, 255, 134, 1.0),
                    fontSize: height*0.013,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RocketContainer(height: height, width: width,img: "images/rocket.png",),
                  RocketContainer(height: height, width: width,img: "images/rocket1.png",),
                  RocketContainer(height: height, width: width,img: "images/rocket2.png",),
                  RocketContainer(height: height, width: width,img: "images/rocket3.png",)
                ],
              ),
              SizedBox(
                height: height*0.05,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LaunchScreen()));
                },
                child: Container(
                  height: height*0.095,
                  width: width*0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color.fromRGBO(58, 58, 61, 1.0),
                  ),
                  child: Center(
                    child: Text(" Launch all ",
                      style: GoogleFonts.roboto(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.bold,
                        fontSize: height*0.016,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RocketContainer extends StatelessWidget {
  const RocketContainer({
    Key key,
    @required this.height,
    @required this.width,
    @required this.img
  }) : super(key: key);

  final double height;
  final double width;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 30.0),
      height: height*0.095,
      width: width*0.18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color.fromRGBO(58, 58, 61, 1.0),
          image: DecorationImage(
            image: AssetImage(img),
          )
      ),
    );
  }
}
