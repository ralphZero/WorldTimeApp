import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.url,this.flag,this.location});

  Future<void> getTime() async{
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map jsontime = jsonDecode(response.body);
      //print(jsontime);
      String datetime = jsontime['datetime'];
      String offset = jsontime['utc_offset'].substring(1,3);
      String sign = jsontime['utc_offset'].substring(0,1);
      var now = DateTime.parse(datetime);
      if(sign.contains('-')){
        now = now.subtract(Duration(hours: int.parse(offset)));
      }else{
        now = now.add(Duration(hours: int.parse(offset)));
      }
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }catch (e){
      print('Error caught $e');
      time = 'Error encountered, please try again.';
    }
    
  }
}