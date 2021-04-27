import 'package:flutter/material.dart';


class sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre', style: TextStyle(color: Colors.deepOrange[400])),
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('/perfil.jpeg'),
              radius: 70,
            ),
            Divider(height: 60.0),
            Text("Otávio Augusto Amorim de Oliveira",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              decorationStyle: TextDecorationStyle.dashed,           
            ),
            ),
            Divider(height: 60.0),
            Text("Esse aplicativo tem como objetivo ajudar a organizar e gerenciar pedidos de ilustrações, assim como armazenar informações como: Tema do Desenho, Custo, Dados do cliente, entre outros.",
            style: TextStyle(
              
              color: Colors.orange,
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              //decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              decorationStyle: TextDecorationStyle.dashed,
              
            ),
            )
          ],
        ),
      ),
    );
  }
}