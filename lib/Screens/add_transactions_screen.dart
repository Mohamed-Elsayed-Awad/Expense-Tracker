import 'package:expense_tracker/Widgets/custom_text_feild.dart';
import 'package:expense_tracker/Widgets/make_tx_button.dart';
import 'package:expense_tracker/Widgets/switch_tx.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  bool isIncom = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              "Add Transaction",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          CustomTextFeild(
            controller: titleController,
            onSubmitted: (value) {
              titleController.text = value;
            },
            text: "Title",
          ),
          SizedBox(height: 16),
          CustomTextFeild(
            controller: amountController,
            onSubmitted: (value) {
              amountController.text = value;
            },
            text: "Amount",
          ),
          SizedBox(height: 16),

          SwitchTx(
            isIncome: isIncom,
            onChanged: (value) {
              setState(() {
                isIncom = value;
              });
            },
          ),
          SizedBox(height: 20),
          MakeTxButton(
            onPressed: () {
              double? amount = double.tryParse(amountController.text);
              if (amount != null &&
                  titleController.text.isNotEmpty &&
                  amount > 0) {
                context.read<TransactionProvider>().addTransactions(
                  titleController.text,
                  amount,
                  isIncom,
                );
                titleController.clear();
                amountController.clear();
                isIncom = false;
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
