import 'package:flutter/material.dart';
import 'package:flutter_code_lab/lab_03/route/data.dart';

class SecondScreen extends StatelessWidget {
final ArgValue argval;
  SecondScreen({this.argval});
  @override
  Widget build(BuildContext context) {
   // final ArgValue argval=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(argval.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(argval.message),
            ElevatedButton(
              onPressed: () {
                //TODO:1 using Navigator.Namedpush
                Navigator.pop(context,"messages from second screen");
                //TODO:2 using Navigator.push
                //Navigator.pop(context);
              },
              child: Text('back!'),
            ),
          ],
        ),
      ),

    );
  }

}