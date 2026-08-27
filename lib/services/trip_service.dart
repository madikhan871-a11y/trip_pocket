import '../models/trip.dart';

class TripService {
  TripService._();

  static const List<Trip> trips = [
    Trip(
      id: 'trip-1',
      destination: 'Istanbul',
      country: 'Turkey',
      startDate: 'Sep 12, 2026',
      endDate: 'Sep 18, 2026',
      budget: 1200,
      currency: '\$',
      coverEmoji: '🇹🇷',
    ),
    Trip(
      id: 'trip-2',
      destination: 'Dubai',
      country: 'UAE',
      startDate: 'Oct 04, 2026',
      endDate: 'Oct 09, 2026',
      budget: 900,
      currency: '\$',
      coverEmoji: '🇦🇪',
    ),
  ];

  static Trip get currentTrip => trips.first;
}