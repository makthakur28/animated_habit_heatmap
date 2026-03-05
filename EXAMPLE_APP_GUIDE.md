# 📱 Example App - Complete Guide

## Overview

The example app demonstrates all capabilities of the `animated_habit_heatmap` package with support for **4 different time period views**: Yearly, Monthly, Weekly, and Daily.

---

## 🗂️ **Application Architecture**

```
HeatmapExampleApp (Root Widget)
├── MaterialApp
│   ├── Theme (Light & Dark)
│   └── Home → HeatmapExampleScreen
│       └── _HeatmapExampleScreenState
│           ├── Data Management
│           │   ├── _generateSampleData()    // 365-day realistic data
│           │   ├── _getDataForViewType()    // Period-specific data
│           │   ├── _getYearlyData()         // 365 days
│           │   ├── _getMonthlyData()        // 30 days
│           │   ├── _getWeeklyData()         // 7 days
│           │   └── _getDailyData()          // 1 day
│           │
│           ├── Configuration Methods
│           │   ├── _getTitleForViewType()   // Dynamic titles
│           │   ├── _getCellSize()           // 13px to 48px
│           │   ├── _getSpacing()            // 2px to 6px
│           │   └── _getColorScale()         // 10 color schemes
│           │
│           ├── UI Builders
│           │   ├── _buildViewTypeButton()   // Period selector
│           │   ├── _buildStatCard()         // Stat cards
│           │   └── _buildDetailStatRow()    // Detail rows
│           │
│           └── build() → Scaffold
│               ├── AppBar
│               ├── Body
│               │   ├── Header Section
│               │   ├── Time Period Selector
│               │   ├── Statistics Cards
│               │   ├── Heatmap Container
│               │   │   └── AnimatedHabitHeatmap Widget
│               │   ├── Color Legend
│               │   ├── Color Scheme Selector
│               │   ├── Statistics Section
│               │   └── Selected Day Info
│               └── FAB (if applicable)
```

---

## 📊 **State Variables**

```dart
class _HeatmapExampleScreenState extends State<HeatmapExampleScreen> {
  // Data
  late Map<DateTime, int> _habitData;              // 365 days of data
  
  // View Configuration
  HeatmapViewType _viewType = HeatmapViewType.yearly;  // Current view
  String _selectedScheme = 'GitHub';               // Current color scheme
  
  // User Interaction
  DateTime? _selectedDate;                         // Tapped cell date
  int _selectedCount = 0;                          // Tapped cell count
  String _selectedInfo = '';                       // Display text
}
```

---

## 🎯 **Time Period Views**

### **Yearly View** (Default)
```dart
Map<DateTime, int> _getYearlyData() {
  return _habitData;  // All 365 days
}
```
- **Cell Size**: 13px (compact)
- **Spacing**: 2px (dense)
- **Use Case**: Year-at-a-glance overview
- **Data Points**: 365 days

### **Monthly View**
```dart
Map<DateTime, int> _getMonthlyData() {
  // Last 30 days from today
  final today = DateTime.now();
  final startDate = today.subtract(const Duration(days: 29));
  // Extract 30 days of data
}
```
- **Cell Size**: 20px (medium)
- **Spacing**: 3px
- **Use Case**: Current month tracking
- **Data Points**: 30 days

### **Weekly View**
```dart
Map<DateTime, int> _getWeeklyData() {
  // Last 7 days from today
  final today = DateTime.now();
  final startDate = today.subtract(const Duration(days: 6));
  // Extract 7 days of data
}
```
- **Cell Size**: 32px (large)
- **Spacing**: 4px
- **Use Case**: Weekly patterns
- **Data Points**: 7 days

### **Daily View**
```dart
Map<DateTime, int> _getDailyData() {
  // Today's data only
  final today = DateTime.now();
  return {today: _habitData[today] ?? 0};
}
```
- **Cell Size**: 48px (extra large)
- **Spacing**: 6px
- **Use Case**: Single day focus
- **Data Points**: 1 day

---

## 🎨 **Color Schemes** (All 10)

