import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transactions_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MyHomePage(),
        theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme: ColorScheme.fromSwatch(accentColor: Colors.amber),
            fontFamily: 'Quicksand', //Adicionando fonte
            textTheme: const TextTheme(
                titleMedium: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    //Mudando tema do título do appBar
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold))));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  final List<Transaction> _transactions = [
    /*
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
    */
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: '',
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });

    //Retira primeira tela da arvores dos componentes(no caso o modal)
    Navigator.of(context).pop();
  }

  _openFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Despesas Pessoais"),
        actions: [
          IconButton(
              //Criando botão de icone
              onPressed: () => _openFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),

      body: SingleChildScrollView(
        // Tornando tela inteira rolavel
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //Estica os elemento ao máximo sem precisar definir a largura
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text("Gráfico"),
              ),
            ),
            TransactionList(_transactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Adiciona botão no rodapé
        onPressed: () => _openFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, //Centraliza o botão no rodapé
    );
  }
}
