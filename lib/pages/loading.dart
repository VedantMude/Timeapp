import 'package:flutter/material.dart';
import 'package:timeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{

  void setupWorldTIme() async {
    WorldTime instance=WorldTime('Berlin','germany','Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments:{
      'time':instance.time,
      'location':instance.location,
      'flag':instance.flag,
      'Isday':instance.Isday,
    });
 }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTIme();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child: SpinKitCubeGrid(
        color: Colors.white,
        size: 100.0,

      ),),




    );
  }
}
