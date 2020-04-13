import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_current_time/models/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    var worldTime = WorldTime(location: 'Port-au-Prince',flag: 'https://www.countryflags.io/ht/flat/32.png',url: 'America/Port-au-Prince');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':worldTime.location,
      'time':worldTime.time,
      'flag':worldTime.flag,
      'isDayTime':worldTime.isDayTime
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'WorldTime',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white,
                letterSpacing: 5.0
              ),
            ),
            SizedBox(height: 20.0,),
            SpinKitFadingCircle(
              color: Colors.white,
              size: 60.0,
            ),
          ],
        ),
      ),
    );
  }
}