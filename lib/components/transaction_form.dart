import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget{
  const TransactionForm(this.onSubmit,{super.key});

  final Function(String,double,DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  void _submitForm(){
     String title = titleController.text;
    //Tenta converter para double, se der erro retorna 0.0
    double value = double.tryParse(valueController.text) ?? 0.0;
    if(title.isEmpty || value <= 0){
      return;
    }
    widget.onSubmit(title,value,selectedDate);
  }
   _showDatePicker(){ // é uma função assincrona
    showDatePicker(
      context: super.context, //o context é recebido por herança
      initialDate: DateTime.now(), //Data inicial que o componente irá mostrar 
      firstDate: DateTime(2019), //Data mais antiga que poderá ser selecionada 
      lastDate: DateTime.now() // Data mais recente que poderá ser selecionada
    ).then((pickedDate) {//Será executado assim que o usuário selecionar a data
      if(pickedDate == null) {return;}
      setState(() {
        selectedDate = pickedDate;
      });
    });
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

                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          'Data selecionada ${DateFormat("dd/MM/y").format(selectedDate)}'
                        ),
                      ),
                      TextButton(
                        onPressed: _showDatePicker, 
                        child: Text(
                          "Selecionar data",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor
                          ),
                        ))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    ElevatedButton(
                    onPressed: () {
                     _submitForm();
                     }, 
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      )
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