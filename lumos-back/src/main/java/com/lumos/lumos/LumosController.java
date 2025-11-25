package com.lumos.lumos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/chamadas")
@CrossOrigin(origins = "*")
public class LumosController {

    @GetMapping
    public List<Map<String, Object>> getChamadas() {
        List<Map<String, Object>> chamadas = new ArrayList<>();

        Map<String, Object> c1 = new HashMap<>();
        c1.put("matrícula", 1);
        c1.put("aluno", "João Silva");
        c1.put("presenca", false);

        Map<String, Object> c2 = new HashMap<>();
        c2.put("matrícula", 2);
        c2.put("aluno", "Maria Souza");
        c2.put("presenca", false);

        chamadas.add(c1);
        chamadas.add(c2);

        return chamadas;
    }

    @PostMapping
    public String registrarChamada(@RequestBody List<Map<String, Object>> chamadas) {
        System.out.println("Recebido no backend:");
        chamadas.forEach(System.out::println);

        return "Chamada registrada com sucesso!";
    }
}
