import 'dart:convert';
import 'dart:core';
import 'package:crackers/launchScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;



class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool redButtonSts = false;
  bool yellowButtonSts =false;
  bool greenButtonSts =false ;
  bool purpleButtonSts =false;
  List data = [];
  bool rocket1 = false;
  bool rocket2 = false;
  bool rocket3 = false;
  bool rocket4 = false;
  int count = 0;


  launchSts() async {
    final  res = await http.get(Uri.parse("http://192.168.1.18:8000/"));
    Map data = json.decode(res.body);
    setState(() {
     rocket1 = data['rocket_1_About'];
     rocket2 = data['rocket_2_About'];
     rocket3 = data['rocket_3_About'];
     rocket4 = data['rocket_4_About'];
    });

   print("**************************** ${data['rocket_1_About']}");
   print("$rocket1");
  }
@override
  void initState() {
    // TODO: implement initState
  launchSts();
    super.initState();
  }
  //bool rocket1,rocket2,rocket3,rocket4 = false;
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
          padding: EdgeInsets.symmetric(vertical: height*0.05,horizontal: width*0.070),
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
                height: height*0.035,
              ),
              Center(
                child: Text(" Ready to launch ",
                  style: GoogleFonts.roboto(
                    color: Color.fromRGBO(166, 255, 134, 1.0),
                    fontSize: height*0.013,
                  ),
                ),
              ),
              Container(
                height: height*0.5,
                width: width*0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //buildAnimContainerRed(context, width),

                    (redButtonSts == true) ? buildAnimContainerRed(context, width): Expanded(child: Text(" "),),
                    //(redButtonSts == false) ? buildAnimContainerRed(context, width): Expanded(child: Text(" "),),
                    (yellowButtonSts == true) ? buildAnimContainerGYellow(context, width): Expanded(child: Text(" "),),
                    (greenButtonSts == true) ? buildAnimContainerGreen(context, width): Expanded(child: Text(" "),),
                    (purpleButtonSts == true) ? buildAnimContainerPurple(context,width): Expanded(child: Text(" "),),

                    ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: (){
                        //launchRocket("rocket_1_About");

                        setState(() {
                          // while(count<1)
                          //   {
                          //     redButtonSts = true;
                          //     count = 1;
                          //   }
                          //   print("$count after");
                          if(redButtonSts == false){
                            redButtonSts = true;
                          }else{
                            redButtonSts = false;
                          }
                          print("print $redButtonSts");
                          //redButtonSts = true;
                          print("redButtonSts $redButtonSts");
                        });
                        print("redstate $redButtonSts");
                        //redButtonSts = false;
                        print("after the $redButtonSts");
                      },
                      child: RocketContainer(height: height, width: width,img: "images/rocket.png",)
                  ),
                  InkWell(
                      onTap: (){
                        //launchRocket("rocket_2_About");
                        setState(() {
                          if(yellowButtonSts == false){
                            yellowButtonSts =true;
                          }else{
                            yellowButtonSts = false;
                          }
                          print("yellowButtonSts $yellowButtonSts");
                        });
                      },
                      child: RocketContainer(height: height, width: width,img: "images/rocket1.png",)),
                  InkWell(
                      onTap: (){
                        //launchRocket("rocket_3_About");
                        setState(() {
                          if(greenButtonSts == false){
                            greenButtonSts =true;
                          }else{
                            greenButtonSts = false;
                          }
                          print("greenButtonSts $greenButtonSts");
                        });

                      },
                      child: RocketContainer(height: height, width: width,img: "images/rocket2.png",)),
                  InkWell(
                      onTap: (){
                        //launchRocket("rocket_4_About");
                        setState(() {
                          if(purpleButtonSts == false){
                            purpleButtonSts =true;
                          }else{
                            purpleButtonSts = false;
                          }
                          print("purpleButtonSts $purpleButtonSts");
                        });
                      },
                      child: RocketContainer(height: height, width: width,img: "images/rocket3.png",))
                ],
              ),
              SizedBox(
                height: height*0.05,
              ),
              GestureDetector(
                onTap: (){
                  // launchRocket("rocket_1_About");
                  //
                  // Future.delayed(Duration(seconds: 2 ), () {
                  //   launchRocket("rocket_2_About");
                  // });
                  // Future.delayed(Duration(seconds: 3), () {
                  //   launchRocket("rocket_3_About");
                  // });
                  // Future.delayed(Duration(seconds: 3), () {
                  //   launchRocket("rocket_4_About");
                  // });

                  // launchRocket("rocket_2_About");
                  // launchRocket("rocket_3_About");
                  // launchRocket("rocket_4_About");
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

  Expanded buildAnimContainerPurple(BuildContext context, double width) {
    return Expanded(
                  child: Lottie.asset(
                    'images/purple_blast.json',
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.fill,
                    //alignment: Alignment.center,
                    width: width*1.0,
                    repeat: false,
                    animate: true,
                  ),
                );
  }

  Expanded buildAnimContainerGreen(BuildContext context, double width) {
    return Expanded(
                  child: Lottie.asset(
                    'images/green_blast.json',
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    width: width*1.0,
                    repeat: false,
                    animate: true,
                  ),
                );
  }

  Expanded buildAnimContainerGYellow(BuildContext context, double width) {
    return Expanded(
                  child: Lottie.asset(
                    'images/yellow_blast.json',
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    width: width*1.0,
                    repeat: false,
                    animate: true,
                  ),
                );
  }

  Expanded buildAnimContainerRed(BuildContext context, double width) {
    return Expanded(
            child: Lottie.asset(
              'images/red_blast.json',
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.fill,
              alignment: Alignment.center,
              width: width*1.0,
              repeat: false,
              animate: true,
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
      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 20.0),
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

launchRocket(String a) async {
  await http.get(Uri.parse("http://192.168.1.18:8000/$a/1/"));
}