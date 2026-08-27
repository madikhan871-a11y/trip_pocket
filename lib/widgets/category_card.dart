import 'package:flutter/material.dart';

import '../models/expense_category.dart';

class CategoryCard extends StatelessWidget {
  final ExpenseCategory category;
  final double amount;

  const CategoryCard({
    super.key,
    required this.category,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: category.color.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            category.icon,
            color: category.color,
            size: 22,
          ),
          const Spacer(),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF718287),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            '\$${amount.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF183B43),
            ),
          ),
        ],
      ),
    );
  }
}