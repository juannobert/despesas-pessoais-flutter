import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactionList, this.onRemove, {super.key});
  final List<Transaction> transactionList;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: transactionList.isEmpty
          ? Column(
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
                    fit: BoxFit
                        .cover, //Vai se ajustar de acordo com o tamanho do container
                  ),
                )
              ],
            )
          : ListView.builder(
              // Tornando compoenete rolavel (precisa ter uma altura) (Podr ser usado o SingleChildScrollView tb)
              itemCount: transactionList
                  .length, //O list view faz o melhor gerênciamento dos dados
              itemBuilder: (ctx, index) {
                //Renderiza apenas os dados que serão exibidos na tela
                final tr = transactionList[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: FittedBox(child: Text('R\$${tr.value}')),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                      trailing: IconButton(
                          onPressed: () => onRemove(tr.id),
                          icon: const Icon(Icons.delete)),
                      iconColor: const ColorScheme.dark().error),
                );
              },
              // Retorna uma lista de cards que são widgets
            ),
    );
  }
}
