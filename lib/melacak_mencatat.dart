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

  // List to store achievements
  final List<Map<String, String>> achievements = [];

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
        backgroundColor: Color.fromARGB(255, 214, 138, 5),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 100.0), // Adjust padding to move image down
                child: Image.asset(
                  'aset_media/gambar/pencapaian.webp',
                  fit: BoxFit.contain, // Adjust BoxFit to control the image size
                ),
              ),
            ),
          ),
          // Foreground content
          SingleChildScrollView(
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
                        prefixIcon: Icon(Icons.timer, color: Colors.blueAccent),
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
                        prefixIcon: Icon(Icons.local_fire_department, color: Colors.redAccent),
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
                    final DateTime now = DateTime.now();
                    final String formattedDate = now.toString(); // Use the default toString() method
                    
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Save Achievement'),
                        content: Text('Saving Data: Duration ${durationController.text} minutes, '
                                      'Calories ${caloriesController.text}, Activity $dropdownValue'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                achievements.add({
                                  'duration': durationController.text,
                                  'calories': caloriesController.text,
                                  'activity': dropdownValue,
                                  'timestamp': formattedDate,
                                });
                              });
                              Navigator.of(context).pop();
                            },
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
                SizedBox(height: 20),
                // ListView to display achievements
                if (achievements.isNotEmpty)
                  Column(
                    children: achievements.map((achievement) {
                      return Card(
                        elevation: 4.0,
                        child: ListTile(
                          title: Text('${achievement['activity']}'),
                          subtitle: Text('Duration: ${achievement['duration']} minutes, '
                                         'Calories: ${achievement['calories']}\n'
                                         'Saved on: ${achievement['timestamp']}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () {
                              setState(() {
                                achievements.remove(achievement);
                              });
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: MelacakMencatatPage()));
