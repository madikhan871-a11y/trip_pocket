class Trip {
  final String id;
  final String destination;
  final String country;
  final String startDate;
  final String endDate;
  final double budget;
  final String currency;
  final String coverEmoji;

  const Trip({
    required this.id,
    required this.destination,
    required this.country,
    required this.startDate,
    required this.endDate,
    required this.budget,
    required this.currency,
    required this.coverEmoji,
  });

  double get spent {
    if (id == 'trip-1') return 620;
    if (id == 'trip-2') return 310;
    return 0;
  }

  double get remaining {
    final value = budget - spent;
    return value < 0 ? 0 : value;
  }

  double get progress {
    if (budget <= 0) return 0;
    final value = spent / budget;
    return value.clamp(0.0, 1.0);
  }
}