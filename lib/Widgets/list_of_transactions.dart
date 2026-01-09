import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListOfTransactions extends StatelessWidget {
  const ListOfTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder:
          (BuildContext context, TransactionProvider provider, Widget? child) {
            return ListView.builder(
              itemCount: provider.listOfTransactions.length,
              itemBuilder: (_, index) {
                final transaction = provider.listOfTransactions[index];
                return GestureDetector(
                  onLongPress: () {
                    provider.removeTransaction(index);
                  },
                  child: ListTile(
                    title: Text(
                      transaction.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('yyyy/MM/dd').format(transaction.date),
                    ),
                    trailing: Text(
                      transaction.isIncome
                          ? "${transaction.amount.toInt()} EGP"
                          : "- ${transaction.amount.toInt()} EGP",
                      style: TextStyle(
                        fontSize: 15,
                        color: transaction.isIncome ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          },
    );
  }
}
