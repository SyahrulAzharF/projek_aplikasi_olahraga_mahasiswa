import 'package:flutter/material.dart';
import 'gabungaktivitas_buatjadwal.dart';
import 'cari_undang.dart';
import 'melacak_mencatat.dart';
import 'notifikasi.dart';
import 'profil.dart';  // Pastikan file profil.dart sudah ada dan sesuai dengan struktur projek

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
         backgroundColor: Color.fromARGB(255, 214, 138, 5),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle, size: 30),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilPage())),
            tooltip: 'Lihat Profil', // Tooltip ditambahkan di sini
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          buildFeatureTile(
            context: context,
            title: 'Jadwal Olahraga',                  
            subtitle: 'Make your sports schedule !\nLatihan Futsal, Basket, Jogging Bersama',
            iconData: Icons.sports_soccer,
            color: Colors.blue,
            onTap: () => navigateTo(context, const GabungAktivitasBuatJadwalPage(mode: 'jadwal')),
          ),
          buildFeatureTile(
            context: context,
            title: 'Aktivitas yang Tersedia',
            subtitle: 'You can choose and join the available sports activities\nBasket, Workshop Esport, Catur',
            iconData: Icons.sports_basketball,
            color: Colors.orange,
            onTap: () => navigateTo(context, const GabungAktivitasBuatJadwalPage(mode: 'aktivitas')),
          ),
          buildFeatureTile(
            context: context,
            title: 'Acara Mendatang',
            subtitle: '- Turnamen Bola Voli\n- Turnamen Estafet Renang Universitas Se-Surakarta',
            iconData: Icons.event,
            color: Colors.green,
            onTap: () => navigateTo(context, const GabungAktivitasBuatJadwalPage(mode: 'acara')),
          ),
          buildFeatureTile(
            context: context,
            title: 'Track Achievements',
            subtitle: 'Record your sports achievements like duration and calories burned.',
            iconData: Icons.track_changes,
            color: Colors.red,
            onTap: () => navigateTo(context, const MelacakMencatatPage()),
          ),
          buildFeatureTile(
            context: context,
            title: 'Notifications',
            subtitle: 'View upcoming sports events and schedules.',
            iconData: Icons.notifications,
            color: Colors.teal,
            onTap: () => navigateTo(context, const NotifikasiPage()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateTo(context, const CariUndangPage()),
        child: const Icon(Icons.person_add),
        backgroundColor: Colors.pink,
        tooltip: 'Cari dan Undang Teman', // Tooltip untuk FAB
      ),
    );
  }

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  Widget buildFeatureTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData iconData,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: Icon(iconData, color: Colors.white, size: 30),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
