import 'package:flutter/material.dart';
import '../../widgets/lumos_drawer_professor.dart';

class PrChamadasScreen extends StatefulWidget {
  const PrChamadasScreen({super.key});

  @override
  State<PrChamadasScreen> createState() => _PrChamadasScreenState();
}

class _PrChamadasScreenState extends State<PrChamadasScreen> {
  final List<Map<String, dynamic>> alunos = [
    {"nome": "Allana Sobrenome Sobrenome", "matricula": "1234567812", "classe": "3ºB", "faltas": 3, "presente": false},
    {"nome": "Amanda Sobrenome Sobrenome", "matricula": "1234567812", "classe": "3ºB", "faltas": 2, "presente": false},
    {"nome": "Antônio Sobrenome Sobrenome", "matricula": "1234567812", "classe": "3ºB", "faltas": 7, "presente": false},
    {"nome": "Bárbara Sobrenome Sobrenome", "matricula": "9876541230", "classe": "3ºB", "faltas": 0, "presente": true},
    {"nome": "Bruno Sobrenome Sobrenome", "matricula": "3265785423", "classe": "3ºB", "faltas": 1, "presente": false},
    {"nome": "Caio Sobrenome Sobrenome", "matricula": "9865745230", "classe": "3ºB", "faltas": 0, "presente": false},
    {"nome": "Fernanda Sobrenome Sobrenome", "matricula": "0235648954", "classe": "3ºB", "faltas": 0, "presente": false},
    {"nome": "Hugo Sobrenome Sobrenome", "matricula": "1254785206", "classe": "3ºB", "faltas": 0, "presente": false},
    {"nome": "Joana Sobrenome Sobrenome", "matricula": "1426985425", "classe": "3ºB", "faltas": 4, "presente": false},
    {"nome": "Júlia Sobrenome Sobrenome", "matricula": "3210569874", "classe": "3ºB", "faltas": 2, "presente": false},
    {"nome": "Lucas Sobrenome Sobrenome", "matricula": "3026531007", "classe": "3ºB", "faltas": 6, "presente": true},
    {"nome": "Luciana Sobrenome Sobrenome", "matricula": "5478654201", "classe": "3ºB", "faltas": 3, "presente": true},
    {"nome": "Lis Sobrenome Sobrenome", "matricula": "4511265335", "classe": "3ºB", "faltas": 2, "presente": false},
    {"nome": "Nathália Sobrenome Sobrenome", "matricula": "7854124569", "classe": "3ºB", "faltas": 0, "presente": false},
    {"nome": "Pedro Sobrenome Sobrenome", "matricula": "3022278104", "classe": "3ºB", "faltas": 5, "presente": false},
  ];

    void _salvarChamada() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chamada salva com sucesso!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho lilás
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDCC9FF),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: const Text(
                    'Realizar Chamada',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),

                // Tabela
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Lista de estudantes 3° B',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 12),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                        headingRowColor: WidgetStateProperty.all(const Color(0xFFE6F1FF)),
                          columns: const [
                            DataColumn(label: Text('Nº')),
                            DataColumn(label: Text('Estudante')),
                            DataColumn(label: Text('Matrícula')),
                            DataColumn(label: Text('Classe')),
                            DataColumn(label: Text('Quantidade de Faltas')),
                            DataColumn(label: Text('Marcar Faltas')),
                          ],
                          rows: List.generate(alunos.length, (index) {
                            final aluno = alunos[index];
                            return DataRow(cells: [
                              DataCell(Text('${index + 1}'.padLeft(2, '0'))),
                              DataCell(Text(aluno['nome'])),
                              DataCell(Text(aluno['matricula'])),
                              DataCell(Text(aluno['classe'])),
                              DataCell(Text(aluno['faltas'].toString())),
                              DataCell(
                                Checkbox(
                                  value: aluno['presente'],
                                  onChanged: (value) {
                                    setState(() {
                                      aluno['presente'] = value!;
                                    });
                                  },
                                ),
                              ),
                            ]);
                          }),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Botão "Salvar chamada"
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: _salvarChamada,
                          icon: const Icon(Icons.save_rounded, color: Colors.black),
                          label: const Text(
                            'Salvar chamada',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFE380),
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
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
}