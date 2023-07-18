import 'package:flutter/material.dart';
import 'package:timeapp/pages/choose_location.dart';
import 'package:timeapp/pages/home.dart';
import 'package:timeapp/pages/loading.dart';

void main()=>runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),
    },
  )
);

