import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget{
  const TransactionForm(this.onSubmit,{super.key});

  final Function(String,double) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  void _submitForm(){
     String title = titleController.text;
    //Tenta converter para double, se der erro retorna 0.0
    double value = double.tryParse(valueController.text) ?? 0.0;
    if(title.isEmpty || value <= 0){
      return;
    }
    widget.onSubmit(title,value);
}

  @override
  Widget build(BuildContext context) {
    return  Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children:  [
                TextField(
                controller: titleController,
                onSubmitted: (_) => _submitForm(),
                style: const TextStyle(
                    fontSize: 13
                  ),
                  decoration: const InputDecoration(
                    labelText:"Título"
                  ),
                ),
                TextField(
                  controller: valueController,
                  //Exibe o teclado numerico
                  //numberWithOptions(decimal: true) Exibe ponto decima para IOS
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
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
                     _submitForm();
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