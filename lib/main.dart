import 'package:crud_tarefa/ui/listaScreen_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  const ListaTarefasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListaScreen(),
    );
  }
}
