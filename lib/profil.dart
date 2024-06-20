import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Mahasiswa",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
       backgroundColor: Color.fromARGB(255, 214, 138, 5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade800, // Warna border hitam
                  child: CircleAvatar(
                    radius: 58.5, // Menjadikan border lebih tipis
                    backgroundColor: Colors.grey.shade200, // Warna latar dalam foto profil
                    child: Icon(Icons.person, size: 60, color: Colors.grey[600]), // Ikon orang dengan warna abu-abu
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, size: 20, color: Colors.white),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      // Logika untuk mengubah foto profil
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Syahrul",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set color to black
              ),
            ),
            Text(
              "syahrulazharfaisal@gmail.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 30),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Logika tambahan untuk mengubah foto profil
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Ubah Foto Profil"),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(
                "Pengaturan Akun",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              leading: Icon(Icons.settings),
              onTap: () {
                // Navigasi ke halaman pengaturan akun
              },
            ),
            ListTile(
              title: Text(
                "Privasi dan Keamanan",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              leading: Icon(Icons.security),
              onTap: () {
                // Navigasi ke halaman privasi dan keamanan
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
