// import 'package:flutter/material.dart';
// import 'lab_03/state/mixandmatch.dart';
// void main() {
//   runApp(App());
// }
//
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       //TODO 01 use onGenerateRoute to navigate
//      // initialRoute: "/",
//       // routes: {
//       //   "/second":(context)=>SecondScreen(),
//       // },
//      // onGenerateRoute: OnGenerate.generateRoute,
//       home: MixAndMatchParentWidegt(),
//     );
//
//
//   }
// }
import 'package:flutter/material.dart ';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_lab/final.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_lab/lab_04/provider_ui.dart';
import 'package:flutter_code_lab/lab_04/bloc_ui.dart';
import 'package:flutter_code_lab/lab_04/favorite.dart';
import 'lab_04/prov.dart';
void main(){
  runApp(
    //TODO 01 Provider
      //MyApp()
   // FinalExam()
    //TODO 02 Provider
    //   ChangeNotifierProvider(
    //     create: (BuildContext context)=>ProviderModel(),
    //     child:FinalExam(),
    //   )
      Add()
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //         create: (context) => CounterModel()
    //     ),
    //     Provider(create: (context) => FavoriteModel()),
    //   ],
    //   child: CounterWidget(),
    // ),
  );


}