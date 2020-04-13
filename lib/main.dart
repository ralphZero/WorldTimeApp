import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_current_time/views/choose_location.dart';
import 'package:world_current_time/views/home.dart';
import 'package:world_current_time/views/loading.dart';

void main(List<String> args) {
  return runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}