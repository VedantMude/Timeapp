import 'package:flutter/material.dart';
import 'package:timeapp/services/world_time.dart';
import 'package:timeapp/pages/loading.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> location=[
    WorldTime('London','uk.png','Europe/London'),
    WorldTime('Anthens','uk.png','Europe/Berlin'),
    WorldTime('Cairo','egypt.png','Africa/Cairo'),
    WorldTime('Mumbai', 'India.png', 'India/Mumbai')
  ];
  void updateTime (index) async{
    WorldTime instance=location[index];
    await instance.getTime();
    Navigator.pop(context,{
      'time':instance.time,
      'location':instance.location,
      'flag':instance.flag,
      'Isday':instance.Isday,
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[300],
        title: Text("Enter the location"),


      ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 13.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  print(location[index].location);
                  updateTime(index);
                },
                title: Text(location[index].location),
                leading:CircleAvatar(
                  backgroundImage: AssetImage('assets/${location[index].flag}'),
                ),
              ),

            ),
          );
    }


      ),
    );
  }
}
