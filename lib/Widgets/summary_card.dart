import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final txProvider = Provider.of<TransactionProvider>(context);
    return Card(
      elevation: 2,
      color: Colors.white,
      shadowColor: Colors.black,
      child: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Monthly Summary",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total Income: ${txProvider.totalOfIncome.toInt()} EGP",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  "Total Income: ${txProvider.totalOfExpenses.toInt()} EGP",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            Text(
              "Remaining Balance: ${txProvider.remainingBalance.toInt()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
