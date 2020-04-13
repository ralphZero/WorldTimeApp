import 'package:flutter/material.dart';
import 'package:world_current_time/models/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'https://www.countryflags.io/gb/flat/32.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'https://www.countryflags.io/gr/flat/32.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'https://www.countryflags.io/eg/flat/32.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'https://www.countryflags.io/ke/flat/32.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'https://www.countryflags.io/us/flat/32.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'https://www.countryflags.io/us/flat/32.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'https://www.countryflags.io/kr/flat/32.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'https://www.countryflags.io/id/flat/32.png'),
  ];

  void updateTime(int index) async{
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      'location':worldTime.location,
      'time':worldTime.time,
      'flag':worldTime.flag,
      'isDayTime':worldTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Choose location'),
       centerTitle: true,
       elevation: 0.0,
       backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){
                  //we update time
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  child: Image.network(locations[index].flag),
                  backgroundColor: Colors.transparent,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}