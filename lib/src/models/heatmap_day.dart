import 'package:flutter/material.dart';

/// Represents a single day's data in a habit heatmap.
///
/// This model encapsulates all information needed to display and interact
/// with a single day in the heatmap grid.
class HeatmapDay {
  /// The date this entry represents.
  final DateTime date;

  /// The activity count for this day.
  /// Typically represents the number of times an activity was performed.
  /// Use 0 to represent days with no activity.
  final int count;

  /// Optional custom color to override the default color scale mapping.
  /// If provided, this color will be used instead of calculating from colorScale.
  final Color? customColor;

  /// Optional metadata associated with this day.
  /// Can be used to store additional information like notes or details.
  final Map<String, dynamic>? metadata;

  /// Creates a [HeatmapDay].
  ///
  /// The [date] and [count] parameters are required.
  /// [customColor] and [metadata] are optional and default to null.
  const HeatmapDay({
    required this.date,
    required this.count,
    this.customColor,
    this.metadata,
  });

  /// Whether this day has any activity.
  ///
  /// Returns true if [count] is greater than 0, false otherwise.
  bool get hasActivity => count > 0;

  /// Returns a formatted string representation of this day's data.
  ///
  /// Format: "YYYY-MM-DD: {count} activities"
  /// Example: "2024-01-15: 5 activities"
  String get displayText {
    final year = date.year;
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day: $count activities';
  }

  /// Creates a copy of this [HeatmapDay] with optionally updated fields.
  ///
  /// If a field is not provided, the current value is used.
  /// This is useful for immutable state updates.
  ///
  /// Example:
  /// ```dart
  /// final newDay = oldDay.copyWith(count: 10);
  /// ```
  HeatmapDay copyWith({
    DateTime? date,
    int? count,
    Color? customColor,
    Map<String, dynamic>? metadata,
  }) {
    return HeatmapDay(
      date: date ?? this.date,
      count: count ?? this.count,
      customColor: customColor ?? this.customColor,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeatmapDay &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          count == other.count &&
          customColor == other.customColor &&
          metadata == other.metadata;

  @override
  int get hashCode =>
      date.hashCode ^ count.hashCode ^ customColor.hashCode ^ metadata.hashCode;

  @override
  String toString() =>
      'HeatmapDay(date: $date, count: $count, customColor: $customColor, metadata: $metadata)';
}

