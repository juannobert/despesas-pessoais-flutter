import 'package:flutter/material.dart';


class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.label,
    required this.value,
    required this.percentage
    });

  final String label;
  final double value;
  final double percentage;


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(//Faz o coteúdo se ajustar com o tamanho
            child: Text('${value.toStringAsFixed(2)}')),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack( //permite um elemento dentro do outro
            alignment: AlignmentDirectional.bottomCenter, //Alinha de baixo para cima
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox( //Recebe um valor fracionado de altura
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}