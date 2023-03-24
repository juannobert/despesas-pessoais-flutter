import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransaction,{super.key});
  final List<Transaction> recentTransaction;

  List<Map<String,Object>> get groupedTransactions{
    return List.generate(7, (index) { 
      final weekDay = DateTime.now().subtract(
        Duration(days: index) //Dimuidando um dia de acordo com o index
        /*
        Exemplo:
        Se hoje é quinta feira e o indice é 1
        O dia da semana armazenado na variável vai ser quarta feira(dia anterior)
        */
      );

      double totalSum = 0;
      for(var i = 0;i < recentTransaction.length;i++){
        //Verificando se a transação foi feita em um dia da semana atual
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;
        if(sameDay & sameMonth && sameYear){
          totalSum += recentTransaction[i].value;
        }

      }

      return {
        'day' : DateFormat.E().format(weekDay)[0], // Peganda apenas primeira letra do dia
        'value' : totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}