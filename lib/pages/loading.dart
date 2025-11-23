import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time ='loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'London', flag: 'England.png', url: 'Europe/London');
    await instance.getTime();
    await Future.delayed(Duration(seconds: 1));

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
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
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),

      )
    );
  }
}
