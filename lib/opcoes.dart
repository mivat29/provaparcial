import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class opcoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Opções',
          style: TextStyle(color: Colors.deepOrange[400]),
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(40),
        child: ListView(
          children: <Widget>[
            ListTile(
                title: Text("Link para o Repositório"),
                leading: Image.asset(
                  '/git.png',
                  width: 250,
                ),
                onTap: () =>
                    {launch('https://github.com/mivat29/provaparcial')}),
            Divider(height: 20.0),
            ListTile(
                title: Text("Siga-me no LinkedIn"),
                leading: Image.asset('/Linke.png', width: 250),
                onTap: () => {
                      launch(
                          'https://www.linkedin.com/in/ot%C3%A1vio-aaoliveira/')
                    }
            ),
            Divider(height: 20.0),
            ListTile(
                title: Text("Acesse o link da explicação do projeto"),
                leading: Image.asset('/youtube.png', width: 250),
                onTap: () => {
                      launch(
                          'https://youtu.be/bIh1ADhHnAU')
                    }
            ),
          ],
        ),
      ),
    );
  }
}
