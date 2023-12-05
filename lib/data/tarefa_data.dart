import 'package:flutter/material.dart';

import '../business_logic/tarefa_business_logic.dart';


class MetodosTarefas{

  List<Tarefa> tarefas = [];
  TextEditingController controller = TextEditingController();
  final adiconarTarefa = ValueNotifier<List<Tarefa>>([]);

 
void adicionaTarefa(String nome) {
    tarefas.add(Tarefa(nome));
    adiconarTarefa.value = List.from(tarefas);
    controller.clear();
  }
}