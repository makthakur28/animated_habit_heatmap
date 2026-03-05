/// A beautiful, customizable animated heatmap widget for visualizing habit tracking data.
///
/// This library provides widgets and utilities for creating GitHub-style contribution
/// graphs in Flutter applications. Display 365 days of activity with smooth color
/// animations and interactive feedback.
///
/// ## Features
///
/// - 📊 Display 365 days of activity data in a responsive heatmap grid
/// - 🎨 Smooth color animations with customizable color scales
/// - 🎯 Tap interaction support for individual day cells
/// - 🔥 Built-in utilities for streak calculation and analytics
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
/// final colorScale = [
///   Colors.grey[200]!,
///   Color(0xffc6e48b),
///   Color(0xff7bc96f),
///   Color(0xff239a3b),
///   Color(0xff196127),
/// ];
///
/// AnimatedHabitHeatmap(
///   data: habitData,
///   colorScale: colorScale,
/// )
/// ```
library animated_habit_heatmap;

export 'src/models/heatmap_day.dart';
export 'src/widgets/heatmap_grid.dart';
export 'src/widgets/heatmap_cell.dart';
export 'src/utils/heatmap_utils.dart';
export 'src/utils/heatmap_color_scheme.dart';
