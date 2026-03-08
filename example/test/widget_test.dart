// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:animated_habit_heatmap_example/main.dart';
import 'package:animated_habit_heatmap/animated_habit_heatmap.dart';

void main() {
  testWidgets('Heatmap example app renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HeatmapExampleApp());

    // Verify that the app title is present
    expect(find.text('Habit Heatmap'), findsOneWidget);

    // Verify that the heatmap is rendered
    expect(find.byType(AnimatedHabitHeatmap), findsOneWidget);

    // Verify statistics are shown
    expect(find.text('Total Activity'), findsOneWidget);
    expect(find.text('Current Streak'), findsOneWidget);
    expect(find.text('Longest Streak'), findsOneWidget);
  });

  testWidgets('Heatmap cell tap updates selected date', (WidgetTester tester) async {
    await tester.pumpWidget(const HeatmapExampleApp());

    // Tap on a heatmap cell (assuming there's data)
    final cellFinder = find.byType(HeatmapCell).first;
    await tester.tap(cellFinder);
    await tester.pump();

    // Verify that selected date is updated (text appears)
    expect(find.textContaining('activities'), findsOneWidget);
  });
}
