import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactionList,{super.key});
  final List<Transaction> transactionList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: transactionList.isEmpty ? 
      Column(
        children: [
          Text(
            "Nenhuma transação cadastrada",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Image.asset(
              "assets/images/waiting.png",
              fit: BoxFit.cover, //Vai se ajustar de acordo com o tamanho do container

            ),
          )
        ],
      )
      :
      ListView.builder( // Tornando compoenete rolavel (precisa ter uma altura) (Podr ser usado o SingleChildScrollView tb)
        itemCount: transactionList.length, //O list view faz o melhor gerênciamento dos dados
        itemBuilder: (ctx,index){//Renderiza apenas os dados que serão exibidos na tela 
          final tr = transactionList[index];
          return Card(
                  child : Row(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).primaryColor
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple
                        ),
                        ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.title,
                          style:  Theme.of(context).textTheme.titleMedium // Chamando tema de texto personalizado 
                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: const TextStyle(
                            color: Colors.grey
                          )
                        )
                      ],
                    )
                  ],
                  )
                );
        },
           // Retorna uma lista de cards que são widgets
    ),
  );
  }
}