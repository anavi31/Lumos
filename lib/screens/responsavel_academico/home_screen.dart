import 'package:flutter/material.dart';
import '../../widgets/lumos_drawer_ra.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LumosDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCC9FF),
        elevation: 0,
        centerTitle: true, // Centraliza o título no topo
        title: Text(
          'LUMOS',
          style: const TextStyle(
            fontFamily: 'Frogie', // Usa a fonte personalizada
            fontSize: 38,
            color: Colors.black,
            letterSpacing: 1.2,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F4F9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/atomo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              'LUMOS',
              style: const TextStyle(
                fontFamily: 'Frogie',
                fontSize: 80,
                color: Color(0xFFCFCEFF),
                height: 0.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
