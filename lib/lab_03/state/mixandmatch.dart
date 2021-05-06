import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class MixAndMatchParentWidegt extends StatefulWidget {
  @override
  _MixAndMatchParentWidegtStateParent createState() => _MixAndMatchParentWidegtStateParent();
}
class _MixAndMatchParentWidegtStateParent extends State<MixAndMatchParentWidegt> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 28.0;
  double resultFontSize = 30.0;

  _handleButton(String operator){
    setState(() {
      if(operator == "CE"){
        equation = "0";
        result = "0";
        equationFontSize = 30.0;
        resultFontSize = 40.0;
      }

      else if(operator == "="){
        equationFontSize = 30.0;
        resultFontSize = 40.0;
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "NAN";
        }

      }

      else{
        equationFontSize = 30.0;
        resultFontSize = 40.0;
        resultFontSize = 20.0;
        if(equation == "0"){
          equation = operator;
        }else {
          equation = equation + operator;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MixAndMatch(
      equation: equation,
      equationFontSize: equationFontSize,
      expression: expression,
      OnChanged: buildButton,
      result: result,
      resultFontSize: resultFontSize,);
  }

  Widget buildButton(String buttonText, int buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid
              )
          ),
          padding: EdgeInsets.all(16.0),
          onPressed: ()=>_handleButton(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: Colors.white
            ),
          )
      ),
    );
  }

}


class MixAndMatch extends StatefulWidget {
  String equation;
  String result;
  String expression;
  double equationFontSize;
  double resultFontSize;
  String btext;
  final Function OnChanged;
  MixAndMatch({
    Key key,
    this.result,
    this.equation,
    this.equationFontSize,
    this.expression,
    this.resultFontSize,
    this.OnChanged
  });

  @override
  _MixAndMatchState createState() => _MixAndMatchState();
}

class _MixAndMatchState extends State<MixAndMatch> {
bool _isLarge=false;
   void _LongEquationExists() {
    setState(() {
      if(widget.equation.length>20){
        _isLarge=true;
      }else{
        _isLarge=false;
      }


    });
  }
  @override
  Widget build(BuildContext context) {
     _LongEquationExists();
      return Scaffold(
        appBar: AppBar(title: Text('Simple Calculator')),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child:
              Text( !_isLarge ? widget.equation:"Insufficient Space", style: TextStyle(fontSize: widget.equationFontSize),)
              ,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(widget.result, style: TextStyle(fontSize: widget.resultFontSize),),
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(

                  width: MediaQuery.of(context).size.width ,
                  height: MediaQuery.of(context).size.height *0.4,
                  child: Table(
                    children: [
                      TableRow(
                          children: [
                            widget.OnChanged("1", 1, Colors.black54),
                            widget.OnChanged("2", 1, Colors.black54),
                            widget.OnChanged("3", 1, Colors.black54),
                            widget.OnChanged("+", 1, Colors.amber[300]),
                          ]
                      ),
                      TableRow(
                          children: [
                            widget.OnChanged("4", 1, Colors.black54),
                            widget.OnChanged("5", 1, Colors.black54),
                            widget.OnChanged("6", 1, Colors.black54),
                            widget.OnChanged("-", 1, Colors.amber[300]),
                          ]
                      ),
                      TableRow(
                          children: [
                            widget.OnChanged("7", 1, Colors.black54),
                            widget.OnChanged("8", 1, Colors.black54),
                            widget.OnChanged("9", 1, Colors.black54),
                            widget.OnChanged("×", 1,Colors.amber[300]),
                          ]
                      ),
                      TableRow(
                          children: [
                            widget.OnChanged("0", 1, Colors.black54),
                            widget.OnChanged("CE", 1, Colors.amber[300]),
                            widget.OnChanged("=", 1, Colors.amber[300]),
                            widget.OnChanged("÷", 1,Colors.amber[300]),
                          ]
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      );
    }
  }



