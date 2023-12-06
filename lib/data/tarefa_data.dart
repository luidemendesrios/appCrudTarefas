import 'package:flutter/material.dart';
import '../business_logic/tarefa_business_logic.dart';

class MetodosTarefas{

  List<Tarefa> tarefas = [];
  TextEditingController controller = TextEditingController();
  
  final tarefasNotifier = ValueNotifier<List<Tarefa>>([]);

  
void adicionarTarefa(String nome) {
    int id = tarefas.isEmpty ? 1 : tarefas.last.id + 1;
    tarefas.add(Tarefa(id: id, nome: nome));
    tarefasNotifier.value = List.from(tarefas);
    controller.clear();
  }

void excluirTarefa(int id) {
  tarefas.removeWhere((tarefa) => tarefa.id == id);
  tarefasNotifier.value = List.from(tarefas);
}
void _atualizarTarefa(Tarefa tarefa) {
  // Encontrar a tarefa na lista
  int index = tarefas.indexWhere((t) => t.id == tarefa.id);
  if (index != -1) {
    // Atualizar a tarefa
    tarefas[index] = tarefa;
    // Notificar o ValueNotifier para atualizar a interface
    tarefasNotifier.value = List.from(tarefas);
  }
}
 
void editarTarefa(BuildContext context,Tarefa tarefa){
  // Pegar o valor atual da tarefa
  String nomeAtual = tarefa.nome;
  // Permitir ao usuário editar o nome
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Editar tarefa'),
        content: TextField(
          controller: TextEditingController(text: tarefa.nome),
          onChanged: (nome) {
            tarefa.nome = nome;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
             // Atualizar a tarefa existente
              _atualizarTarefa(tarefa);
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      );
    },
  );
}
}
