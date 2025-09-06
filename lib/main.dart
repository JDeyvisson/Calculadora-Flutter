import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(title: "Calculadora", home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String expressao = "0";

  final ButtonStyle estiloBotao = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
    
  );

  final TextStyle estiloTextoBotao = const TextStyle(
    color: Color.fromARGB(255, 14, 13, 13),
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  expressao,
                  style: TextStyle(
                    color: Color.fromARGB(255, 14, 13, 13),
                    fontSize: 70,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "0";
                    });
                  },
                  style: estiloBotao,
                  child: Text("0", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao = expressao.substring(0, expressao.length - 1);
                      if (expressao.isEmpty) {
                        expressao = "0";
                      }
                    });
                  },
                  style: estiloBotao,
                  child: Text("X", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    Expression expressaoFinal = Parser().parse(expressao);
                    double resultado = expressaoFinal.evaluate(
                      EvaluationType.REAL,
                      ContextModel(),
                    );
                    setState(() {
                      expressao = resultado.toString();
                    });
                  },
                  style: estiloBotao,
                  child: Text("=", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "×";
                    });
                  },
                  style: estiloBotao,
                  child: Text("×", style: estiloTextoBotao),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "7";
                    });
                  },
                  style: estiloBotao,
                  child: Text("7", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "8";
                    });
                  },
                  style: estiloBotao,
                  child: Text("8", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "9";
                    });
                  },
                  style: estiloBotao,
                  child: Text("9", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "+";
                    });
                  },
                  style: estiloBotao,
                  child: Text("+", style: estiloTextoBotao),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "4";
                    });
                  },
                  style: estiloBotao,
                  child: Text("4", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "5";
                    });
                  },
                  style: estiloBotao,
                  child: Text("5", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "6";
                    });
                  },
                  style: estiloBotao,
                  child: Text("6", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "-";
                    });
                  },
                  style: estiloBotao,
                  child: Text("-", style: estiloTextoBotao),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "1";
                    });
                  },
                  style: estiloBotao,
                  child: Text("1", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "2";
                    });
                  },
                  style: estiloBotao,
                  child: Text("2", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "3";
                    });
                  },
                  style: estiloBotao,
                  child: Text("3", style: estiloTextoBotao),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expressao += "÷";
                    });
                  },
                  style: estiloBotao,
                  child: Text("÷", style: estiloTextoBotao),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
