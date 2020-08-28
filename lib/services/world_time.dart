import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String flag;
  String time;
  String url;
  bool isDay;
  WorldTime({this.location,this.flag,this.url});

    Future<void> getTime() async{
      try{
        Response response = await get('http://worldtimeapi.org/api/timezone/$url');
        Map data = jsonDecode(response.body);
        //print(data);
        String datetime = data['datetime'];
        String sign = data['utc_offset'].substring(0,1);
        String offsetHours = data['utc_offset'].substring(1,3);
        String offsetMinutes = data['utc_offset'].substring(4,6);
        //print(datetime);
        //print(offsetHours);
        //print(offsetMinutes);
        DateTime now = DateTime.parse(datetime);
        //print(now);
        if(sign == '+'){
          now = now.add(Duration(hours: int.parse(offsetHours),minutes: int.parse(offsetMinutes)));
        }else{
          now = now.subtract(Duration(hours: int.parse(offsetHours),minutes: int.parse(offsetMinutes)));
        }

        //print(now);
        isDay = now.hour>= 6 && now.hour <=19 ? true : false ;

        time = DateFormat.jm().format(now);
      }
      catch(e){
        time = 'could not load';
      }
    }

}