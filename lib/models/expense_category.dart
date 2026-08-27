import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ExpenseCategory {
  final String name;
  final IconData icon;
  final Color color;

  const ExpenseCategory({
    required this.name,
    required this.icon,
    required this.color,
  });

  static const List<ExpenseCategory> categories = [
    ExpenseCategory(
      name: 'Food',
      icon: Icons.restaurant_rounded,
      color: AppColors.food,
    ),
    ExpenseCategory(
      name: 'Transport',
      icon: Icons.directions_car_rounded,
      color: AppColors.transport,
    ),
    ExpenseCategory(
      name: 'Hotel',
      icon: Icons.hotel_rounded,
      color: AppColors.hotel,
    ),
    ExpenseCategory(
      name: 'Shopping',
      icon: Icons.shopping_bag_rounded,
      color: AppColors.shopping,
    ),
    ExpenseCategory(
      name: 'Activity',
      icon: Icons.local_activity_rounded,
      color: AppColors.activity,
    ),
    ExpenseCategory(
      name: 'Other',
      icon: Icons.more_horiz_rounded,
      color: AppColors.other,
    ),
  ];

  static ExpenseCategory getByName(String name) {
    return categories.firstWhere(
          (category) => category.name == name,
      orElse: () => categories.last,
    );
  }
}