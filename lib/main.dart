import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registrasi_page.dart';
import 'dashbord_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Olahraga Mahasiswa', // Application title
      debugShowCheckedModeBanner: false,  // Set this to false to remove the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(), // Set the LoginPage as the initial page.
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegistrationPage(title: 'Register'), // Ensure this matches the constructor.
        '/dashboard': (context) => const DashboardPage(),
      }
    );
  }
}
