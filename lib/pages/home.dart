import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data= {};

  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ?data :ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgimg=data['Isday'] ? 'd2.jpeg' :'n2.jpeg';


    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
         body: Container(
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/$bgimg'),
                   fit: BoxFit.cover,
                 ),

               ),
               child:
               Padding(
                 padding:EdgeInsets.fromLTRB(0.0,50.0,0.0,0.0),
                 child: Column(

                   children: [
                     TextButton.icon(
                         onPressed: () async {
                           dynamic result = await Navigator.pushNamed(context, '/location');
                           setState(() {
                             data={
                               'time':result['time'],
                               'location':result['location'],
                               'Isday':result['Isday'],
                               'flag':result['flag'],


                             };
                           });
                         },
                         icon: Icon(Icons.edit_location,
                         color: Colors.black,),
                         label: Text("Edit the location",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 25.0

                           ),
                         )),
                     SizedBox(
                       height: 30.0,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         Text(
                           data['location'],
                           style:TextStyle(
                             fontSize: 40.0,
                             color: Colors.red,

                           ),

                         )
                         ,

                         SizedBox(
                           height: 50.0,
                         ), ],
                     ),
                     Text(
                       data['time'],
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 60.0,
                       ),

                     )

                   ],
                 ),
               ),
             ),
        )
    );

  }
}
