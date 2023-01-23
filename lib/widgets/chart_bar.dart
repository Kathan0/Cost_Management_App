import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final int spendingAmount;
  final double spendingPct;

  const ChartBar({super.key, 
  required this.label, 
  required this.spendingAmount, 
  required this.spendingPct});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('₹ ${spendingAmount.toStringAsFixed(0)}'),
        SizedBox(height: 4),
        Container(
          height: 100,
          width: 20,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Color.fromARGB(1, 220, 220, 220),
                  borderRadius: BorderRadius.circular(5)
                  ),
                  width: 15,),
                  
                  FractionallySizedBox(heightFactor: spendingPct,
                  child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    width: 15,
                  ),
                  ),
            ],
          ),
        ),
        SizedBox(height: 4,),
        Text(label)
      ],
    );
  }
}
