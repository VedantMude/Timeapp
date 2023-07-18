import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location="Mumbai";
  String time="1";
  String flag='germany.png';
  String url='kolkata';
  bool Isday=true;
  WorldTime(String location,String flag,String url)
  {
    this.location= location;
    this.flag= flag;
    this.url= url;
  }
   Future <void>  getTime() async{
    try{
      Response response= await get(Uri.parse('https://www.worldtimeapi.org/api/timezone/$url'));
      Map data=jsonDecode(response.body);
      String daytime=data['datetime'];
      String offset=data['utc_offset'];
      String hello=offset.substring(1,3);
      //print(daytime);
      DateTime now=DateTime.parse(daytime);
      now=now.add(Duration(hours: int.parse(hello)));
      if(now.hour>6 && now.hour<20){
        Isday=true;
      }
      else{
        Isday=false;
      }
      time=DateFormat.jm().format(now);
      print(time);
    }
    catch(e){
      print("catch error:$e");
      time="Could Not Able to fetched the time";

    }









  }

}