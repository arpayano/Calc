import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Isabella Calculator",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstvalue;
  int secondvalue;
  String textondisplay = "";
  String result;
  String operationtoperform;

  void btnclicked(String btntext) {
    if (btntext == "C") {
      firstvalue = 0;
      secondvalue = 0;
      result = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "x" ||
        btntext == "/") {
      firstvalue = int.parse(textondisplay);
      result = "";
      operationtoperform = btntext;
    }
    //adition operation. Ap
    else if (btntext == "=") {
      secondvalue = int.parse(textondisplay);
      if (operationtoperform == "+") {
        result = (firstvalue + secondvalue).toString();
      }
// second operation. Ap
      if (operationtoperform == "-") {
        result = (firstvalue - secondvalue).toString();
      }
//third operation. Ap

      if (operationtoperform == "x") {
        result = (firstvalue * secondvalue).toString();
      }

      //Fourth operation. Ap

      if (operationtoperform == "/") {
        result = (firstvalue + secondvalue).toString();
      }
    } else {
      result = int.parse(textondisplay + btntext).toString();
    }
    setState(() {
      textondisplay = result;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //container for the screen(Output). AP
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$textondisplay",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            //Firt Row and there is in the botton. AP
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            //Seccond Row. AP
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),

            //Third Row. AP
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("2"),
                custombutton("x"),
              ],
            ),
// 4th Row. AP
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
