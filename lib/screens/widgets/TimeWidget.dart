import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> with TickerProviderStateMixin {
  Animation clockAnimation;
  AnimationController clockController;

  @override
  void initState() {
    super.initState();
    clockController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    clockController.addListener(() {
      if (clockController.isCompleted) {
        clockController.reverse();
      } else if (clockController.isDismissed) {
        clockController.forward();
      }
      setState(() {});
    });
    clockController.forward();

  }

  @override
  Widget build(BuildContext context) {
    clockAnimation =
        CurvedAnimation(parent: clockController, curve: Curves.easeInOut);
    clockAnimation = Tween(begin: 0.0, end: 10.0).animate(clockAnimation);
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Container(
          width: 350,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Stack(
              children: [
                Text(
                  timeShow(),
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Transform(
                //   alignment: FractionalOffset(0.5,0.0),
                //   transform: Matrix4.rotationZ(clockAnimation.value),
                //   child: Container(
                //     width: 20,
                //     height: 20,
                //     color: Colors.deepOrange,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String timeShow() {
    return '${DateTime.now().hour} : ${DateTime.now().minute}';
  }
}
