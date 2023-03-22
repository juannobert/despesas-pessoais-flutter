import 'package:expenses/components/transaction_user.dart';
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

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Despesas Pessoais"
        )
      ),
      body:  SingleChildScrollView ( // Tornando tela inteira rolavel
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //Estica os elemento ao máximo sem precisar definir a largura
          children: [
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("Gráfico"),
            ),
          ),
          TransactionUser()
        ],),
      )
    );
  }
    
}