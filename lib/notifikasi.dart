import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white, // Setting the color to white for high contrast
            fontSize: 20, // Increasing the font size for better readability
            fontWeight: FontWeight.bold, // Making the text bold for emphasis
          ),
        ),
        backgroundColor: theme.primaryColor, // Utilizing the primary color from the theme
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.blue),
            title: Text('Turnamen Bola Voli'),
            subtitle: Text('20 Mei 2024 - 09:00 AM'),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.red),
            title: Text('Latihan Futsal'),
            subtitle: Text('22 Mei 2024 - 10:00 AM'),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.green),
            title: Text('Workshop Esport'),
            subtitle: Text('25 Mei 2024 - 01:00 PM'),
          ),
        ],
      ),
    );
  }
}
