import 'package:flutter/material.dart';
import 'package:masr_pay/models/transaction.dart';
import 'package:masr_pay/widgets/dashboard/dashboard_transactions_header.dart';
import 'package:masr_pay/widgets/dashboard/transaction_card.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Movie tickets', amount: 99.69, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Groceries', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'Medicine', amount: 99.69, date: DateTime.now()),
    Transaction(
        id: 't5', title: 'Medicine', amount: 99.69, date: DateTime.now()),
    Transaction(
        id: 't6', title: 'Medicine', amount: 99.69, date: DateTime.now()),
    Transaction(
        id: 't7', title: 'Medicine', amount: 99.69, date: DateTime.now()),
  ];

  Transactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const TransactionsHeader(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return TransactionCard(transaction: _transactions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
