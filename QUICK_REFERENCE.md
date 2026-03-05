# Quick Reference Card

## 🚀 Installation
```yaml
dependencies:
  animated_habit_heatmap: ^0.1.0
```

## 📖 Basic Usage
```dart
import 'package:animated_habit_heatmap/animated_habit_heatmap.dart';

AnimatedHabitHeatmap(
  data: {DateTime(2024, 1, 1): 5},
  colorScale: HeatmapColorScheme.github,
)
```

## 🎨 Color Schemes
```dart
HeatmapColorScheme.github      // Green
HeatmapColorScheme.blue        // Blue
HeatmapColorScheme.red         // Red
HeatmapColorScheme.orange      // Orange
HeatmapColorScheme.purple      // Purple
HeatmapColorScheme.pink        // Pink
HeatmapColorScheme.teal        // Teal
HeatmapColorScheme.grayscale   // Gray
HeatmapColorScheme.pastel      // Pastel
HeatmapColorScheme.autumn      // Autumn
```

## ⚙️ Configuration
```dart
AnimatedHabitHeatmap(
  data: habitData,
  colorScale: colorScale,
  cellSize: 16.0,              // Default
  spacing: 4.0,                // Default
  animationDuration: Duration(milliseconds: 300),  // Default
  onCellTap: (date, count) {
    // Handle tap
  },
)
```

## 📊 Analytics
```dart
// All available utility methods
HeatmapUtils.calculateLongestStreak(data)    // Max consecutive days
HeatmapUtils.calculateCurrentStreak(data)    // From recent date
HeatmapUtils.calculateTotalActivity(data)    // Sum all activities
HeatmapUtils.calculateAverageActivity(data)  // Per-day average
HeatmapUtils.countActiveDays(data)           // Days with activity
HeatmapUtils.getActivityForDate(data, date)  // Specific date
```

## 🗂️ Data Model
```dart
HeatmapDay(
  date: DateTime(2024, 1, 1),
  count: 5,
  customColor: Colors.blue,    // Optional
  metadata: {'note': 'value'},  // Optional
)

// Properties
day.date
day.count
day.customColor
day.metadata

// Methods
day.hasActivity             // true if count > 0
day.displayText             // "2024-01-01: 5 activities"
day.copyWith(count: 10)     // Create modified copy
```

## 📁 Project Structure
```
lib/
├── animated_habit_heatmap.dart
└── src/
    ├── models/heatmap_day.dart
    ├── widgets/heatmap_cell.dart
    ├── widgets/heatmap_grid.dart
    ├── utils/heatmap_utils.dart
    └── utils/heatmap_color_scheme.dart

test/
└── animated_habit_heatmap_test.dart

example/
├── pubspec.yaml
└── lib/main.dart
```

## 📚 Documentation Files
- **README.md** - User guide and API reference
- **FEATURES.md** - Feature documentation
- **CONTRIBUTING.md** - Development guidelines
- **CHANGELOG.md** - Version history
- **COMPLETION_GUIDE.md** - Next steps
- **UPGRADE_SUMMARY.md** - Upgrade details
- **FINAL_SUMMARY.md** - Complete summary

## 🧪 Testing
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/animated_habit_heatmap_test.dart

# Check code quality
flutter analyze

# Format code
dart format lib/
```

## 📦 Publishing
```bash
# Verify everything
flutter test
flutter analyze

# Tag release
git tag v0.1.0
git push origin v0.1.0

# Publish to pub.dev
flutter pub publish
```

## 🎯 Key Features
- ✅ 365-day heatmap display
- ✅ Smooth animations
- ✅ 10 color schemes
- ✅ Tap interaction support
- ✅ Analytics utilities
- ✅ Data model with metadata
- ✅ Zero dependencies
- ✅ 100% documented
- ✅ 30+ tests
- ✅ Example app included

## 💡 Tips
1. Use `HeatmapColorScheme` presets for quick styling
2. Ensure all dates are in your data map (use 0 for no activity)
3. Use at least 3 colors in your scale for visibility
4. Tap callbacks work on individual cells
5. The widget displays last 365 days from today

## 🔗 Links
- **GitHub**: https://github.com/mayankthakur/animated_habit_heatmap
- **Pub.dev**: https://pub.dev/packages/animated_habit_heatmap
- **Issues**: https://github.com/mayankthakur/animated_habit_heatmap/issues

## ✨ Version Info
```
Package: animated_habit_heatmap
Version: 0.1.0
Status: Production Ready ✅
Date: March 5, 2026
```