```dart
List<Color> _getColorScale() {
  switch (_selectedScheme) {
    case 'GitHub':     return HeatmapColorScheme.github;      // Green
    case 'Blue':       return HeatmapColorScheme.blue;        // Blue
    case 'Red':        return HeatmapColorScheme.red;         // Red
    case 'Orange':     return HeatmapColorScheme.orange;      // Orange
    case 'Purple':     return HeatmapColorScheme.purple;      // Purple
    case 'Pink':       return HeatmapColorScheme.pink;        // Pink
    case 'Teal':       return HeatmapColorScheme.teal;        // Teal
    case 'Grayscale':  return HeatmapColorScheme.grayscale;   // Gray
    case 'Pastel':     return HeatmapColorScheme.pastel;      // Pastel
    case 'Autumn':     return HeatmapColorScheme.autumn;      // Autumn
    default:           return HeatmapColorScheme.github;
  }
}
```

---

## 📈 **Statistics Calculation**

### **Calculated Values**
```dart
// All calculations use _getDataForViewType()
final currentData = _getDataForViewType();

// Longest streak in current view
final longestStreak = HeatmapUtils.calculateLongestStreak(currentData);

// Current streak in current view
final currentStreak = HeatmapUtils.calculateCurrentStreak(currentData);

// Total contributions in current view
final totalActivity = HeatmapUtils.calculateTotalActivity(currentData);

// Average per day in current view
final avgActivity = HeatmapUtils.calculateAverageActivity(currentData);

// Active days in current view
final activeDays = HeatmapUtils.countActiveDays(currentData);
```

### **Stats Card Display**
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    _buildStatCard(title: 'Total', value: '$totalActivity', icon: Icons.whatshot),
    _buildStatCard(title: 'Longest Streak', value: '$longestStreak days', icon: Icons.trending_up),
    _buildStatCard(title: 'Current Streak', value: '$currentStreak days', icon: Icons.bolt),
  ],
)
```

---

## 🔄 **Data Flow**

```
User Selects View Type
    ↓
setState(() => _viewType = type)
    ↓
build() called
    ↓
_getDataForViewType() → Returns filtered data
    ↓
Statistics calculated from filtered data
    ↓
AnimatedHabitHeatmap displayed with data
    ↓
User sees heatmap for selected period
```

---

## 🖱️ **User Interactions**

### **1. View Type Selection**
```dart
_buildViewTypeButton(
  'Yearly',
  HeatmapViewType.yearly,
  Icons.calendar_view_year,
)
// onPressed: setState(() => _viewType = HeatmapViewType.yearly)
```

### **2. Color Scheme Selection**
```dart
FilterChip(
  label: Text(scheme),
  selected: _selectedScheme == scheme,
  onSelected: (selected) => setState(() => _selectedScheme = scheme),
)
```

### **3. Cell Tapping**
```dart
AnimatedHabitHeatmap(
  onCellTap: (date, count) {
    setState(() {
      _selectedDate = date;
      _selectedCount = count;
      _selectedInfo = '${_formatDate(date)} • $count contributions';
    });
    // Show snackbar
  },
)
```

---

## 📝 **Data Generation Pattern**

```dart
void _generateSampleData() {
  _habitData = {};
  final today = DateTime.now();
  final startDate = today.subtract(const Duration(days: 364));
  final random = DateTime.now().microsecond;

  for (int i = 0; i < 365; i++) {
    final date = startDate.add(Duration(days: i));
    
    // Weekday vs Weekend pattern
    int count = date.weekday <= 5 
      ? (random + i) % 10 + 1    // Weekday: 1-10
      : (random + i) % 5;        // Weekend: 0-4
    
    // Random rest days
    if ((random + i * 7) % 15 == 0) count = 0;
    
    _habitData[date] = count;
  }
}
```

---

## 🎯 **Key Methods**

### **Data Retrieval**
| Method | Purpose | Returns |
|--------|---------|---------|
| `_getYearlyData()` | Get 365 days | Map<DateTime, int> |
| `_getMonthlyData()` | Get 30 days | Map<DateTime, int> |
| `_getWeeklyData()` | Get 7 days | Map<DateTime, int> |
| `_getDailyData()` | Get 1 day | Map<DateTime, int> |
| `_getDataForViewType()` | Smart selector | Map<DateTime, int> |

### **Configuration**
| Method | Purpose | Returns |
|--------|---------|---------|
| `_getTitleForViewType()` | Dynamic title | String |
| `_getCellSize()` | Dynamic cell size | double |
| `_getSpacing()` | Dynamic spacing | double |
| `_getColorScale()` | Color scheme | List<Color> |

### **UI Building**
| Method | Purpose | Returns |
|--------|---------|---------|
| `_buildViewTypeButton()` | Period selector | Widget |
| `_buildStatCard()` | Stat display | Widget |
| `_buildDetailStatRow()` | Detail row | Widget |

---

## 📱 **Screen Layout**

```
┌─────────────────────────────────┐
│        AppBar - "Heatmap Views" │
├─────────────────────────────────┤
│                                 │
│  Title: Your Contributions...   │
│  Subtitle: Switch between views │
│                                 │
│  Time Period Selector           │
│  ┌───┬────┬────┬────┐          │
│  │Yr │Mo │Wk │Day │          │
│  └───┴────┴────┴────┘          │
│                                 │
│  Statistics Cards               │
│  ┌────┬────┬────┐              │
│  │Tot│Str│Cur│              │
│  └────┴────┴────┘              │
│                                 │
│  Heatmap Container              │
│  ┌───────────────────────┐      │
│  │  [Animated Heatmap]  │      │
│  └───────────────────────┘      │
│                                 │
│  Color Legend                   │
│  Less ░░░░░░░░ More           │
│                                 │
│  Color Scheme Selector          │
│  [GitHub][Blue][Red]...       │
│                                 │
│  Statistics Section             │
│  Active Days: 250 / 365         │
│  Average: 4.5                   │
│  Max: 10                        │
│                                 │
│  Selected Day Info              │
│  ✓ Feb 15, 2026 • 8 contrib    │
│                                 │
└─────────────────────────────────┘
```

---

## 🚀 **Running the App**

```bash
# Navigate to example directory
cd /Users/mayankthakur/StudioProjects/animated_habit_heatmap/example

