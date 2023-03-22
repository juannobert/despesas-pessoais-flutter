import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transactions_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

  

class _TransactionUserState extends State<TransactionUser> {
  _addTransaction(String title,double value){
    final newTransaction = Transaction(
      id: '', 
      title: title, 
      value: value,
      date: DateTime.now(), 
    );

   setState(() {
     _transactions.add(newTransaction);
   }); 
  }

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
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions)
      ],
    );
  }
}