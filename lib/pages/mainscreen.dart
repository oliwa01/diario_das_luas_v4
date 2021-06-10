import 'package:diario_das_luas/pages/LoginFotos.dart';
import 'package:diario_das_luas/pages/page1desktop.dart';
import 'package:diario_das_luas/pages/page2desktop.dart';
import 'package:diario_das_luas/pages/page3desktop.dart';
import 'package:diario_das_luas/pages/page4desktop.dart';
import 'package:diario_das_luas/pages/page5desktop.dart';
import 'package:diario_das_luas/pages/page6desktop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'GeraFotos.dart';
import 'HomeDesktop.dart';

class MainScreen extends StatefulWidget {
  String nome;
  String email;
  MainScreen(this.nome,this.email);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;



    double  boxnome       = (widthlua /3);
    double  boxnomeh      = (heightlua / 5);
    double  boxnomec       = (widthlua - 100);
    double  boxnomehc      = (heightlua / 4);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                children: <Widget>[
                  SizedBox(height: heightlua/25),
                  Container(
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: (heightlua / 20),
                          child: Text("No Mundo das Luas",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: (widthlua / 50))
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: heightlua/60),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                //
                //
                widthlua > 800 ?
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    SizedBox(width:boxnome , height: boxnomeh,child: RaisedButton( child: Image.asset("assets/images/f1.jpg"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page1Desktop(widget.nome,widget.email)));
                      },
                    )),
                    SizedBox(width: heightlua/40),
                    SizedBox(width:boxnome , height: boxnomeh,child: RaisedButton( child: Image.asset("assets/images/f2.jpg"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page2Desktop(widget.nome,widget.email)));
                      },
                    ))
                    ])
                 //
                    :
                 //
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width:boxnomec , height: boxnomehc,child: RaisedButton( child: Image.asset("assets/images/f1.jpg"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page1Desktop(widget.nome,widget.email)));
                        },
                      )),
                      SizedBox(height: heightlua / 60),
                      SizedBox(width:boxnomec , height: boxnomehc,child: RaisedButton( child: Image.asset("assets/images/f2.jpg"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page2Desktop(widget.nome,widget.email)));
                        },
                      ))
                    ]),

                  SizedBox(height: heightlua / 60),

                  //
                  //
                  // BOTÕES
                  //
                  //
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        widget.email == "@ANONIMO" ?
                        SizedBox(
                            width: widthlua * 0.20,
                            height: (heightlua /20),
                            child: MaterialButton(
                              color: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginFotos(widget.nome,widget.email)));
                              },
                              child: const Text('Fotos Salvas',style: TextStyle(color: Colors.white),
                              ),
                            )):
                        SizedBox(
                          width: widthlua * 0.20,
                            height: (heightlua /20),
                            child: MaterialButton(
                              color: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0))),
                              onPressed: () {
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GeraFotos(widget.nome,widget.email)));
                                },
                              child: const Text('Fotos Salvas',style: TextStyle(color: Colors.white),
                              ),
                            ))


                      ]),

                ],
              )]),
            )
        )
    )
    ));
  }
}
