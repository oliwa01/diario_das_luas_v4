import 'package:diario_das_luas/pages/LoginFotos.dart';
import 'package:diario_das_luas/pages/page1desktop.dart';
import 'package:diario_das_luas/pages/page2desktop.dart';
import 'package:diario_das_luas/pages/page3desktop.dart';
import 'package:diario_das_luas/pages/page4desktop.dart';
import 'package:diario_das_luas/pages/page5desktop.dart';
import 'package:diario_das_luas/pages/page6desktop.dart';
import 'package:diario_das_luas/pages/principal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'GeraFotos.dart';
import 'HomeDesktop.dart';

class SimuleDesktop extends StatefulWidget {
  String nome;
  String email;
  SimuleDesktop(this.nome,this.email);

  @override
  _SimuleDesktopState createState() => _SimuleDesktopState();
}

class _SimuleDesktopState extends State<SimuleDesktop> {


  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    double  font_adj = (widthlua > 1600) ? 30 :
    (widthlua > 1500)  ?  29 :
    (widthlua > 1400)  ?  28 :
    (widthlua > 1300)  ?  27 :
    (widthlua > 1200)  ?  26 :
    (widthlua > 1100)  ?  25 :
    (widthlua > 1000)  ?  24 :
    (widthlua > 900)  ?   23:
    (widthlua > 800)  ?   22 :
    (widthlua > 700)  ?   21 :
    (widthlua > 600)  ?   18 :
    (widthlua > 500)  ?   17 :
    (widthlua > 400)  ?   16 :
    (widthlua > 300)  ?   15:
    (widthlua > 200)  ?   12 :  11 ;


    double  boxnome       = (widthlua /3);
    double  boxnomeh      = (heightlua / 5);
    double  boxnomec       = (widthlua - 100);
    double  boxnomehc      = (heightlua / 4);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: (Image.asset("assets/images/logo.png",
                width: 160, height: 100)),
            //  title: (Text("W :$widthlua  H : $heightlua S: $distanciasize", style: TextStyle(fontSize: 20))),
            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Principal(widget.nome,widget.email)));
                },
                child:  Image.asset( "assets/images/iconseta.png",
                  width: 12, height: 12
                  , // add custom icons also
                ))),
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
                          width: widthlua * 0.8,
                          height: heightlua * 0.15,
                          child: Text("Escolha o número de participantes na foto e informe \nnome e data de nascimento,\ne no caso de mais de uma pessoa,\n o nome da família.",textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: font_adj)
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
                    ])
                          ,
                //
                //
                    SizedBox(height: heightlua / 60),
                //
                //
                widthlua > 800 ?
                Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    SizedBox(width:boxnome , height: boxnomeh,child: RaisedButton( child: Image.asset("assets/images/f3.jpg"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page3Desktop(widget.nome,widget.email)));
                      },
                    )),
                        SizedBox(width: heightlua/40),
                    SizedBox(width:boxnome , height: boxnomeh,child: RaisedButton( child: Image.asset("assets/images/f4.jpg"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page4Desktop(widget.nome,widget.email)));
                      },
                    ))])
                //
                    :
                //
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width:boxnomec , height: boxnomehc,child: RaisedButton( child: Image.asset("assets/images/f3.jpg"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page3Desktop(widget.nome,widget.email)));
                        },
                      )),
                      SizedBox(height: heightlua / 60),
                      SizedBox(width:boxnomec , height: boxnomehc,child: RaisedButton( child: Image.asset("assets/images/f4.jpg"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page4Desktop(widget.nome,widget.email)));
                        },
                      ))]),

                          SizedBox(height: heightlua / 60),
                //
                //
                //
                widthlua > 800 ?
                Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    SizedBox(width:boxnome , height: boxnomeh,child: RaisedButton( child: Image.asset("assets/images/f5.jpg"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page5Desktop(widget.nome,widget.email)));
                      },
                    )),
                      SizedBox(width: heightlua/40),
                    SizedBox(width:boxnome , height: boxnomeh,child: RaisedButton( child: Image.asset("assets/images/f6.jpg"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page6Desktop(widget.nome,widget.email)));
                      },
                    ))])
                 :
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width:boxnomec , height: boxnomehc,child: RaisedButton( child: Image.asset("assets/images/f5.jpg"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page5Desktop(widget.nome,widget.email)));
                        },
                      )),
                      SizedBox(height: heightlua / 60),
                      SizedBox(width:boxnomec , height: boxnomehc , child: RaisedButton( child: Image.asset("assets/images/f6.jpg"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page6Desktop(widget.nome,widget.email)));
                        },
                      ))
                    ])
                        ]),
                  SizedBox(height: heightlua / 60),

                  //
                  //
                  // BOTÕES
                  //
                  //


                ],
              )),
            )
        )
    )
    );
  }
}
