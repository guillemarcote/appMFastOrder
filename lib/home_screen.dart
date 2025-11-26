import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        backgroundColor: const Color(0xFFFF5300), // Color del gradiente de tu login
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.dashboard,
              size: 80,
              color: Color(0xFFFF5300),
            ),
            SizedBox(height: 20),
            Text(
              '¡Bienvenido a FastOrder!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Esta es tu pantalla principal.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}