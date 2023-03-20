import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatelessWidget{
  MyHomePage({super.key});

  final  _transactions = [
    Transaction(
      id : 't1',
      title : 'Tênis da nike',
      date: DateTime.now(),
      value: 300.50
    ),
     Transaction(
      id : 't2',
      title : 'Conta de luz',
      date: DateTime.now(),
      value: 250
    ),

  ];
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
       Column(
        children: 
          _transactions.map((tr) {
            return Card(
              child : Text(tr.title)
            );
          }).toList() // Retorna uma lista de cards que são widgets
       )
      ],)
    );
  }
    
}