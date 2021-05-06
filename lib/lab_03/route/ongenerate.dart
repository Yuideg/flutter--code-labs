import 'package:flutter/material.dart';
import 'package:flutter_code_lab/lab_03/route/data.dart';
import 'package:flutter_code_lab/lab_03/route/page1.dart';
import 'package:flutter_code_lab/lab_03/route/page2.dart';

class OnGenerate{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final ArgValue arg=settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstScreen());
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondScreen(
          argval:arg ,
        ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}