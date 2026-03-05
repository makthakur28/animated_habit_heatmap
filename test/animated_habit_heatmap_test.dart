import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_habit_heatmap/animated_habit_heatmap.dart';

void main() {
  group('AnimatedHabitHeatmap Tests', () {
    // Increase surface size for tests to avoid overflow issues in headless environment
    void _setSurfaceSize(WidgetTester tester) {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
    }

    tearDown(() {
      // Reset view size after each test
      final view = TestWidgetsFlutterBinding.instance.platformDispatcher.views.first;
      view.resetPhysicalSize();
      view.resetDevicePixelRatio();
    });

    testWidgets('renders basic widget correctly', (WidgetTester tester) async {
      _setSurfaceSize(tester);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedHabitHeatmap(
              data: {DateTime.now(): 5},
              colorScale: const [Colors.grey, Colors.green],
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedHabitHeatmap), findsOneWidget);
      expect(find.byType(HeatmapCell), findsWidgets);
    });

    testWidgets('renders month labels and weekday labels', (WidgetTester tester) async {
      _setSurfaceSize(tester);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedHabitHeatmap(
              data: {},
              colorScale: const [Colors.grey, Colors.green],
              monthCount: 3,
            ),
          ),
        ),
      );

      expect(find.text('Mon'), findsOneWidget);
      expect(find.text('Wed'), findsOneWidget);
      expect(find.text('Fri'), findsOneWidget);
    });

    testWidgets('shows legend when enabled', (WidgetTester tester) async {
      _setSurfaceSize(tester);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedHabitHeatmap(
              data: {},
              colorScale: const [Colors.grey, Colors.green],
              showLegend: true,
            ),
          ),
        ),
      );

      expect(find.text('Less '), findsOneWidget);
      expect(find.text(' More'), findsOneWidget);
    });

    testWidgets('callback fires when cell is tapped', (WidgetTester tester) async {
      _setSurfaceSize(tester);
      DateTime? tappedDate;
      int? tappedCount;

      final testDate = HeatmapUtils.normalizeDate(DateTime.now());

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedHabitHeatmap(
              data: {testDate: 10},
              colorScale: const [Colors.grey, Colors.green],
              onCellTap: (date, count) {
                tappedDate = date;
                tappedCount = count;
              },
            ),
          ),
        ),
      );

      final cellFinder = find.byWidgetPredicate(
        (widget) => widget is HeatmapCell && widget.date == testDate,
      );

      // Ensure the cell is in the view before tapping
      await tester.ensureVisible(cellFinder);
      await tester.pumpAndSettle();
      
      await tester.tap(cellFinder);
      await tester.pump();

      expect(tappedDate, equals(testDate));
      expect(tappedCount, equals(10));
    });

    testWidgets('custom style is applied', (WidgetTester tester) async {
      _setSurfaceSize(tester);
      const customCellSize = 25.0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedHabitHeatmap(
              data: {DateTime.now(): 1},
              colorScale: const [Colors.grey, Colors.green],
              style: const HeatmapStyle(
                cellSize: customCellSize,
              ),
            ),
          ),
        ),
      );

      final cell = tester.widget<HeatmapCell>(find.byType(HeatmapCell).first);
      expect(cell.size, equals(customCellSize));
    });
  });
}
