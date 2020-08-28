import 'package:flutter/material.dart';
import 'package:world2/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata',flag: 'India', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'time' : instance.time,
      'location' : instance.location,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: SpinKitRipple(
            color: Colors.black,
            size: 180.0,
          ),
        )
    );
  }
}