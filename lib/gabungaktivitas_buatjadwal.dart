import 'package:flutter/material.dart';

class GabungAktivitasBuatJadwalPage extends StatelessWidget {
  final String mode;

  const GabungAktivitasBuatJadwalPage({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitle(),
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 214, 138, 5),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'aset_media/gambar/perlengkapan_2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(10),
            children: _buildContentList(context),
          ),
        ],
      ),
    );
  }

  String _appBarTitle() {
    switch (mode) {
      case 'jadwal':
        return 'Buat Jadwal Olahraga';
      case 'aktivitas':
        return 'Gabung dalam Aktivitas';
      case 'acara':
        return 'Acara Mendatang';
      default:
        return 'Gabung dan Buat Jadwal Aktivitas';
    }
  }

  List<Widget> _buildContentList(BuildContext context) {
    switch (mode) {
      case 'jadwal':
        return _buildJadwalList(context);
      case 'aktivitas':
        return _buildAktivitasList(context);
      case 'acara':
        return _buildAcaraList(context);
      default:
        return [defaultTile()];
    }
  }

  List<Widget> _buildJadwalList(BuildContext context) {
    return [
      _activityTile(
        context,
        'Buat Jadwal Latihan Futsal',
        Icons.sports_soccer,
        Colors.blue,
        "Apakah Anda ingin membuat jadwal olahraga Futsal?",
        createScheduleDialog,
        buttonText: 'Buat Jadwal',
      ),
      _activityTile(
        context,
        'Buat Jadwal Latihan Basket',
        Icons.sports_basketball,
        Colors.orange,
        "Apakah Anda ingin membuat jadwal olahraga Basket?",
        createScheduleDialog,
        buttonText: 'Buat Jadwal',
      ),
      _activityTile(
        context,
        'Buat Jadwal Jogging Bersama',
        Icons.directions_run,
        Colors.green,
        "Apakah Anda ingin membuat jadwal olahraga Jogging?",
        createScheduleDialog,
        buttonText: 'Buat Jadwal',
      ),
    ];
  }

  List<Widget> _buildAktivitasList(BuildContext context) {
    return [
      _activityTile(
        context,
        'Gabung ke Kelas Basket Aktivitas: Setiap Senin/Selasa',
        Icons.sports_basketball,
        Colors.orange,
        "Apakah Anda yakin ingin bergabung dalam aktivitas Basket?",
        joinActivityDialog,
        buttonText: 'Gabung Aktivitas',
      ),
      _activityTile(
        context,
        'Gabung ke Workshop Esport                        Aktivitas: Rabu/Kamis',
        Icons.videogame_asset,
        Colors.red,
        "Apakah Anda yakin ingin bergabung dalam aktivitas Esport?",
        joinActivityDialog,
        buttonText: 'Gabung Aktivitas',
      ),
      _activityTile(
        context,
        'Gabung ke Kelas Catur Aktivitas: Jumat/Sabtu',
        Icons.games,
        Colors.brown,
        "Apakah Anda yakin ingin bergabung dalam aktivitas Catur?",
        joinActivityDialog,
        buttonText: 'Gabung Aktivitas',
      ),
    ];
  }

  List<Widget> _buildAcaraList(BuildContext context) {
    return [
      _eventTile(
        context,
        'Turnamen Bola Voli',
        Icons.event,
        Colors.purple,
        "More Information",
        showVolleyballDialog,
      ),
      _eventTile(
        context,
        'Turnamen Estafet Renang Universitas Se-Surakarta',
        Icons.pool,
        Colors.teal,
        "More Information",
        showSwimmingDialog,
      ),
    ];
  }

  Widget defaultTile() {
    return ListTile(
      leading: Icon(Icons.error, color: Colors.grey),
      title: Text('Tidak ada aksi yang tersedia.'),
    );
  }

  Widget _activityTile(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String question,
    Function(BuildContext, String) showDialogFunction, {
    String buttonText = 'Action',
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(8),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // background color
            foregroundColor: Colors.white, // text color
          ),
          onPressed: () => showDialogFunction(context, question),
          child: Text(buttonText),
        ),
      ),
    );
  }

  Widget _eventTile(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String buttonText,
    Function(BuildContext) showDialogFunction,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(8),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: TextButton(
          onPressed: () => showDialogFunction(context),
          child: Text(buttonText, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }

  // Dialog functions for creating schedule or joining activities
  void createScheduleDialog(BuildContext context, String question) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Schedule'),
          content: Text(question),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Schedule created successfully')));
              },
            ),
            TextButton(
              child: Text('Later'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void joinActivityDialog(BuildContext context, String question) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Join Activity'),
          content: Text(question),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You have joined the activity')));
              },
            ),
            TextButton(
              child: Text('Later'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showVolleyballDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Turnamen Bola Voli'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Turnamen diadakan tanggal 9-Juli-2024, di Gor Manahan Solo, waktu: 20.00 WIB.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showSwimmingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Turnamen Estafet Renang Universitas Se-Surakarta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Turnamen diadakan tanggal 1-Juli-2024, di Kolam Renang Tirta Angkasa(Lanut Adi Soemarmo), waktu: 14.30 WIB.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

void main() => runApp(MaterialApp(home: GabungAktivitasBuatJadwalPage(mode: 'jadwal')));
