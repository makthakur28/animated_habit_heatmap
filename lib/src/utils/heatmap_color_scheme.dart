import 'package:flutter/material.dart';

/// Predefined color schemes for habit heatmaps.
///
/// Provides a collection of professionally designed color scales
/// that can be used directly with [AnimatedHabitHeatmap].
///
/// Example:
/// ```dart
/// AnimatedHabitHeatmap(
///   data: habitData,
///   colorScale: HeatmapColorScheme.github,
/// )
/// ```
abstract class HeatmapColorScheme {
  /// GitHub-inspired color scheme (green gradient)
  /// Classic contribution graph style
  static const List<Color> github = [
    Color(0xFFEBEDF0), // No contributions - light gray
    Color(0xFF9BE9A8), // 1-3 contributions - light green
    Color(0xFF40C463), // 4-6 contributions - medium green
    Color(0xFF30A14E), // 7-9 contributions - darker green
    Color(0xFF216E39), // 10+ contributions - darkest green
  ];

  /// Blue gradient color scheme
  /// Cool, professional appearance
  static const List<Color> blue = [
    Color(0xFFEEF2FF),
    Color(0xFFDBEAFE),
    Color(0xFF93C5FD),
    Color(0xFF3B82F6),
    Color(0xFF1E40AF),
  ];

  /// Red gradient color scheme
  /// Warm, energetic appearance
  static const List<Color> red = [
    Color(0xFFFEF2F2),
    Color(0xFFFECDCD),
    Color(0xFFFB5A5A),
    Color(0xFFF03E3E),
    Color(0xFFBE123C),
  ];

  /// Orange gradient color scheme
  /// Warm, inviting appearance
  static const List<Color> orange = [
    Color(0xFFFFF5E6),
    Color(0xFFFFCE99),
    Color(0xFFFF9800),
    Color(0xFFF57C00),
    Color(0xFFE65100),
  ];

  /// Purple gradient color scheme
  /// Artistic, creative appearance
  static const List<Color> purple = [
    Color(0xFFF3E5F5),
    Color(0xFFE1BEE7),
    Color(0xFFBA68C8),
    Color(0xFF7B1FA2),
    Color(0xFF4A148C),
  ];

  /// Pink gradient color scheme
  /// Soft, friendly appearance
  static const List<Color> pink = [
    Color(0xFFFCE4EC),
    Color(0xFFF8BBD0),
    Color(0xFFF48FB1),
    Color(0xFFEC407A),
    Color(0xFFC2185B),
  ];

  /// Teal gradient color scheme
  /// Cool, balanced appearance
  static const List<Color> teal = [
    Color(0xFFE0F2F1),
    Color(0xFFB2DFDB),
    Color(0xFF80CBC4),
    Color(0xFF26A69A),
    Color(0xFF00796B),
  ];

  /// Grayscale color scheme
  /// Minimalist, professional appearance
  static const List<Color> grayscale = [
    Color(0xFFF5F5F5),
    Color(0xFFE0E0E0),
    Color(0xFF9E9E9E),
    Color(0xFF616161),
    Color(0xFF212121),
  ];

  /// Pastel color scheme
  /// Soft, gentle appearance
  static const List<Color> pastel = [
    Color(0xFFFAF0E6),
    Color(0xFFFFE4C4),
    Color(0xFFFFBF95),
    Color(0xFFFFAA86),
    Color(0xFFFF9966),
  ];

  /// Warm autumn color scheme
  /// Natural, earthy appearance
  static const List<Color> autumn = [
    Color(0xFFFEF5E7),
    Color(0xFFFDD835),
    Color(0xFFFBC02D),
    Color(0xFFF9A825),
    Color(0xFFD68910),
  ];
}

