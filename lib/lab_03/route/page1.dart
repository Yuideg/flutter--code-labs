import 'package:flutter/material.dart';
import 'package:flutter_code_lab/lab_03/route/data.dart';


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Next'),
              onPressed: (){
                //TODO :01 routing using Navigator.pushNamed() function
                _ToSecondScreen(context);
                // TODO :02 routing using Navigator.push() function
               // Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()),);
              },
            ),
          ],
        ),

      ),
    );
  }
  _ToSecondScreen(BuildContext context) async {
    final  result= await Navigator.pushNamed(context, '/second',
        arguments: ArgValue(" Welcome To Home Page  Lab_03 Navigation and Routing", "Second Screen"));
    ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("$result")));
  }

}