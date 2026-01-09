import 'package:expense_tracker/Screens/add_transactions_screen.dart';
import 'package:expense_tracker/Widgets/list_of_transactions.dart';
import 'package:expense_tracker/Widgets/summary_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Expense Tracker"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTransactions(),
          );
        },
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: Column(
        children: [
          SummaryCard(),
          Expanded(child: ListOfTransactions()),
        ],
      ),
    );
  }
}
