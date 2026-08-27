import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/expense.dart';
import '../models/expense_category.dart';
import '../services/expense_service.dart';
import '../services/trip_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final noteController = TextEditingController();

  String selectedCategory = 'Food';

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Expense',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 30),
        children: [
          const Text(
            'Record a new expense',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Keep your trip spending organized.',
            style: TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 25),
          CustomTextField(
            label: 'Expense title',
            hint: 'e.g. Dinner at Bosphorus',
            controller: titleController,
            prefixIcon: Icons.receipt_long_outlined,
          ),
          const SizedBox(height: 18),
          CustomTextField(
            label: 'Amount',
            hint: '0.00',
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            prefixIcon: Icons.attach_money_rounded,
          ),
          const SizedBox(height: 20),
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ExpenseCategory.categories.map((category) {
              final selected = selectedCategory == category.name;

              return ChoiceChip(
                label: Text(category.name),
                avatar: Icon(
                  category.icon,
                  size: 17,
                  color: selected
                      ? Colors.white
                      : category.color,
                ),
                selected: selected,
                onSelected: (_) {
                  setState(() {
                    selectedCategory = category.name;
                  });
                },
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  color: selected
                      ? Colors.white
                      : AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Note',
            hint: 'Optional note',
            controller: noteController,
            prefixIcon: Icons.notes_rounded,
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: 'Save Expense',
              icon: Icons.check_rounded,
              onPressed: _saveExpense,
            ),
          ),
        ],
      ),
    );
  }

  void _saveExpense() {
    final title = titleController.text.trim();
    final amount = double.tryParse(amountController.text.trim());

    if (title.isEmpty || amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a title and valid amount.'),
        ),
      );
      return;
    }

    ExpenseService.addExpense(
      Expense(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        tripId: TripService.currentTrip.id,
        title: title,
        category: selectedCategory,
        amount: amount,
        date: 'Today',
        note: noteController.text.trim(),
      ),
    );

    Navigator.pop(context);
  }
}