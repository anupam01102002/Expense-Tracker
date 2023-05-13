import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  String titleInput;
  String amountInput;

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleInput;
    final enteredAmount = double.parse(amountInput);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => submitData(),
              onChanged: (val) {
                titleInput = val;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              onChanged: (val) {
                amountInput = val;
              },
            ),
            TextButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(foregroundColor: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
