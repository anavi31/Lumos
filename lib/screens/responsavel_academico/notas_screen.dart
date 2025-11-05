import 'package:flutter/material.dart';
import '../../widgets/lumos_drawer_ra.dart';

class NotasScreen extends StatelessWidget {
  const NotasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LumosDrawer(),
      appBar: AppBar(
        title: const Text('Notas'),
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
                  0: FixedColumnWidth(50),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                  5: FlexColumnWidth(),
                },
                children: [
                  _buildHeaderRow(),
                  ..._buildNotaRows(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(
        color: Color(0xFFE6F1FF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      children: const [
        _HeaderCell('N°'),
        _HeaderCell('Matéria'),
        _HeaderCell('Avaliação 1'),
        _HeaderCell('Avaliação 2'),
        _HeaderCell('Avaliação 3'),
        _HeaderCell('Média'),
      ],
    );
  }

  List<TableRow> _buildNotaRows() {
    final dados = [
      ['01', 'Português', '6,5', '---', '---', '2,2'],
      ['02', 'Matemática', '7,0', '---', '---', '2,3'],
      ['03', 'História', '4,0', '---', '---', '1,3'],
      ['04', 'Geografia', '5,3', '---', '---', '1,8'],
      ['05', 'Física', '8,1', '---', '---', '2,7'],
      ['06', 'Química', '6,5', '---', '---', '2,2'],
      ['07', 'Biologia', '5,9', '---', '---', '2,9'],
      ['08', 'Inglês', '9,0', '---', '---', '4,5'],
      ['09', 'Artes', '3,4', '---', '---', '1,7'],
      ['10', 'Educação Física', '2,1', '---', '---', '1,0'],
      ['11', 'Filosofia', '6,7', '---', '---', '3,3'],
      ['12', 'Sociologia', '8,9', '---', '---', '4,4'],
    ];

    return dados.map((linha) {
      return TableRow(
        children: linha
            .map((c) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Center(
                    child: Text(
                      c,
                      style: const TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ))
            .toList(),
      );
    }).toList();
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B2B),
          ),
        ),
      ),
    );
  }
}
