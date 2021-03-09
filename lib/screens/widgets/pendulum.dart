import 'dart:ui';

import 'package:flutter/material.dart';

class PendulumWidget extends StatefulWidget {
  @override
  _PendulumWidgetState createState() => _PendulumWidgetState();
}

class _PendulumWidgetState extends State<PendulumWidget> with TickerProviderStateMixin{
  Animation pendulumAnimation;
  AnimationController pendulumController;
  @override
  void initState() {
    super.initState();
    pendulumController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    pendulumController.addListener(() {
      if(pendulumController.isCompleted){
        pendulumController.reverse();
      }else if(pendulumController.isDismissed){
        pendulumController.forward();
      }
      setState(() {

      });
    });
    pendulumController.forward();
  }
  @override
  Widget build(BuildContext context) {
    pendulumAnimation = CurvedAnimation(parent: pendulumController, curve: Curves.easeInOut);
    pendulumAnimation = Tween(begin: -0.5, end: 0.5).animate(pendulumAnimation);
    return Transform(
      alignment: FractionalOffset(0.5,0.0),
      transform: Matrix4.rotationZ(pendulumAnimation.value),
      child: Container(
        child: Image.asset('images/pendulum.png',width: 300,height: 300,),
      ),
    );
  }
}
