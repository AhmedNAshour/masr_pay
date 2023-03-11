import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masr_pay/constants.dart';
import 'package:masr_pay/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction _transaction;

  const TransactionCard({super.key, required Transaction transaction})
      : _transaction = transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.attach_money,
          ),
        ),
        title: Text(_transaction.title),
        subtitle: Text(DateFormat('dd-MM-yyyy').format(_transaction.date)),
        trailing: Text('EGP ${_transaction.amount}'),
      ),
    );
  }
}
