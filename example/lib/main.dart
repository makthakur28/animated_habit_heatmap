import 'package:flutter/material.dart';
import 'package:animated_habit_heatmap/animated_habit_heatmap.dart';

void main() {
  runApp(const HeatmapExampleApp());
}

class HeatmapExampleApp extends StatelessWidget {
  const HeatmapExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Habit Heatmap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HeatmapExampleScreen(),
    );
  }
}

class HeatmapExampleScreen extends StatefulWidget {
  const HeatmapExampleScreen({Key? key}) : super(key: key);

  @override
  State<HeatmapExampleScreen> createState() => _HeatmapExampleScreenState();
}

class _HeatmapExampleScreenState extends State<HeatmapExampleScreen> {
  late Map<DateTime, int> _habitData;
  DateTime? _selectedDate;
  int? _selectedCount;

  @override
  void initState() {
    super.initState();
    _generateSampleData();
  }

  void _generateSampleData() {
    _habitData = {};
    final today = DateTime.now();
    // Generate data for the last 400 days to ensure full coverage of the 12-month view
    final startDate = today.subtract(const Duration(days: 400));
    
    // Use a fixed seed for reproducible "random" data in this example
    for (int i = 0; i <= 400; i++) {
      final date = HeatmapUtils.normalizeDate(startDate.add(Duration(days: i)));
      
      // Create some patterns
      int count = 0;
      final dayOfYear = i;
      
      if (date.weekday <= 5) { // Weekdays
        count = (dayOfYear % 5 == 0) ? 0 : (dayOfYear % 10);
      } else { // Weekends
        count = (dayOfYear % 3 == 0) ? 2 : 0;
      }
      
      _habitData[date] = count;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Heatmap'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() => _generateSampleData()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Activity Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            
            // The Heatmap Widget
            Card(
              margin: const EdgeInsets.all(16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: AnimatedHabitHeatmap(
                  data: _habitData,
                  colorScale: HeatmapColorScheme.github,
                  onCellTap: (date, count) {
                    setState(() {
                      _selectedDate = date;
                      _selectedCount = count;
                    });
                  },
                ),
              ),
            ),

            if (_selectedDate != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.green.shade700, size: 20),
                      const SizedBox(width: 12),
                      Text(
                        '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}: ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$_selectedCount activities'),
                    ],
                  ),
                ),
              ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Statistics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            _buildStatTile(
              'Total Activity',
              '${HeatmapUtils.calculateTotalActivity(_habitData)} points',
              Icons.bolt,
            ),
            _buildStatTile(
              'Current Streak',
              '${HeatmapUtils.calculateCurrentStreak(_habitData)} days',
              Icons.local_fire_department,
            ),
            _buildStatTile(
              'Longest Streak',
              '${HeatmapUtils.calculateLongestStreak(_habitData)} days',
              Icons.emoji_events,
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatTile(String label, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(label),
      trailing: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
