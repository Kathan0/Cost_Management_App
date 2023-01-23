// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/transactions.dart';
import 'widgets/chart.dart';
import './widgets/addCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              toolbarTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      titleMedium:
                          TextStyle(fontFamily: 'OpenSans', fontSize: 20))
                  .bodyText2,
              titleTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      titleMedium:
                          TextStyle(fontFamily: 'OpenSans', fontSize: 20))
                  .headline6)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> _userTransactions = [
    Transactions(id: 't1', title: 'Shoes', amount: 3000, date: DateTime.now()),
    Transactions(
        id: 't2', title: 'Groceries', amount: 500, date: DateTime.now().subtract(Duration(days: 1))
        ),
    Transactions(
        id: 't2', title: 'Groceries', amount: 500, date: DateTime.now().subtract(Duration(days: 2))
        ),
    Transactions(
        id: 't2', title: 'Groceries', amount: 500, date: DateTime.now().subtract(Duration(days: 3))
        ),
    Transactions(
        id: 't2', title: 'Groceries', amount: 500, date: DateTime.now().subtract(Duration(days: 4))
        ),
    Transactions(
        id: 't2', title: 'Groceries', amount: 500, date: DateTime.now().subtract(Duration(days: 5))
        ),
    Transactions(
        id: 't2', title: 'Groceries', amount: 500, date: DateTime.now().subtract(Duration(days: 6))
        )
  ];

  void addTxn(String title, String amt) {
    setState(() {
      _userTransactions.add(Transactions(
          id: DateTime.now().toString
          (),
          title: title,
          amount: int.parse(amt),
          date: DateTime.now()));
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: addCard(function: addTxn),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Transactions> get recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7))
        );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: () => startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
          child: Column(children: <Widget>[
        Chart(recentTransactions),
        TransactionList(userTransactions: _userTransactions),
      ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
