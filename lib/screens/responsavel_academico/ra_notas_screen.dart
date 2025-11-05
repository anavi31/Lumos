import 'package:flutter/material.dart';
import '../../widgets/lumos_drawer_ra.dart';

class RaNotasScreen extends StatelessWidget {
  const RaNotasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LumosDrawerRA(),
      appBar: AppBar(
        title: const Text(
          'Notas',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFFDCC9FF),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F4F9),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 3)
                ],
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
    final headers = [
      'Matéria',
      'Avaliação 1',
      'Avaliação 2',
      'Avaliação 3',
      'Média'
    ];

    return TableRow(
      children: List.generate(headers.length, (index) {
        final radius = index == 0
            ? const BorderRadius.only(topLeft: Radius.circular(12))
            : index == headers.length - 1
                ? const BorderRadius.only(topRight: Radius.circular(12))
                : BorderRadius.zero;
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE6F1FF),
            borderRadius: radius,
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: Text(
              headers[index],
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF2B2B2B),
              ),
            ),
          ),
        );
      }),
    );
  }

  List<TableRow> _buildNotaRows() {
    final dados = [
      ['Português', '6,5', '---', '---', '2,2'],
      ['Matemática', '7,0', '---', '---', '2,3'],
      ['História', '4,0', '---', '---', '1,3'],
      ['Geografia', '5,3', '---', '---', '1,8'],
      ['Física', '8,1', '---', '---', '2,7'],
      ['Química', '6,5', '---', '---', '2,2'],
      ['Biologia', '5,9', '---', '---', '2,9'],
      ['Inglês', '9,0', '---', '---', '4,5'],
      ['Artes', '3,4', '---', '---', '1,7'],
      ['Educação Física', '2,1', '---', '---', '1,0'],
      ['Filosofia', '6,7', '---', '---', '3,3'],
      ['Sociologia', '8,9', '---', '---', '4,4'],
    ];

    return dados.map((linha) {
      return TableRow(
        children: linha.map((c) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Center(
              child: Text(
                c,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
          );
        }).toList(),
      );
    }).toList();
  }
}
