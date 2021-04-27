import 'package:app_undef/Ilust.dart';
import 'package:app_undef/home.dart';
import 'package:app_undef/opcoes.dart';
import 'package:app_undef/sobre.dart';
import 'package:flutter/material.dart';
import 'package:app_undef/Login.dart';
import 'package:provider/provider.dart';
import 'package:app_undef/listaController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // 
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListaController(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bem Vindo! - A maior plataforma de sei la o que',
      //initialRoute: '/Login',
      home: Login(),
      
      routes: {
        '/Login': (context) => Login(),
        '/home': (context) => home(),
        '/sobre': (context) => sobre(),
        '/opcoes': (context) => opcoes(), 
        '/Ilust': (context) => Ilust(), 
            
      },

      //Tema
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange,
              textStyle: TextStyle(fontSize: 20, color: Colors.orange),
              elevation: 10,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(Radius.circular(30.0)),
              )
              //shape: const BeveledRectangleBorder(
              //borderRadius: BorderRadius.all(Radius.circular(5))
              //),
              ),
        ),
        fontFamily: 'Consolas', //Raleway
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20, color: Colors.black),
          headline2: TextStyle(fontSize: 36),
          headline4: TextStyle(fontSize: 18),
          headline3: TextStyle(
              fontSize: 26, color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ),
    )
    
      
  );
    
  }
}
