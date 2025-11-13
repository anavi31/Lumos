import 'package:flutter/material.dart';
import '../../widgets/lumos_drawer_professor.dart';

class PrNotasScreen extends StatefulWidget {
  const PrNotasScreen({super.key});

  @override
  State<PrNotasScreen> createState() => _PrNotasScreenState();
}

class _PrNotasScreenState extends State<PrNotasScreen> {
  final List<Map<String, dynamic>> alunos = [
    {'nome': 'Allana Sobrenome Sobrenome', 'matricula': '1234567812', 'n1': 6.5, 'n2': 5.2, 'n3': '', 'media': ''},
    {'nome': 'Amanda Sobrenome Sobrenome', 'matricula': '1234567812', 'n1': 7.0, 'n2': 7.2, 'n3': '', 'media': ''},
    {'nome': 'Antônio Sobrenome Sobrenome', 'matricula': '1234567812', 'n1': 4.0, 'n2': 8.9, 'n3': '', 'media': ''},
    {'nome': 'Bárbara Sobrenome Sobrenome', 'matricula': '9876541230', 'n1': 5.3, 'n2': 6.0, 'n3': '', 'media': ''},
    {'nome': 'Bruno Sobrenome Sobrenome', 'matricula': '3265785423', 'n1': 8.1, 'n2': 4.9, 'n3': '', 'media': ''},
    {'nome': 'Caio Sobrenome Sobrenome', 'matricula': '9865745230', 'n1': 6.5, 'n2': 6.5, 'n3': '', 'media': ''},
    {'nome': 'Fernanda Sobrenome Sobrenome', 'matricula': '0235648954', 'n1': 5.9, 'n2': 5.5, 'n3': '', 'media': ''},
    {'nome': 'Hugo Sobrenome Sobrenome', 'matricula': '1254785206', 'n1': 9.0, 'n2': 7.5, 'n3': '', 'media': ''},
    {'nome': 'Joana Sobrenome Sobrenome', 'matricula': '1426985425', 'n1': 3.4, 'n2': 8.8, 'n3': '', 'media': ''},
    {'nome': 'Júlia Sobrenome Sobrenome', 'matricula': '3210569874', 'n1': 2.1, 'n2': 9.3, 'n3': '', 'media': ''},
    {'nome': 'Lucas Sobrenome Sobrenome', 'matricula': '3025631007', 'n1': 6.7, 'n2': 7.4, 'n3': '', 'media': ''},
    {'nome': 'Luciana Sobrenome Sobrenome', 'matricula': '5478654201', 'n1': 8.9, 'n2': 5.2, 'n3': '', 'media': ''},
    {'nome': 'Lis Sobrenome Sobrenome', 'matricula': '4511256335', 'n1': 8.0, 'n2': 9.5, 'n3': '', 'media': ''},
    {'nome': 'Nathália Sobrenome Sobrenome', 'matricula': '7854124569', 'n1': 9.3, 'n2': 8.0, 'n3': '', 'media': ''},
    {'nome': 'Pedro Sobrenome Sobrenome', 'matricula': '3022278104', 'n1': 9.5, 'n2': 9.8, 'n3': '', 'media': ''},
  ];

  void _calcularMedia(int index) {
    final aluno = alunos[index];
    double soma = 0;

    for (var key in ['n1', 'n2', 'n3']) {
      soma += double.tryParse(aluno[key].toString()) ?? 0;
    }

    aluno['media'] = (soma / 3).toStringAsFixed(1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LumosDrawerPR(),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCC9FF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'LUMOS',
          style: TextStyle(
            fontFamily: 'Frogie',
            fontSize: 38,
            color: Colors.black,
            letterSpacing: 1.2,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F4F9),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            width: 1000,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 3)],
            ),
            child: Column(
              children: [
                // Cabeçalho lilás
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDCC9FF),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      bool isSmall = constraints.maxWidth < 700;
                      return isSmall
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Lançar notas',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black87),
                                ),
                                const SizedBox(height: 8),
                                const Text('Disciplina: Biologia'),
                                const Text('Docente: Professora X'),
                                const Text('Ano: 2025'),
                                const Text('Período: 3º Trimestre'),
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    _dropdownFiltro('Selecionar Série e Turma', 150),
                                  ],
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lançar notas',
                                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black87),
                                    ),
                                    SizedBox(height: 8),
                                    Text('Disciplina: Biologia'),
                                    Text('Docente: Professora X'),
                                    Text('Ano: 2025'),
                                    Text('Período: 3º Trimestre'),
                                  ],
                                ),
                                Wrap(
                                  spacing: 8,
                                  children: [
                                    _dropdownFiltro('Selecionar Série e Turma', 150),
                                  ],
                                ),
                              ],
                            );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Lista de estudantes 3° B',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor: WidgetStateProperty.all(const Color(0xFFE6F1FF)),
                          columns: const [
                            DataColumn(label: Text('Nº')),
                            DataColumn(label: Text('Estudante')),
                            DataColumn(label: Text('Matrícula')),
                            DataColumn(label: Text('1ª Unidade')),
                            DataColumn(label: Text('2ª Unidade')),
                            DataColumn(label: Text('3ª Unidade')),
                            DataColumn(label: Text('Média')),
                          ],
                          rows: List.generate(alunos.length, (index) {
                            final aluno = alunos[index];
                            return DataRow(cells: [
                              DataCell(Text('${index + 1}'.padLeft(2, '0'))),
                              DataCell(Text(aluno['nome'])),
                              DataCell(Text(aluno['matricula'])),
                              DataCell(_campoNota(index, 'n1')),
                              DataCell(_campoNota(index, 'n2')),
                              DataCell(_campoNota(index, 'n3')),
                              DataCell(Text('${aluno['media']}')),
                            ]);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _campoNota(int index, String campo) {
    final controller = TextEditingController(
      text: alunos[index][campo].toString(),
    );

    return SizedBox(
      width: 70,
      height: 36,
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        keyboardType: TextInputType.number,
        onSubmitted: (value) {
          alunos[index][campo] = value;
          _calcularMedia(index);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: const Color(0xFFF8F8F8),
        ),
      ),
    );
  }

  Widget _dropdownFiltro(String hint, double width) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(6),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(hint),
            value: null,
            items: const [
              DropdownMenuItem(value: '1', child: Text('1° A')),
              DropdownMenuItem(value: '2', child: Text('2° A')),
              DropdownMenuItem(value: '3', child: Text('3° A')),
              DropdownMenuItem(value: '4', child: Text('1° B')),
              DropdownMenuItem(value: '5', child: Text('2° B')),
              DropdownMenuItem(value: '6', child: Text('3° B')),
              DropdownMenuItem(value: '4', child: Text('1° C')),
              DropdownMenuItem(value: '5', child: Text('2° C')),
              DropdownMenuItem(value: '6', child: Text('3° C')),
            ],
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
