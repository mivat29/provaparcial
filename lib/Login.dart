import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_undef/home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  GlobalKey<FormState> _formId = GlobalKey<FormState>();
  String user;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formId,
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 150,
                    child: Image.asset("assets/logotipo-colorido.png")),
                campoTexto(_user),
                campoSenha(_pass),
                rememberMeCheckbox(),
                botaoRedefinir(),
                botaoLogin(_user),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget campoTexto(_user) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: _user,
          style: Theme.of(context).textTheme.headline1,
          decoration: InputDecoration(
            labelStyle: Theme.of(context).textTheme.headline3,
            hintText: 'Entre com o email',
            hintStyle: Theme.of(context).textTheme.headline3,
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
      ),
    );
  }

  Widget campoSenha(_pass) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: _pass,
          style: Theme.of(context).textTheme.headline1,
          decoration: InputDecoration(
            labelStyle: Theme.of(context).textTheme.headline3,
            hintText: 'Entre com o valor',
            hintStyle: Theme.of(context).textTheme.headline3,
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
      ),
    );
  }

  Widget botaoLogin(_user) {
    String user;
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: 150,
      height: 70,
      child: ElevatedButton(
        child: Text('Acessar'),
        onPressed: () {
          //chamar o validador dos campos de texto
          if (_formId.currentState.validate()) {
            //O método setState é utilizado todas as vezes que é
            //necessário alterar o estado do App
            setState(() {
              user = _user.text;
              //double senha = double.parse(_pass.text);
              caixaDialogo(user);
            });
          }
        },
      ),
    );
  }

  Widget botaoRedefinir() {
    return Container(
      alignment: Alignment.centerRight,
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () => print('Esqueceu sua senha'),
        padding: EdgeInsets.all(20),
        child: Text(
          'Esqueceu sua senha?',
        ),
      ),
    );
  }

  Widget rememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.blue),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text('Manter Conectado', style: TextStyle(fontFamily: 'Consolas')),
        ],
      ),
    );
  }

  caixaDialogo(user) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Deseja fazer realmente o login?',
                style: TextStyle(color: Colors.deepOrange)),
            //content: Text(msg),
            actions: [
              TextButton(
                child: Text(
                  'Sim!',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => home(user: user)));
                },
              ),
            ],
          );
        });
  }
}
