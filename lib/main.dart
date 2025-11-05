import 'package:flutter/material.dart';
import 'screens/responsavel_academico/home_screen.dart';
import 'screens/responsavel_academico/notas_screen.dart';
import 'screens/responsavel_academico/horario_screen.dart';
import 'screens/responsavel_academico/avisos_screen.dart';
import 'screens/responsavel_academico/advertencias_screen.dart';
import 'screens/responsavel_academico/faltas_screen.dart';

void main() {
  runApp(const LumosApp());
}

class LumosApp extends StatelessWidget {
  const LumosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lumos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF5F4F9),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDCC9FF),
        ),
      ),
      // rota inicial:
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/notas': (context) => const NotasScreen(),
        '/horario': (context) => const HorarioScreen(),
        '/avisos': (context) => const AvisosScreen(),
        '/advertencias': (context) => const AdvertenciasScreen(),
        '/falta': (context) => const FaltasScreen(),
      },
    );
  }
}
