import 'dart:collection';
import 'package:flutter/cupertino.dart';

class ListaController extends ChangeNotifier {
  List<String> names = [];
  List<String> emails = [];
  List<String> valores = [];
  List<String> escolhas = [];
  ListaController();

  UnmodifiableListView<String> get nomes => UnmodifiableListView(names);
  
  void addLista(String nome, String email, String valor, String escolha) {
    names.add(nome);
    emails.add(email);
    valores.add(valor);
    escolhas.add(escolha);
    notifyListeners();
  }
}
