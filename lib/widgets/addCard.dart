// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addCard extends StatefulWidget {
  final Function function;

  addCard({super.key, required this.function});

  @override
  State<addCard> createState() => _addCardState();
}

class _addCardState extends State<addCard> {

  final titleController = TextEditingController();
  final amtController = TextEditingController();
  // ignore: avoid_init_to_null
  late DateTime? datePicked = null;

  void submitData() {
    final title = titleController.text;
    double? amount = double.tryParse(amtController.text);

    if (title.isEmpty || amount == null || amount < 0 || datePicked == null) return;
    widget.function(title, amount.toStringAsFixed(0), datePicked);
    titleController.text = '';
    amtController.text = '';
    datePicked = null;
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        datePicked = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) {},
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType:
                TextInputType.numberWithOptions(signed: false, decimal: true),
            controller: amtController,
            onSubmitted: (_) {},
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Text(datePicked == null
                        ? 'No date chosen !'
                        : 'Date Chosen: ${DateFormat.yMd().format(datePicked!)}')),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
          TextButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
