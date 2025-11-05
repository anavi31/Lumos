import 'package:flutter/material.dart';

//Responsável Financeiro
import 'package:lumos/screens/responsavel_financeiro/rf_home_screen.dart';
import 'package:lumos/screens/responsavel_financeiro/rf_financeiro_screen.dart';
import 'package:lumos/screens/responsavel_financeiro/rf_notas_screen.dart';
import 'package:lumos/screens/responsavel_financeiro/rf_faltas_screen.dart';
//Responsável Acadêmico
import 'screens/responsavel_academico/ra_home_screen.dart';
import 'screens/responsavel_academico/ra_notas_screen.dart';
import 'screens/responsavel_academico/ra_horario_screen.dart';
import 'screens/responsavel_academico/ra_avisos_screen.dart';
import 'screens/responsavel_academico/ra_advertencias_screen.dart';
import 'screens/responsavel_academico/ra_faltas_screen.dart';

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
      initialRoute: '/rf_home', //pra testar a tela q vc quer vc altera AQUI a tela que vc quer que rode primeiro ok!!

      //vai adicionando aq suas páginas pra navegação depois de importar elas lá no começo
      routes: {
        '/ra_home': (context) => const RaHomeScreen(),
        '/ra_notas': (context) => const RaNotasScreen(),
        '/ra_horario': (context) => const RaHorarioScreen(),
        '/ra_avisos': (context) => const RaAvisosScreen(),
        '/ra_advertencias': (context) => const RaAdvertenciasScreen(),
        '/ra_faltas': (context) => const RaFaltasScreen(),
        '/rf_faltas': (context) => const RfFaltasScreen(),
        '/rf_financeiro': (context) => const RfFinanceiroScreen(),
        '/rf_notas': (context) => const RfNotasScreen(),
        '/rf_home': (context) => const RfHomeScreen(),
      },
    );
  }
}