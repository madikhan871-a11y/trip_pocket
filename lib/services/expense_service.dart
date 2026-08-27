import '../models/expense.dart';

class ExpenseService {
  ExpenseService._();

  static final List<Expense> expenses = [
    const Expense(
      id: 'exp-1',
      tripId: 'trip-1',
      title: 'Airport Transfer',
      category: 'Transport',
      amount: 45,
      date: 'Aug 25',
    ),
    const Expense(
      id: 'exp-2',
      tripId: 'trip-1',
      title: 'Hotel Booking',
      category: 'Hotel',
      amount: 280,
      date: 'Aug 24',
    ),
    const Expense(
      id: 'exp-3',
      tripId: 'trip-1',
      title: 'Dinner',
      category: 'Food',
      amount: 38,
      date: 'Aug 23',
    ),
    const Expense(
      id: 'exp-4',
      tripId: 'trip-1',
      title: 'Museum Tickets',
      category: 'Activity',
      amount: 32,
      date: 'Aug 22',
    ),
    const Expense(
      id: 'exp-5',
      tripId: 'trip-1',
      title: 'Shopping',
      category: 'Shopping',
      amount: 225,
      date: 'Aug 21',
    ),
  ];

  static List<Expense> getForTrip(String tripId) {
    return expenses.where((expense) => expense.tripId == tripId).toList();
  }

  static void addExpense(Expense expense) {
    expenses.insert(0, expense);
  }
}