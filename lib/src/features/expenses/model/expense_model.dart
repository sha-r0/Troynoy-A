class ExpenseModel {
  String expenseby;
  String date;
  String purpose;
  String amount;

  ExpenseModel({
    required this.expenseby,
    required this.date,
    required this.purpose,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'expenseby': expenseby,
      'date': date,
      'purpose': purpose,
      'amount': amount,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      expenseby: map['expenseby'],
      date: map['date'],
      purpose: map['purpose'],
      amount: map['amount'],
    );
  }
}
