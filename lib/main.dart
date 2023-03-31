import 'package:expenses/components/chart.dart';
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
                  fontWeight: FontWeight.bold)),
        ));
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

  final List<Transaction> _transactions = [];

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _addTransaction(String title, double value, DateTime time) {
    final newTransaction = Transaction(
      id: '',
      title: title,
      value: value,
      date: time,
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

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
          const Duration(days: 7) //Pegndo as transações apenas da semana atual
          //Se a data for 7 dias passada não será contabilizada
      ));
    }).toList();
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
            SizedBox(width: double.infinity, child: Chart(_recentTransactions)),
            TransactionList(_transactions, _removeTransaction)
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
