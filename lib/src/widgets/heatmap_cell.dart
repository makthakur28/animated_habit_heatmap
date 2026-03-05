import 'package:flutter/material.dart';

/// Individual cell in the heatmap grid representing a single day's activity.
class HeatmapCell extends StatelessWidget {
  /// The date this cell represents.
  final DateTime date;

  /// The activity count for this day.
  final int count;

  /// List of colors representing the intensity gradient.
  final List<Color> colorScale;

  /// Size of this cell in pixels.
  final double size;

  /// Duration of the color animation.
  final Duration animationDuration;

  /// Optional callback triggered when the cell is tapped.
  final void Function(DateTime date, int value)? onTap;

  /// Whether to show a tooltip on long press or hover.
  final bool showTooltip;

  const HeatmapCell({
    Key? key,
    required this.date,
    required this.count,
    required this.colorScale,
    required this.size,
    required this.animationDuration,
    this.onTap,
    this.showTooltip = true,
  }) : super(key: key);

  Color _getColor() {
    if (count <= 0) return colorScale.first;
    // Map count to color scale index (1 to length-1)
    // If there are 5 colors, index 0 is for 0, 1-4 are for activity.
    final index = count.clamp(0, colorScale.length - 1);
    return colorScale[index];
  }

  String _getTooltipText() {
    final dateStr = "${date.day} ${_monthNames[date.month - 1]} ${date.year}";
    return "$count contributions on $dateStr";
  }

  static const _monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    final cellColor = _getColor();
    final widget = GestureDetector(
      onTap: onTap != null ? () => onTap!.call(date, count) : null,
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(begin: Colors.transparent, end: cellColor),
        duration: animationDuration,
        curve: Curves.easeInOut,
        builder: (context, color, child) {
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          );
        },
      ),
    );

    if (showTooltip) {
      return Tooltip(
        message: _getTooltipText(),
        preferBelow: false,
        verticalOffset: 20,
        child: widget,
      );
    }

    return widget;
  }
}
