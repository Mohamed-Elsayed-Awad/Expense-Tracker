import 'dart:convert';

import 'package:expense_tracker/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _listOfTransactions = [];

  List<Transaction> get listOfTransactions => _listOfTransactions;
  TransactionProvider() {
    loadTransactions();
  }
  // For Calculating the total of income
  double get totalOfIncome => _listOfTransactions
      .where((transaction) => transaction.isIncome)
      .fold(0, (sum, transaction) => sum + transaction.amount);

  // For calculating the total of expenses
  double get totalOfExpenses => _listOfTransactions
      .where((transaction) => !transaction.isIncome)
      .fold(0, (sum, transaction) => sum + transaction.amount);

  // For calculating remaining balance
  double get remainingBalance => totalOfIncome - totalOfExpenses;

  // Add new transaction
  void addTransactions(String title, double amount, bool isIncome) {
    Transaction transaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      date: DateTime.now(),
      isIncome: isIncome,
      amount: amount,
    );
    _listOfTransactions.insert(0, transaction);
    saveTransations();
    notifyListeners();
  }

  // Remove transation
  void removeTransaction(int index) {
    _listOfTransactions.removeAt(index);
    saveTransations();
    notifyListeners();
  }

  // Save transaction in mobile cache
  Future<void> saveTransations() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final txList = _listOfTransactions
        .map((model) => jsonEncode(model.toMap()))
        .toList();
    sharedPreferences.setStringList("tx", txList);
  }

  // Load transaction from mobile cache
  Future<void> loadTransactions() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final txStringList = sharedPreferences.getStringList("tx") ?? [];
    _listOfTransactions = txStringList
        .map((tx) => Transaction.fromJson(jsonDecode(tx)))
        .toList();

    notifyListeners();
  }
}
