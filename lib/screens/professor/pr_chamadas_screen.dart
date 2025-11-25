import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lumos/widgets/lumos_drawer_professor.dart';

class PrChamadasScreen extends StatefulWidget {
  const PrChamadasScreen({super.key});

  @override
  State<PrChamadasScreen> createState() => _PrChamadasScreenState();
}

class _PrChamadasScreenState extends State<PrChamadasScreen> {
  List<dynamic> chamadas = [];
  bool loading = true;
  bool sending = false;

  @override
  void initState() {
    super.initState();
    carregarChamadas();
  }

  Future<void> carregarChamadas() async {
    try {
      final url = Uri.parse("http://localhost:8080/api/chamadas");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          chamadas = data.map((c) {
            return {
              "matrícula": c["matrícula"],
              "aluno": c["aluno"],
              "presenca": c["presenca"] ?? false,
            };
          }).toList();

          loading = false;
        });
      } else {
        throw Exception("Erro ao carregar");
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
      debugPrint("Erro: $e");
    }
  }

  Future<void> salvarChamadas() async {
    setState(() => sending = true);

    try {
      final url = Uri.parse("http://localhost:8080/api/chamadas");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(chamadas),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Chamada registrada com sucesso!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Erro ao registrar chamada")),
        );
      }
    } catch (e) {
      debugPrint("Erro ao salvar: $e");
    }

    if (!mounted) return;
    setState(() => sending = false);
  }

  //código da interface, só visual mesmo !!!!!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3edf9),
      appBar: AppBar(
        backgroundColor: const Color(0xffd9b3ff),
        elevation: 0,
        title: const Text(
          "LUMOS",
          style: TextStyle(
            fontFamily: "Frogie",
            fontSize: 32,
            color: Colors.black,
          ),
        ),
      ),
      drawer: LumosDrawerPR(), 
      body: loading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.purple),
            )
          : Column(
              children: [
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(18),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xffd9b3ff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Realizar Chamada",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: chamadas.length,
                    itemBuilder: (context, index) {
                      final item = chamadas[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 26),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${item["matrícula"]}    ${item["aluno"]}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Checkbox(
                              value: item["presenca"],
                              onChanged: (value) {
                                setState(() {
                                  item["presenca"] = value;
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: sending ? null : salvarChamadas,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffb784f0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: sending
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Salvar Chamada",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
