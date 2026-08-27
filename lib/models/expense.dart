class Expense {
  final String id;
  final String tripId;
  final String title;
  final String category;
  final double amount;
  final String date;
  final String note;

  const Expense({
    required this.id,
    required this.tripId,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    this.note = '',
  });
}