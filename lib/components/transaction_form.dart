import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget{
  TransactionForm(this.onSubmit,{super.key});

  final Function(String,double) onSubmit;
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return  Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children:  [
                TextField(
                controller: titleController,
                style: const TextStyle(
                    fontSize: 13
                  ),
                  decoration: const InputDecoration(
                    labelText:"Título"
                  ),
                ),
                TextField(
                  controller: valueController,
                  style: const TextStyle(
                    fontSize: 13
                  ),
                  decoration: const InputDecoration(
                    labelText:"Valor(R\$)",
                    
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    TextButton(
                    onPressed: () {
                      String title = titleController.text;
                      //Tenta converter para double, se der erro retorna 0.0
                      double value = double.tryParse(valueController.text) ?? 0.0;
                      onSubmit(title,value);
                     }, 
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.purple,
                    ),
                    child:  const Text("Salvar transação"),
                    
                    ),
                  ],
                )
              ]),
            )
    );
  }
}