import 'package:app_undef/listaController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Ilust extends StatefulWidget {
  int i;
  @override
  _IlustState createState() => _IlustState();
}

class _IlustState extends State<Ilust> {
  var _formIdIlus = GlobalKey<FormState>();

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _valor = TextEditingController();

  void salvar() {
    String nome;
    String email;
    String valor;

    if (_formIdIlus.currentState.validate()) {
      //O método setState é utilizado todas as vezes que é
      //necessário alterar o estado do App
      setState(() {
        nome = _name.text;
        email = _email.text;
        valor = _valor.text;

        Provider.of<ListaController>(context, listen: false)
            .addLista(nome, email, valor, opradio);
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });
    }
  }

  String opradio;
  setopradio(int value) {
    setState(() {
      if (value == 1) {
        opradio = 'Realista';
      } else if (value == 2) {
        opradio = 'Cartoon';
      } else
        opradio = 'LineArt';
    });
  }

  //função que adiciona uma ilustração na lista

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar Ilustração',
              style: TextStyle(color: Colors.deepOrange[400])),
          backgroundColor: Colors.grey[200],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 32),
            child: Form(
              key: _formIdIlus,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        //Campo Nome
                        campoNome(_name),
                        Divider(height: 10),
                        //Campo Email
                        campoEmail(_email),
                        Divider(height: 10),
                        //Campo Valor
                        campoValor(_valor),
                        Divider(height: 10),
                        Text('Selecione obrigatóriamente uma das opçoes abaixo: ', style: TextStyle(color: Colors.red),),
                        //Campo Opçoes
                        radioBtn(opradio),
                        botaoCadastro(_name, _email, _valor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget botaoCadastro(_name, _email, _valor) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            width: 150,
            height: 70,
            child: ElevatedButton(
              child: Text('Cadastrar'),
              onPressed: () {
                confirmado(_name, _email, _valor);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget campoNome(_name) {
    return Container(
      width: 400,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _name,
        style: Theme.of(context).textTheme.headline4,
        decoration: InputDecoration(
          //labelText: 'Name',
          labelStyle: Theme.of(context).textTheme.headline4,
          hintText: 'Nome',
          hintStyle: Theme.of(context).textTheme.headline4,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo vazio e tente novamente!';
          } else if (value.length < 2)
            return 'Mínimo três caracteres!';
          else {
            return null; //tudo certo com a conversão para double
          }
        },
      ),
    );
  }

  Widget campoEmail(_email) {
    return Container(
      width: 400,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _email,
        style: Theme.of(context).textTheme.headline4,
        decoration: InputDecoration(
          //labelText: rotuloEmail,
          labelStyle: Theme.of(context).textTheme.headline4,
          hintText: 'Email',
          hintStyle: Theme.of(context).textTheme.headline4,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo vazio e tente novamente!';
          } else if (value.length < 3)
            return 'Email inválido!';
          else {
            return null; //tudo certo com a conversão para double
          }
        },
      ),
    );
  }

  Widget campoValor(_valor) {
    return Container(
      width: 400,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _valor,
        style: Theme.of(context).textTheme.headline4,
        decoration: InputDecoration(
          //labelText: rotuloValor,
          labelStyle: Theme.of(context).textTheme.headline4,
          hintText: 'Valor',
          hintStyle: Theme.of(context).textTheme.headline4,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (value) {
          if (double.tryParse(value) == null) {
            return 'Verifique os dados e tente novamente!';
          } else {
            return null; //tudo certo com a conversão para double
          }
        },
      ),
    );
  }

  Widget radioBtn(opradio) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          RadioListTile(
            value: 1,
            title: Text('Realista'),
            groupValue: opradio,
            activeColor: Colors.deepOrange[400],
            onChanged: (value) {
              
              print("Radio $value");
              setopradio(value);
            },
          ),
          RadioListTile(
              value: 2,
              title: Text('Cartoon'),
              groupValue: opradio,
              activeColor: Colors.deepOrange[400],
              onChanged: (value) {
                print("Radio $value");
                setopradio(value);
              }),
          RadioListTile(
              value: 3,
              title: Text('Lineart'),
              groupValue: opradio,
              activeColor: Colors.deepOrange[400],
              onChanged: (value) {
                print("Radio $value");
                setopradio(value);
              }),
        ],
      ),
    );
  }

  confirmado(_name, _email, _valor) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Deseja confirmar o cadastro?',
                style: TextStyle(color: Colors.deepOrange)),
            actions: [
              TextButton(
                child: Text(
                  'Sim',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                ),
                onPressed: () {
                  //addItemToList();
                  print("Cadastro Confirmado!");
                  salvar();

                  //Navigator.of(context).pushNamed('/home');
                },
              ),
              TextButton(
                child: Text(
                  'Não',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  listaController({String nome}) {}
}
