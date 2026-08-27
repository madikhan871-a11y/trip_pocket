import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/expense.dart';
import '../models/expense_category.dart';
import '../routes/app_routes.dart';
import '../services/expense_service.dart';
import '../services/trip_service.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/budget_progress_card.dart';
import '../widgets/category_card.dart';
import '../widgets/expense_card.dart';
import '../widgets/section_header.dart';
import '../widgets/trip_card.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 1) {
      return const ProfileScreen();
    }

    final trip = TripService.currentTrip;
    final expenses = ExpenseService.getForTrip(trip.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TripPocket',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
          children: [
            const Text(
              'Your next adventure',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Ready to explore? ✈️',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            TripCard(
              trip: trip,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.tripDetails,
                );
              },
            ),
            const SizedBox(height: 16),
            BudgetProgressCard(trip: trip),
            const SizedBox(height: 25),
            const SectionHeader(
              title: 'Spending by category',
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 112,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ExpenseCategory.categories.length,
                separatorBuilder: (_, _) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final category = ExpenseCategory.categories[index];
                  final amount = _categoryTotal(
                    expenses,
                    category.name,
                  );

                  return CategoryCard(
                    category: category,
                    amount: amount,
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            SectionHeader(
              title: 'Recent expenses',
              action: 'View all',
              onAction: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.tripDetails,
                );
              },
            ),
            const SizedBox(height: 10),
            ...expenses.take(3).map(
                  (expense) => ExpenseCard(expense: expense),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.addExpense,
                  ).then((_) {
                    setState(() {});
                  });
                },
                icon: const Icon(Icons.add_rounded),
                label: const Text('Add Expense'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _categoryTotal(
      List<Expense> expenses,
      String category,
      ) {
    return expenses
        .where((expense) => expense.category == category)
        .fold(0, (sum, expense) => sum + expense.amount);
  }
}
