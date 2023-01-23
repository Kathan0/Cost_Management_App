import 'package:flutter/material.dart';

class addCard extends StatefulWidget {
  final Function function;

  addCard({super.key, required this.function});

  @override
  State<addCard> createState() => _addCardState();
}

class _addCardState extends State<addCard> {
  final titleController = TextEditingController();

  final amtController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    double? amount = double.tryParse(amtController.text);

    if (title.isEmpty || amount == null || amount < 0) return;
    widget.function(title, amount.toStringAsFixed(0));
    titleController.text = '';
    amtController.text = '';
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
                TextInputType.numberWithOptions(
                  signed: false, decimal: true),
            controller: amtController,
            onSubmitted: (_) {},
          ),
          TextButton(onPressed: submitData, 
          child: Text('Add Transaction')),
        ],
      ),
    );
  }
}
