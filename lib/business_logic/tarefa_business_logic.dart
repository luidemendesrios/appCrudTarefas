import 'package:flutter/material.dart';

class Tarefa {
  String nome;
  DateTime data;
  ValueNotifier<bool> concluida;
  final int id;

  Tarefa({required this.id, required this.nome}) : data = DateTime.now(),
   concluida = ValueNotifier<bool>(false);
}
