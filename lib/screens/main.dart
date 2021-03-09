import 'package:flutter/material.dart';
import 'widgets/TimeWidget.dart';
import 'widgets/pendulum.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('clock',style: TextStyle(color: Colors.white),)),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column( //no need
            children: [ //no need
              TimeWidget(),
              PendulumWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
