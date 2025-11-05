import 'package:flutter/material.dart';
import '../../widgets/lumos_drawer_ra.dart';

class HorarioScreen extends StatelessWidget {
  const HorarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LumosDrawer(),
      appBar: AppBar(
        title: const Text('Grade de Horários'),
        backgroundColor: const Color(0xFFDCC9FF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 3)],
              ),
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(color: Colors.grey.shade300),
                ),
                columnWidths: const {
                  0: FixedColumnWidth(80),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                  5: FlexColumnWidth(),
                  6: FlexColumnWidth(),
                },
                children: [
                  _buildHeaderRow(),
                  ..._buildHorarioRows(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    final headers = ['Horário', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta'];
    return TableRow(
      decoration: const BoxDecoration(
        color: Color(0xFFE6F1FF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      children: headers
          .map((h) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Center(
                  child: Text(
                    h,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2B2B2B),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  List<TableRow> _buildHorarioRows() {
    final linhas = [
      ['7:30', 'Biologia', 'Matemática', 'Geografia', 'Química', 'Artes'],
      ['8:20', 'Geografia', 'Artes', 'Física', 'Matemática', 'Português'],
      ['9:10', 'Intervalo', 'Intervalo', 'Intervalo', 'Intervalo', 'Intervalo'],
      ['9:30', 'Física', 'Português', 'Biologia', 'Filosofia', 'Redação'],
      ['10:20', 'Química', 'Redação', 'Ed. Física', 'Sociologia', 'Ed. Física'],
    ];

    return linhas.map((linha) {
      return TableRow(
        children: linha
            .map((c) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Center(
                    child: Text(
                      c.isEmpty ? '—' : c,
                      style: TextStyle(
                        fontSize: 15,
                        color: c == 'Intervalo' ? Colors.grey.shade500 : Colors.black87,
                        fontWeight: c == 'Intervalo' ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ))
            .toList(),
      );
    }).toList();
  }
}