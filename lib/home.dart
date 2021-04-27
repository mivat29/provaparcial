import 'package:flutter/material.dart';
import 'package:app_undef/Ilust.dart';
import 'package:provider/provider.dart';
import 'package:app_undef/listaController.dart';

class home extends StatefulWidget {
  
  String user;

  home({this.user});

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu', style: TextStyle(color: Colors.deepOrange[400])),
        backgroundColor: Colors.grey[200],
      ),
      drawer: Container(
        color: Colors.white,
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              accountName: Text(widget.user),
              accountEmail: Text('Email'),
              currentAccountPicture: CircleAvatar(
                child: Column(
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 70, color: Colors.deepOrange,
                    )
                  ],
                ),
                backgroundColor: Colors.deepOrange[200],
              ),
            ),
            ListTile(
              title: Text('Cadastrar Ilustração'),
              onTap: () {
                Navigator.of(context).pushNamed('/Ilust');
              },
            ),
            ListTile(
              title: Text('Opções'),
              onTap: () {
                Navigator.of(context).pushNamed('/opcoes');
              },
            ),
            ListTile(
              title: Text('Sobre'),
              onTap: () {
                Navigator.of(context).pushNamed('/sobre');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange[400],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Ilust()));
        },
      ),
      body: Consumer<ListaController>(
        builder: (context, listaController, child) {
          return GridView.builder(
              padding: EdgeInsets.all(20.0),
              itemCount: listaController.nomes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (BuildContext context, i) {
                return Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.deepOrange[800],
                        Colors.deepOrange[300]])),
                  //color: Colors.deepOrange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Nome: '+ listaController.nomes[i], style: TextStyle(color: Colors.white, fontSize: 26, fontFamily: 'Consolas'),),
                      Text('Email: '+listaController.emails[i], style: TextStyle(color: Colors.white, fontSize: 14),),
                      Text('Valor: R\$ '+ listaController.valores[i], style: TextStyle(color: Colors.white, fontSize: 14),),
                      Text('Tipo de Ilustração: ' + listaController.escolhas[i], style: TextStyle(color: Colors.white, fontSize: 12))
                    ],)
                  ,
                );
              });
        },
      ),
    );
  }
}

