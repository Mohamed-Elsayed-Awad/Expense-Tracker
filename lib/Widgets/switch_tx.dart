import 'package:flutter/material.dart';

class SwitchTx extends StatelessWidget {
  const SwitchTx({super.key, required this.isIncome, required this.onChanged});
  final bool isIncome;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Income",
          style: TextStyle(color: isIncome ? Colors.green : Colors.black),
        ),
        Switch(
          inactiveTrackColor: Colors.red,
          inactiveThumbColor: Colors.white,
          value: isIncome,
          onChanged: onChanged,
          activeThumbColor: Colors.green,
        ),
        Text(
          "Expense",
          style: TextStyle(color: isIncome ? Colors.black : Colors.red),
        ),
      ],
    );
  }
}
