import 'package:flutter/material.dart';

class MelacakMencatatPage extends StatefulWidget {
  const MelacakMencatatPage({Key? key}) : super(key: key);

  @override
  _MelacakMencatatPageState createState() => _MelacakMencatatPageState();
}

class _MelacakMencatatPageState extends State<MelacakMencatatPage> {
  final TextEditingController durationController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  String dropdownValue = 'Running';

  final List<String> sports = [
    'Running', 'Swimming', 'Cycling', 'Basketball', 'Football',
    'Tennis', 'Yoga', 'Pilates', 'Boxing', 'Dance',
    'Gymnastics', 'Hiking', 'Rock Climbing'
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track and Record Achievements',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: theme.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: durationController,
                  decoration: InputDecoration(
                    labelText: 'Duration (minutes)',
                    prefixIcon: Icon(Icons.timer, color: Colors.blueAccent), // Specific color for duration icon
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: caloriesController,
                  decoration: InputDecoration(
                    labelText: 'Calories Burned',
                    prefixIcon: Icon(Icons.local_fire_department, color: Colors.redAccent), // Specific color for calories icon
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: theme.canvasColor,
                  ),
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: sports.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Save Achievement'),
                    content: Text('Saving Data: Duration ${durationController.text} minutes, '
                                  'Calories ${caloriesController.text}, Activity $dropdownValue'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: theme.colorScheme.onPrimary,
                elevation: 5,
              ),
              child: const Text('Save Achievement', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
