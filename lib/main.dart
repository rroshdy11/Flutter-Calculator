import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Calculator()
    );
  }
}
class Calculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculator();
  }

}
class _Calculator extends State<Calculator>{
  //Needed Variables
  String text='0';
  double num1=0;
  double num2=0;
  String result='0';
  String finalResult='0';

  //For Operators
  String opr='';
  String prevOpr='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body:Container(

      child: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(child: Text(
                  '$text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons('C', Colors.grey),
                Buttons('+/-', Colors.grey),
                Buttons('%', Colors.grey),
                Buttons('/', Colors.amber.shade800),
              ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons('7', Colors.grey.shade800),
                  Buttons('8', Colors.grey.shade800),
                  Buttons('9', Colors.grey.shade800),
                  Buttons('x', Colors.amber.shade800),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons('4', Colors.grey.shade800),
                  Buttons('5', Colors.grey.shade800),
                  Buttons('6', Colors.grey.shade800),
                  Buttons('-', Colors.amber.shade800),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons('1', Colors.grey.shade800),
                  Buttons('2', Colors.grey.shade800),
                  Buttons('3', Colors.grey.shade800),
                  Buttons('+', Colors.amber.shade800),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons('0', Colors.grey.shade800),
                  Buttons('.', Colors.grey.shade800),
                  Buttons('=', Colors.amber.shade800),
                ]
            ),

          ],
        )
      ),
    )
    );
  }

  Widget Buttons(String Btntxt, Color color) {
    if (Btntxt == '0') { // to give an oval shape to the 0
      return
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(onPressed: () {
            calculate(Btntxt);
          },
            child: Text('$Btntxt',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black
              ),
            ),
            color: color,
            padding: EdgeInsets.only(left:80,top:20,right: 80,bottom: 20 ),
            shape: StadiumBorder(),
          ),
        );
    }
    else
      {
        return
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: RaisedButton(onPressed: () {
              calculate(Btntxt);
            },
              child: Text('$Btntxt',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black
                ),
              ),
              color: color,
              padding: EdgeInsets.all(20),
              shape: CircleBorder(),
            ),
          );
      }
  }

  void calculate( String btntxt){
    if(btntxt=='C')
      {
        text='0';
         num1=0;
         num2=0;
        result='0';
        finalResult='0';

        //For Operators
        opr='';
        prevOpr='';
      }
    else if(btntxt=='+/-')
      {
        if(result.startsWith('-'))
          {
            result=result.substring(1);
          }
        else{
          result='-'+result;
        }
        finalResult=result;
      }
    else if(btntxt=='='&&opr=='=')
      {
        switch (prevOpr)
        {
          case '+':
            finalResult=add();
            break;
          case '-':
            finalResult=sub();
            break;
          case 'x':
            finalResult=mult();
            break;
          case '/':
            finalResult=div();
            break;
          case '%':
            finalResult=percent();
            break;
        }
        result=finalResult;
        num1=double.parse(finalResult);
        opr=btntxt;
        num2=0;

      }
    else if(btntxt=='+'||btntxt=='/'||btntxt=='x'||btntxt=='-'||btntxt=='='||btntxt=='%')
      {
        //to store the number in the num1
        if(num1==0){
          num1=double.parse(finalResult);
        }
        else
        {
          num2=double.parse(finalResult);
        }
        switch (opr)
        {
          case '+':
            finalResult=add();
            break;
          case '-':
            finalResult=sub();
            break;
          case 'x':
            finalResult=mult();
            break;
          case '/':
            finalResult=div();
            break;
          case '%':
            finalResult=percent();
            break;
        }
        prevOpr=opr;
        opr=btntxt;
        result='';
      }
    else
      {
        //to avoid adding 0 in left of the number
        if(finalResult=='0'){
          result='';
          result=result+btntxt;
        }
        else {
          result = result + btntxt;
        }
        finalResult=result;
      }

    setState(() {
      text=finalResult;
    });


  }
  String percent()
  {
    result=(num1/100).toString();
    num1=double.parse(result);
    return result;
  }
  String add()
  {
    result=(num1+num2).toString();
    num1=double.parse(result);
    return result;
  }
  String sub()
  {
    result=(num1-num2).toString();
    num1=double.parse(result);
    return result;
  }
  String div()
  {
    
    result=(num1/num2).toString();
    num1=double.parse(result);
    return result;
  }
  String mult()
  {
    result=(num1*num2).toString();
    num1=double.parse(result);
    return result;
  }

  
}

