import 'package:expenses/components/chart_bar.dart';
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
    }).reversed.toList();
  }

  double get _weekTotalValue{
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactions.map((tr) {
          return Flexible(
            fit: FlexFit.tight, //Faz com que o elemento oculpe todo o espaço em branco disponivel
            //fit: FlexFit.loose /Faz com que o elemento oculpe apenas o espaço do seu conteúdo
            child: ChartBar(
              label: tr['day'] as String,
              value: tr['value'] as double,
              percentage: _weekTotalValue == 0 ? 0 : (tr['value'] as double) / _weekTotalValue
            ),
          );
        }).toList(),
      )
    );
  }
}