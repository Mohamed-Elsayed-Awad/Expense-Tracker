class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final bool isIncome;
  final double amount;

  Transaction({
    required this.id,
    required this.title,
    required this.date,
    required this.isIncome,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "dateTime": date.toIso8601String(),
      "isIncome": isIncome,
      "amount": amount,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> map) {
    return Transaction(
      id: map["id"],
      title: map["title"],
      date: DateTime.parse(map["dateTime"]),
      isIncome: map["isIncome"],
      amount: (map["amount"] as num).toDouble(),
    );
  }
}
