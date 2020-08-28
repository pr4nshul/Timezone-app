import 'package:flutter/material.dart';
import 'package:world2/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Kolkata',flag: 'India.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Bangkok',flag: 'Thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'London',flag: 'England.png', url: 'Europe/London'),
    WorldTime(location: 'Paris',flag: 'France.png', url: 'Europe/Paris'),
    WorldTime(location: 'Singapore',flag: 'Singapore.png', url: 'Asia/Singapore'),
    WorldTime(location: 'New York',flag: 'USA.png', url: 'America/New_York'),
    WorldTime(location: 'Tokyo',flag: 'Japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Istanbul',flag: 'Turkey.png', url: 'Europe/Istanbul'),
    WorldTime(location: 'Hong Kong',flag: 'China.png', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Rome',flag: 'Italy.png', url: 'Europe/Rome'),
    WorldTime(location: 'Madrid',flag: 'Spain.png', url: 'Europe/Madrid'),
    WorldTime(location: 'Jakarta',flag: 'Indonesia.png', url: 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'time' : instance.time,
      'location' : instance.location,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[750],
        appBar: AppBar(
          backgroundColor: Colors.amber[600],
          title: Text('Choose a location'),
        ),
        body:ListView.builder(
          itemCount: locations.length,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal : 4.0,vertical: 3.0),
              child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                )
              ),
              ),
            );
          }
        )
    );
  }
}