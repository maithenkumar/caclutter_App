import "package:flutter/material.dart";

import "buttonWidget.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';
  String _output = "0";
  String opreand = "";
  double num1 = 0.0;
  double num2 = 0.0;

  // elivettedButtonWidget tesxtx = elivettedButtonWidget(text);

  @override
  Widget build(BuildContext context) {
    buttonTouch(String value) {
      if (value == "C") {
        _output = "0";
        opreand = "";
        num1 = 0.0;
        num2 = 0.0;
      } else if (value == "+" ||
          value == "_" ||
          value == "/" ||
          value == "x" ||
          value == "%") {
        num1 = double.parse(output);
        opreand = value;
        _output = "0";
      } else if (value == ".") {
        if (value.contains(".")) {
          print("nothing");
        } else {
          _output = _output + value;
        }
      } else if (value == "=") {
        num2 = double.parse(_output);
        if (opreand == "/") {
          _output = (num1 / num2).toString();
        } else if (opreand == "+") {
          _output = (num1 + num2).toString();
        } else if (opreand == "x") {
          _output = (num1 * num2).toString();
        } else if (opreand == "_") {
          _output = (num1 - num2).toString();
        } else if (opreand == "%") {
          _output = (num1 % num2).toString();
        }
        opreand = "";
        num1 = 0.0;
        num2 = 0.0;
      } else if (value == "00") {
        _output = _output + value;
      } else if (value == "X") {
        List<String> c = _output.split("");
        c.removeLast();
      } else {
        _output = _output + value;
      }
      setState(() {
        output = double.parse(_output).toStringAsFixed(2);
      });
    }

    Widget buttonWidget(String btText) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          onPressed: () => buttonTouch(btText),
          child: Text(
            btText,
            style: TextStyle(fontSize: 30),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Caclutter  Application"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  alignment: Alignment.bottomRight,
                  height: 200,
                  width: double.infinity,
                  child: Text(
                    output,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buttonWidget("C"),
                buttonWidget("%"),
                buttonWidget("X"),
                buttonWidget("/")
              ],
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buttonWidget("7"),
                buttonWidget("8"),
                buttonWidget("9"),
                buttonWidget("x")
              ],
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buttonWidget("4"),
                buttonWidget("5"),
                buttonWidget("6"),
                buttonWidget("_")
              ],
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buttonWidget("1"),
                buttonWidget("2"),
                buttonWidget("3"),
                buttonWidget("+")
              ],
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buttonWidget("00"),
                buttonWidget("2"),
                buttonWidget("."),
                buttonWidget("=")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