# Get dependencies
flutter pub get

# Run on simulator/device
flutter run

# Run in specific mode
flutter run -d <device_id>
```

---

## ✅ **Features Checklist**

- ✅ Yearly view (365 days)
- ✅ Monthly view (30 days)
- ✅ Weekly view (7 days)
- ✅ Daily view (1 day)
- ✅ Dynamic cell sizing (13px → 48px)
- ✅ Dynamic spacing (2px → 6px)
- ✅ 10 color schemes
- ✅ Statistics calculation per view
- ✅ Interactive cell tapping
- ✅ Date formatting
- ✅ Theme switching
- ✅ GitHub-inspired design
- ✅ Smooth animations (600ms)
- ✅ Dark mode support
- ✅ Responsive layout

---

## 🧪 **Testing**

```bash
# Run all tests
flutter test

# Run with verbose output
flutter test -v

# Run specific test file
flutter test test/animated_habit_heatmap_test.dart
```

---

## 📦 **Dependencies**

```yaml
dependencies:
  flutter:
    sdk: flutter
  animated_habit_heatmap:
    path: ../
```

---

## 🎓 **Learning Resources**

The example app demonstrates:
1. **State management** with setState
2. **Data transformation** for different periods
3. **Dynamic UI** based on state
4. **Widget composition** and reusability
5. **User interactions** (tapping, selection)
6. **Theme switching** and dark mode
7. **Animation handling**
8. **Statistics calculation**

---

## 💡 **Tips for Customization**

### **Change Default View**
```dart
HeatmapViewType _viewType = HeatmapViewType.monthly;  // Change here
```

### **Change Default Color Scheme**
```dart
String _selectedScheme = 'Blue';  // Change here
```

### **Customize Cell Sizes**
```dart
double _getCellSize() {
  // Adjust multipliers
  case HeatmapViewType.yearly: return 15;  // Increased from 13
}
```

### **Add More Color Schemes**
```dart
case 'MyScheme':
  return [Color(0xFF...), ...];  // Add your colors
```

---

## 🐛 **Troubleshooting**

**Issue**: Heatmap not updating
- **Solution**: Ensure `setState()` is called after data changes

**Issue**: Numbers not showing
- **Solution**: Check `_formatDate()` and date formatting logic

**Issue**: Colors not changing
- **Solution**: Verify `_getColorScale()` returns correct scheme

**Issue**: Animations not smooth
- **Solution**: Check device performance, reduce `animationDuration`

---

## 📞 **Support**

For issues or questions:
1. Check the package documentation
2. Review the code comments
3. Run `flutter analyze` to check for issues
4. Check the test file for usage examples

---

**Status**: ✅ Production Ready  
**Last Updated**: March 5, 2026  
**Version**: 0.1.0


