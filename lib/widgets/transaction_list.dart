// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  // ignore: prefer_final_fields
  final List<Transactions> userTransactions;

  late String title;
  late String amount;
  late DateTime date;

  TransactionList({super.key, required this.userTransactions});

  String month(int mon) {
    if (mon == 1) return 'January';
    if (mon == 2) return 'February';
    if (mon == 3) return 'March';
    if (mon == 4) return 'April';
    if (mon == 5) return 'May';
    if (mon == 6) return 'June';
    if (mon == 7) return 'July';
    if (mon == 8) return 'August';
    if (mon == 9) return 'September';
    if (mon == 10) return 'October';
    if (mon == 11) {
      return 'November';
    } else {
      return 'December';
    }
  }

  // ignore: non_constant_identifier_names
  Widget card_return(String title, int amount, DateTime date) {
    return Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),

        child: ListTile(
          leading: CircleAvatar(
            radius: 20, 
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text('₹ $amount')
                ),
            ),
            ),
          title: Text(title, 
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),),
          subtitle: Text(DateFormat.yMMMd().format(date)),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 294.429,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return card_return(userTransactions[index].title,
                userTransactions[index].amount, userTransactions[index].date);
          },
          itemCount: userTransactions.length,
        ));
  }
}
