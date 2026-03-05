/// A beautiful, customizable animated heatmap widget for visualizing habit tracking data.
///
/// This library provides widgets and utilities for creating GitHub-style contribution
/// graphs in Flutter applications. Display 365 days of activity with smooth color
/// animations and interactive feedback.
///
/// ## Features
///
/// - 📅 **GitHub-Style Layout**: Days are grouped into months, arranged in columns (weeks), with horizontal scrolling.
/// - 🎨 **Smooth Animations**: High-performance color transitions when data changes.
/// - 📱 **Responsive & Scrollable**: Designed to handle 365+ days of data with smooth horizontal navigation.
/// - 🎯 **Interactive Cells**: Built-in support for tap callbacks and native tooltips.
/// - 📊 **Professional Legend**: Optional "Less -> More" intensity legend.
/// - 🔥 **Built-in Analytics**: Utility methods for streak calculation and activity tracking.
///
/// ## Getting Started
///
/// Import the package:
/// ```dart
/// import 'package:animated_habit_heatmap/animated_habit_heatmap.dart';
/// ```
///
/// Create a heatmap with your habit data:
/// ```dart
/// final habitData = <DateTime, int>{
///   DateTime(2024, 1, 1): 5,
///   DateTime(2024, 1, 2): 3,
/// };
///
/// AnimatedHabitHeatmap(
///   data: habitData,
///   colorScale: HeatmapColorScheme.github,
/// )
/// ```

export 'src/models/heatmap_day.dart';
export 'src/widgets/heatmap_grid.dart';
export 'src/widgets/heatmap_cell.dart';
export 'src/utils/heatmap_utils.dart';
export 'src/utils/heatmap_color_scheme.dart';
