import 'package:diario_das_luas/email/geraemail.dart';
import 'package:diario_das_luas/pages/Comprar.dart';
import 'package:diario_das_luas/pages/Entrada.dart';
import 'package:diario_das_luas/pages/GeraFotos.dart';
import 'package:diario_das_luas/pages/HomeDesktop.dart';
import 'package:diario_das_luas/pages/Login.dart';
import 'package:diario_das_luas/pages/SimuleDesktop.dart';
import 'package:diario_das_luas/pages/TransitoConstelacao.dart';
import 'package:diario_das_luas/pages/constelacoes.dart';
import 'package:diario_das_luas/pages/page1desktop.dart';
import 'package:diario_das_luas/pages/page2desktop.dart';
import 'package:diario_das_luas/pages/page3desktop.dart';
import 'package:diario_das_luas/pages/page4desktop.dart';
import 'package:diario_das_luas/pages/page5desktop.dart';
import 'package:diario_das_luas/pages/page6desktop.dart';
import 'package:diario_das_luas/pages/principal.dart';
import 'package:diario_das_luas/pages/social.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'No Mundo das Luas',
      initialRoute: "/",
      routes: {

        "/Login"           : (context) => Login("","",1,"","","","","","","","","","","","","",0.0,0.0,0.0,0.0,0.0,0.0,0,0,0,0,0,0,"","","","","","","","","","","","","","","","","",""),
        "/compras"           : (context) => Comprar("","",1,"","","","","","","","","","","","","",0.0,0.0,0.0,0.0,0.0,0.0,0,0,0,0,0,0,"","","","","","","","","","","","","","","","","",""),
        "/SimulateDesktop": (context) => SimuleDesktop(" "," "),
        "/social": (context) => social(title: 'Firebase Authentication.'),
        "/P1D": (context) => Page1Desktop("",""),
        "/P2D": (context) => Page2Desktop("",""),
        "/P3D": (context) => Page3Desktop("",""),
        "/P4D": (context) => Page4Desktop("",""),
        "/P5D": (context) => Page5Desktop("",""),
        "/P6D": (context) => Page6Desktop("",""),

      },
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
     home: HomeDesktop(),
   //  home:geraemail(),
      //home: Constelacoes("walter","walter@wop.com.br"),
      //home: TransitoContelacoes("walter","walter@wop.com.br","ar","to"),
 //     home: Page1Desktop("walter","walter@wop.com.br"),
      //home: SimuleDesktop("user","@ANONIMO"),
      //home: Principal("walter","walter@wop.com.br"),
      //home: GeraFotos("walter","walter@wop.com.br"),
     // home: HomeDesktop(),
      //home: GeraNovasLuas2(),
/*
      home: Comprar("walter","walter@wop.com.br",1,
          "","19200101","",
          "",
          "",
          "",
          "",
          "xxxxx",
          "",
          "",
          "",
          "",
          "",
          361915.85,
          0.0,
          0.0,
          0.0,
          0.0,
          0.0,
          15,
          0,
          0,
          0,
          0,
          0,
          "D",
          "",
          "",
          "",
          "",
          "",
          "pi",
          "",
          "",
          "",
          "",
          "",
          "23:23",
          "",
          "",
          "",
          "",
          ""),
      //home: MainScreen("","@ANONIMO")*/
       );
  }
}

