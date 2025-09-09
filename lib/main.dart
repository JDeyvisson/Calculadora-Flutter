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

  final ButtonStyle estilobtn = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
  );

  final TextStyle estiloTextobtn = const TextStyle(
    color: Color.fromARGB(255, 14, 13, 13),
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  final ButtonStyle estiloBtnAcao = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll<Color>(const Color.fromARGB(255, 200, 236, 190)),
  );
  

  Widget btn(String texto, String valor, ButtonStyle estilobtn) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            
            if (expressao == "0") {
              expressao = valor;
            } else if (valor == "⌫") {
              if (expressao.length > 1) {
                expressao = expressao.substring(0, expressao.length - 1);
              } else {
                expressao = "0";
              }
            } else if (valor == "=") {
              Expression exp = Parser().parse(expressao);
              double resultado = exp.evaluate(
                EvaluationType.REAL,
                ContextModel(),
              );
              setState(() {
                expressao = resultado.toStringAsFixed(1);
              });
            } else {
              expressao += valor;
            }
            
          });
        },
        style: estilobtn,
        child: Text(texto, style: estiloTextobtn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora simples", style: estiloTextobtn,),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.only(bottom: 50, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.fromLTRB(0, 0, 10, 25),
                child: Row(
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
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn("0", "0",estilobtn),
                  btn("⌫", "⌫",estiloBtnAcao),
                  btn("=", "=",estiloBtnAcao),
                  btn("×", "*",estiloBtnAcao),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn("7", "7",estilobtn),
                  btn("8", "8",estilobtn),
                  btn("9", "9",estilobtn),
                  btn("+", "+",estiloBtnAcao),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn("4", "4",estilobtn),
                  btn("5", "5",estilobtn),
                  btn("6", "6",estilobtn),
                  btn("-", "-",estiloBtnAcao),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn("1", "1",estilobtn),
                  btn("2", "2",estilobtn),
                  btn("3", "3",estilobtn),
                  btn("÷", "/",estiloBtnAcao),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn(",", ".", estiloBtnAcao)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
