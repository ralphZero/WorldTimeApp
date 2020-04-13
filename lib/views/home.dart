import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map args = {};

  @override
  Widget build(BuildContext context) {
    args = args.isNotEmpty ? args : ModalRoute.of(context).settings.arguments;

    // set bg img
    String bgImg = args['isDayTime'] ? 'day.png' : 'night.jpg';
    Color bgColor = args['isDayTime'] ? Colors.blue[100] : Colors.blue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        args = {
                          'location':result['location'],
                          'time':result['time'],
                          'flag':result['flag'],
                          'isDayTime':result['isDayTime']
                        };
                      });
                      
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Change location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(args['flag']),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        args['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    args['time'],
                    style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.grey[300],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
