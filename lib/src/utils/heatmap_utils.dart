/// Utility class for habit-related calculations and data analysis.
///
/// Provides static methods for common habit tracking statistics and analytics.
class HeatmapUtils {
  /// Private constructor to prevent instantiation.
  HeatmapUtils._();

  /// Maps an activity count to a GitHub-style intensity level (0 to 4).
  ///
  /// This is essential for the visual "look" where different shades
  /// represent different ranges of activity.
  ///
  /// Parameters:
  /// - [count]: The activity value for a specific day.
  /// - [maxCount]: The maximum activity value in the entire dataset.
  static int getIntensityLevel(int count, int maxCount) {
    if (count <= 0) return 0;
    if (maxCount <= 0) return 1;

    // Divide the range into 4 buckets (1-4)
    final double percentage = count / maxCount;
    if (percentage <= 0.25) return 1;
    if (percentage <= 0.50) return 2;
    if (percentage <= 0.75) return 3;
    return 4;
  }

  /// Normalizes a date to remove time components (Year, Month, Day only).
  /// GitHub's heatmap is strictly date-based; time of day shouldn't affect the grid.
  static DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Returns the start date of the "GitHub Grid" (the Sunday/Monday of the first week).
  ///
  /// GitHub heatmaps always start at the beginning of a week, even if the
  /// requested range starts mid-week.
  static DateTime getGridStartDate(DateTime startDate, {int firstDayOfWeek = 7}) {
    // firstDayOfWeek: 7 for Sunday, 1 for Monday
    int daysToSubtract = startDate.weekday % 7;
    if (firstDayOfWeek == 1) { // Monday start
      daysToSubtract = startDate.weekday - 1;
    }
    return startDate.subtract(Duration(days: daysToSubtract));
  }

  /// Calculates the longest consecutive days with activity.
  static int calculateLongestStreak(Map<DateTime, int> data) {
    if (data.isEmpty) return 0;

    final sortedDates = data.keys.toList()..sort();
    int longestStreak = 0;
    int currentStreak = 0;

    for (int i = 0; i < sortedDates.length; i++) {
      if (data[sortedDates[i]]! > 0) {
        currentStreak++;
      } else {
        longestStreak = currentStreak > longestStreak ? currentStreak : longestStreak;
        currentStreak = 0;
      }
    }
    return currentStreak > longestStreak ? currentStreak : longestStreak;
  }

  /// Calculates the total activity count across all days.
  static int calculateTotalActivity(Map<DateTime, int> data) {
    return data.values.fold(0, (sum, count) => sum + count);
  }

  /// Calculates the average activity per day.
  static double calculateAverageActivity(Map<DateTime, int> data) {
    if (data.isEmpty) return 0;
    return calculateTotalActivity(data) / data.length;
  }

  /// Calculates the current activity streak from the most recent date.
  static int calculateCurrentStreak(Map<DateTime, int> data) {
    if (data.isEmpty) return 0;
    final sortedDates = data.keys.toList()..sort();
    int currentStreak = 0;

    for (int i = sortedDates.length - 1; i >= 0; i--) {
      if (data[sortedDates[i]]! > 0) {
        currentStreak++;
      } else {
        break;
      }
    }
    return currentStreak;
  }

  /// Counts the total number of active days (days with activity > 0).
  static int countActiveDays(Map<DateTime, int> data) {
    return data.values.where((count) => count > 0).length;
  }

  /// Calculates the activity level for a specific date.
  static int getActivityForDate(Map<DateTime, int> data, DateTime date) {
    // Ensure we look up using a normalized date
    return data[normalizeDate(date)] ?? 0;
  }
}