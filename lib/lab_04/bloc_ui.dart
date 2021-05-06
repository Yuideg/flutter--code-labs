import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_lab/lab_04/prov.dart';
import 'counter_block.dart';
import 'block_fav.dart';
import 'bloc_ui.dart';
//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider<CounterBloc>(
                create: (BuildContext context) => CounterBloc(),
              ),
              
              BlocProvider<FavaBloc>(
                create: (BuildContext context) => FavaBloc(),
              ),
            ],
            child: CounterScreen(),
          ),
        )
    );
  }
}
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    final _fav = BlocProvider.of<FavaBloc>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


          BlocBuilder<CounterBloc, int>(
            builder: (context, state){
              return Text("Counte Value : $state", style: TextStyle(fontSize: 30),);
            },
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("increment"),
                onPressed: (){
                  _counterBloc.add(CounterEvent.increment);
                },
              ),

              RaisedButton(
                child: Text("decrement"),
                onPressed: (){
                  _counterBloc.add(CounterEvent.decrement);
                },
              ),
            ],
          ),
          Container(
            child: BlocBuilder<FavaBloc,bool>(
                builder: (context,state){
                  return IconButton(
                      icon:state? Icon(Icons.favorite,color:Colors.red):
                      Icon(Icons.favorite_border,),
                      onPressed:(){
                        _fav.add(FavEvent.favorite);
                      }
                  );

                }
            ),
          ),
        ],
      ),
    );
  }
}