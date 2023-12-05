import 'package:crud_tarefa/data/tarefa_data.dart';
import 'package:flutter/material.dart';

import '../business_logic/tarefa_business_logic.dart';

class ListaScreen extends StatefulWidget {
  const ListaScreen({Key? key}) : super(key: key);

  @override
  State<ListaScreen> createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  final _acaoTarefa = MetodosTarefas();
  List<Tarefa> tarefas = [];

  Widget getItem(Tarefa tarefa) {
    return Row(
      children: [
         ValueListenableBuilder<bool>(
          valueListenable: tarefa.concluida,
          builder: (_, concluida, __) {
            return IconButton(
              onPressed: () {
                tarefa.concluida.value = !concluida;
              },
              icon: Icon(
                concluida
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: Colors.green,
              ),
              iconSize: 42,
            );
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tarefa.nome,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(tarefa.data.toString()),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tarefas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _acaoTarefa.controller,
              onSubmitted: (nome) {
                _acaoTarefa.adicionaTarefa(nome);
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Tarefa>>(
              valueListenable: _acaoTarefa.adiconarTarefa,
              builder: (_, tarefas, __) {
                return ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (_, indice) {
                    return getItem(tarefas[indice]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
