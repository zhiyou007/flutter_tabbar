import 'package:flutter/material.dart';
import 'package:flutter_app/MainPage.dart';
import 'dart:io';
import 'package:flutter/services.dart';
void main(){
  runApp(new MyApp());
  if(Platform.isAndroid){
    SystemUiOverlayStyle systemUiOverlayStyle  = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}