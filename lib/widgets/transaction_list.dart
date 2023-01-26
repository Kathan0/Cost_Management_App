// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  // ignore: prefer_final_fields
  final List<Transactions> userTransactions;
  final Function function;

  late String title;
  late String amount;
  late DateTime date;

  TransactionList({super.key, required this.userTransactions, required this.function});

  // ignore: non_constant_identifier_names
  Widget card_return(String title, int amount, DateTime date, String id) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('₹ $amount')),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateFormat.yMMMd().format(date)),
        trailing: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(Icons.delete),
          onPressed: ()=>function(id),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 294.429,
        child: 
            userTransactions.isEmpty ? 
            const Text('No Transactions added yet!', style: TextStyle(
              fontSize: 25
            ),) : ListView.builder(
          itemBuilder: (ctx, index) {
            return
             card_return(
              userTransactions[index].title,
                userTransactions[index].amount, 
                userTransactions[index].date,
                userTransactions[index].id);
          },
          itemCount: userTransactions.length,
        ));
  }
}
