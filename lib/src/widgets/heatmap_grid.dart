import 'package:flutter/material.dart';
import 'heatmap_cell.dart';
import '../utils/heatmap_utils.dart';
import '../utils/heatmap_color_scheme.dart';

/// Configuration for the visual style of the heatmap.
class HeatmapStyle {
  final double cellSize;
  final double spacing;
  final double borderRadius;
  final TextStyle? labelTextStyle;
  final TextStyle? monthTextStyle;
  final EdgeInsets padding;

  const HeatmapStyle({
    this.cellSize = 16.0,
    this.spacing = 4.0,
    this.borderRadius = 2.0,
    this.labelTextStyle,
    this.monthTextStyle,
    this.padding = const EdgeInsets.all(16.0),
  });
}

/// A professional-grade animated heatmap widget.
class AnimatedHabitHeatmap extends StatelessWidget {
  /// Map of dates to activity counts.
  final Map<DateTime, int> data;

  /// Colors for intensity levels.
  final List<Color> colorScale;

  /// Visual configuration.
  final HeatmapStyle style;

  /// Total months to display (scrolling back from today).
  final int monthCount;

  /// Duration for cell color transitions.
  final Duration animationDuration;

  /// Tap callback.
  final void Function(DateTime date, int count)? onCellTap;

  /// Whether to show the "Less -> More" legend.
  final bool showLegend;

  const AnimatedHabitHeatmap({
    super.key,
    required this.data,
    this.colorScale = HeatmapColorScheme.github,
    this.style = const HeatmapStyle(),
    this.monthCount = 12,
    this.animationDuration = const Duration(milliseconds: 300),
    this.onCellTap,
    this.showLegend = true,
  });

  static const double _monthHeaderHeight = 24.0;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final months = _generateMonths(now);

    // Calculate height: Weekday labels/Grid (7 rows * (size + spacing)) + Month Header + Padding
    final contentHeight = (style.cellSize + style.spacing) * 7 + _monthHeaderHeight;
    final totalHeight = contentHeight + style.padding.vertical;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: totalHeight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: style.padding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWeekdayLabels(),
                SizedBox(width: style.spacing * 2),
                ...months.map((month) => _buildMonthBlock(context, month)),
              ],
            ),
          ),
        ),
        if (showLegend) _buildLegend(context),
      ],
    );
  }

  List<_MonthData> _generateMonths(DateTime end) {
    return List.generate(monthCount, (i) {
      // Go back monthCount-1 months
      final monthDate = DateTime(end.year, end.month - (monthCount - 1 - i), 1);
      return _MonthData(
        date: monthDate,
        days: _generateDaysInMonth(monthDate),
      );
    });
  }

  List<DateTime> _generateDaysInMonth(DateTime monthDate) {
    final lastDay = DateTime(monthDate.year, monthDate.month + 1, 0).day;
    return List.generate(
      lastDay,
      (index) => DateTime(monthDate.year, monthDate.month, index + 1),
    );
  }

  Widget _buildWeekdayLabels() {
    final labels = ['', 'Mon', '', 'Wed', '', 'Fri', ''];
    return Column(
      children: [
        const SizedBox(height: _monthHeaderHeight),
        ...labels.map((label) => Container(
              height: style.cellSize,
              margin: EdgeInsets.symmetric(vertical: style.spacing / 2),
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: style.labelTextStyle ??
                    TextStyle(
                      fontSize: style.cellSize * 0.6,
                      color: Colors.grey[500],
                    ),
              ),
            )),
      ],
    );
  }

  Widget _buildMonthBlock(BuildContext context, _MonthData month) {
    final weeks = <List<DateTime?>>[];
    List<DateTime?> currentWeek = List.filled(7, null);

    for (var day in month.days) {
      final weekday = day.weekday % 7;
      currentWeek[weekday] = day;
      if (weekday == 6 || day == month.days.last) {
        weeks.add(currentWeek);
        currentWeek = List.filled(7, null);
      }
    }

    return Padding(
      padding: EdgeInsets.only(right: style.spacing * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _monthHeaderHeight,
            child: Text(
              _monthNames[month.date.month - 1],
              style: style.monthTextStyle ??
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: weeks.map((week) {
              return Column(
                children: week.map((day) {
                  return Container(
                    width: style.cellSize,
                    height: style.cellSize,
                    margin: EdgeInsets.all(style.spacing / 2),
                    child: day == null
                        ? null
                        : HeatmapCell(
                            date: day,
                            count: HeatmapUtils.getActivityForDate(data, day),
                            colorScale: colorScale,
                            size: style.cellSize,
                            animationDuration: animationDuration,
                            onTap: onCellTap,
                          ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: style.padding.left),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Less ', style: TextStyle(fontSize: 10, color: Colors.grey[600])),
          ...colorScale.map((color) => Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(style.borderRadius),
                ),
              )),
          Text(' More', style: TextStyle(fontSize: 10, color: Colors.grey[600])),
        ],
      ),
    );
  }

  static const _monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
}

class _MonthData {
  final DateTime date;
  final List<DateTime> days;
  _MonthData({required this.date, required this.days});
}
