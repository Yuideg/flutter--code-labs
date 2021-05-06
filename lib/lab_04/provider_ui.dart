import 'package:flutter/material.dart ';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'prov.dart';
import 'package:flutter_code_lab/lab_04/favorite.dart';
// void main(){
//   runApp(
//     ChangeNotifierProvider(
//         create: (context)=>CounterModel(),
//         child:CounterWidget(),
//     )
//   );
// }
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _provider=Provider.read<ConterModel>(context,l);
     final _favorite=Provider.of<FavoriteModel>(context,listen: false);
    return MaterialApp(

      home: Scaffold(
   appBar: AppBar(
     title: Text("State management"),
   ),
        body: Center(
          child: new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Consumer<CounterModel>(
                    builder: (context,CounterModel,_)=>Text("Counter Value :${CounterModel.count}",style: TextStyle(fontSize: 23),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    FlatButton(
                        onPressed: (){
                          Provider.of<CounterModel>(context,listen: false).increment();
                        },
                        child: Text("Increment")
                    ),
                    FlatButton(
                        onPressed: (){
                          Provider.of<CounterModel>(context,listen: false).decrement();
                        },
                        child: Text("Decrement")
                    ),


                  ],
                ),
                Container(
                  child: Consumer<FavoriteModel>(
                    builder: (context,fm,_){
                      return IconButton(
                          icon:fm.favorite? Icon(Icons.favorite,color:Colors.red):
                          Icon(Icons.favorite_border,),
                          onPressed:(){
                            _favorite.ChangeFavorite();
                          }
                      );

                    }
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
