import 'package:flutter/material.dart';

class Tarefa {

  late String nome;
  late DateTime data;
  late ValueNotifier<bool> concluida;

  Tarefa(String nome) {
    this.nome = nome;
    this.concluida = ValueNotifier<bool>(false);
    this.data = DateTime.now();
  }
}
