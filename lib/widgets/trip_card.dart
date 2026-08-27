import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  final VoidCallback? onTap;

  const TripCard({
    super.key,
    required this.trip,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  trip.coverEmoji,
                  style: const TextStyle(fontSize: 32),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_outward_rounded,
                  color: Colors.white70,
                ),
              ],
            ),
            const SizedBox(height: 22),
            Text(
              trip.destination,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              trip.country,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white70,
                  size: 16,
                ),
                const SizedBox(width: 7),
                Text(
                  '${trip.startDate} - ${trip.endDate}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}