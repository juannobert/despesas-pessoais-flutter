import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home:  MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Despesas Pessoais"
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch, //Estica os elemento ao máximo sem precisar definir a largura
        children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            child:  Text("Gráfico"),
            color: Colors.blue,
            elevation: 5,
          ),
        ),
        const Card(
          child: Text("Lista de transações"),
        )
      ],)
    );
  }
    
}