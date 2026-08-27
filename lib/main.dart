import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
import 'constants/app_text_styles.dart';
import 'routes/app_routes.dart';
import 'screens/add_expense_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/trip_details_screen.dart';

void main() {
  runApp(const TripPocketApp());
}

class TripPocketApp extends StatelessWidget {
  const TripPocketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripPocket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        textTheme: AppTextStyles.textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
        ),
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.tripDetails: (_) => const TripDetailsScreen(),
        AppRoutes.addExpense: (_) => const AddExpenseScreen(),
        AppRoutes.profile: (_) => const ProfileScreen(),
      },
    );
  }
}