import 'package:crackers/endCredicts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';




class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (10)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
        child: Lottie.asset(
          'images/rocket.json',
          controller: _controller,
          height: height * 1.0,
          width: width*1.0,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => EndCredits()),
              ));
          },
        ),
      ),
    );
  }
}