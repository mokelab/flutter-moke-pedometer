import 'package:flutter/material.dart';

import 'package:moke_pedometer/moke_pedometer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _steps = 0;
  int _floorUp = 0;
  int _floorDown = 0;

  @override
  void initState() {
    super.initState();
    _queryPedometerData();
  }

  void _queryPedometerData() async {
    var data = await MokePedometer.queryToday();
    setState(() {
      _steps = data.steps;
      _floorUp = data.floorUp;
      _floorDown = data.floowDown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(children: [
            Text("steps=$_steps"),
            Text("floorUp=$_floorUp"),
            Text("floorDown=$_floorDown"),
          ]),
        ),
      ),
    );
  }
}
