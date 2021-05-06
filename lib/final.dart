import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
// class FinalExam extends StatefulWidget {
//   @override
//   _FinalExamState createState() => _FinalExamState();
// }

class FinalExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var _prov=Provider.of<ProviderModel>(context,listen: false);
    //printJsonText();
    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          title: Text("final exam"),
          centerTitle: true,
          actions: [
            Icon(Icons.settings),
            Icon(Icons.search)
          ],
        ),
        body: Center(
          child:Center(
            child: Column(
              children: [
               Consumer<ProviderModel>(
                   builder: (context,pm,_){
                     return Text("Counter : ${pm.Count}");
                   }

               ),

             Row(
               children: [
                 RaisedButton(
                   onPressed: (){
                     Provider.of<ProviderModel>(context,listen: false).increment();
                   },
                   color: Colors.lightGreenAccent,
                   child: Text("Increment"),
                 ),
               ],
             ),
              ],
            ),
          ),
        ),
      ),
    );


  }
  Future<String> bundleLoading() async{
    return await rootBundle.loadString("assets/index.json");

  }
  printJsonText(){
    var str=bundleLoading();
    print(str);
  }
}

class ProviderModel extends ChangeNotifier {
 int _count =0;
 get Count=>_count;
  increment(){
    _count++;
    notifyListeners();
  }

}


enum InEvent{increement}
class BlockModel extends Bloc<InEvent,int> {
  int _count =0;

  BlockModel(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(InEvent event) async* {
    // TODO: implement mapEventToState
   switch(event){
     case InEvent.increement:
       yield state+1;
        break;
   }
  }


}
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
    int _count=0;
    _getIncrement(){
    setState(() {
      _count++;
    });
    }
  @override
  Widget build(BuildContext context) {
    return ChildAB(
        onChanged: _getIncrement,
        count: _count
    );
  }
}
class ChildAB extends StatelessWidget {
  final Function onChanged;
  final  int count;
  ChildAB({Key key,@required this.onChanged,@required this.count}){}
  getDecrement(){

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          title: Text("final exam"),
          centerTitle: true,
          actions: [
            Icon(Icons.settings),
            Icon(Icons.search)
          ],
        ),
        body: Center(
          child:Center(
            child: Column(
              children: [
                Text("Count :${count}"),
                Row(
                  children: [

                    RaisedButton(
                      onPressed: (){
                        onChanged();
                      },
                      color: Colors.lightGreenAccent,
                      child: Text("Increment"),
                    ),
                    RaisedButton(
                      onPressed: (){

                      },
                      color: Colors.lightGreenAccent,
                      child: Text("Decrement"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






