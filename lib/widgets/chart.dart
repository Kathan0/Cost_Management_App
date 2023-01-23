// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  Chart(this.recentTransactions);

  final List<Transactions> recentTransactions;
  var totalWeekSum = 0;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: 6 - index));
      var totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year)
          totalSum += recentTransactions[i].amount;
      }
      totalWeekSum += totalSum;
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [
                Text('Total Spending for this week',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: groupedTransactions.map((e) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          label: e['day'].toString(),
                          spendingAmount: int.tryParse(e['amount'].toString())!,
                          spendingPct: totalWeekSum == 0 ? 0 : int.tryParse(e['amount'].toString())! /
                              totalWeekSum),
                    );
                  }).toList(),
                ),
              ],
            )));
  }
}
