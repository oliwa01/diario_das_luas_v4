import 'package:diario_das_luas/pages/SimuleDesktop.dart';
import 'package:diario_das_luas/pages/principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'Foto1Page.dart';
import 'Foto2Page.dart';
import 'Foto3Page.dart';
import 'Foto4Page.dart';
import 'Foto5Page.dart';
import 'Foto6Page.dart';
import 'HomeDesktop.dart';





class GeraFotos extends StatefulWidget {
  String nome;
  String email;
  GeraFotos(this.nome,this.email);
  @override
  _GeraFotosState createState() => _GeraFotosState();
}

class _GeraFotosState extends State<GeraFotos>  {
  AnimationController controller;


  BorderRadiusGeometry _bR = BorderRadius.circular(8);

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("No Mundo das Luas - Fotos Salvas"),
                  leading: GestureDetector(
                           onTap: () {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => Principal(widget.nome,widget.email)));
                              },
                                  child: Icon(
                                  Icons.arrow_back, size: 30,  // add custom icons also
                                  )),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xFF000000),
                              Color(0XFF000000),
                            ])
                    ),
                  ),
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(icon: Icon(Icons.show_chart, color: Colors.white,size: 40.0)),
                      Tab(icon: Icon(Icons.group,color: Colors.white, size: 40.0))
                    ],
                  ),

                ),

                  body: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListPage(widget.nome,widget.email),
                                ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Em Breve")
                    )
                  ]
                  )
            )
        )
    );

                    //
                    //


  }}
class ListPage extends StatefulWidget {
  String email;
  String nome;
  ListPage(this.nome,this.email);
  @override
  _ListPageState createState() => _ListPageState();
}
//
//
//
class _ListPageState extends State<ListPage> {
  //
  Future getPosts() async {
    int currentTime;
    var db = Firestore.instance;
    QuerySnapshot qn = await
    db.collection("usuarios")
        .document(widget.email)
        .collection("fotos")
        .getDocuments();
    return qn.documents;
  }


  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;

    return Container(
        child: FutureBuilder(
            future: getPosts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loadding ......"),
                );
              }
              else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return Container(
                          padding: EdgeInsets.all(20),
                          width: 200,
                          height: 100,
                          color: Colors.black,

                          child: ListTile(
                              leading:
                                  (snapshot.data[index].data["numberPicture"] == 1) ? Image.asset("assets/images/icone1.png",width: 60 ,height: 20) :
                                  (snapshot.data[index].data["numberPicture"] == 2) ? Image.asset("assets/images/icone2.png",width: 60 ,height: 20) :
                                  (snapshot.data[index].data["numberPicture"] == 3) ? Image.asset("assets/images/icone3.png",width: 60 ,height: 20) :
                                  (snapshot.data[index].data["numberPicture"] == 4) ? Image.asset("assets/images/icone4.png",width: 60 ,height: 20) :
                                  (snapshot.data[index].data["numberPicture"] == 5) ? Image.asset("assets/images/icone5.png",width: 60 ,height: 20) :
                                  (snapshot.data[index].data["numberPicture"] == 6) ? Image.asset("assets/images/icone6.png",width: 60 ,height: 20) :
                                  Icon(FontAwesomeIcons.dice,color: Colors.deepOrange),
                              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              title:
                              (snapshot.data[index].data["numberPicture"] == 1) ?
                              Text(" Codigo : " + (snapshot.data[index].data['codVenda']) + " -  Nome Foto : " + (snapshot.data[index].data['nome1']),
                                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)) :
                              (snapshot.data[index].data["numberPicture"] == 2) ?
                              Text(" Codigo : " + (snapshot.data[index].data['codVenda'])+
                                  " -  Nome Família : " + (snapshot.data[index].data['nomefamilia']) +
                                  " -  Nome Foto-1 : " + (snapshot.data[index].data['nome1']) +
                                  " -  Nome Foto-2 : " + (snapshot.data[index].data['nome2']),
                                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)) :
                              (snapshot.data[index].data["numberPicture"] == 3) ?
                              Text(" Codigo : " + (snapshot.data[index].data['codVenda'])+
                                  " -  Nome Família : " + (snapshot.data[index].data['nomefamilia']) +
                                  " -  Nome Foto-1 : " + (snapshot.data[index].data['nome1']) +
                                  " -  Nome Foto-2 : " + (snapshot.data[index].data['nome2']) +
                                  " -  Nome Foto-3 : " + (snapshot.data[index].data['nome3']),
                                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)) :
                                (snapshot.data[index].data["numberPicture"] == 4) ?
                              Text(" Codigo : " + (snapshot.data[index].data['codVenda'])+
                                  " -  Nome Família : " + (snapshot.data[index].data['nomefamilia']) +
                                  " -  Nome Foto-1 : " + (snapshot.data[index].data['nome1']) +
                                  " -  Nome Foto-2 : " + (snapshot.data[index].data['nome2']) +
                                  " -  Nome Foto-3 : " + (snapshot.data[index].data['nome3']) +"\n"+
                                  "                                                       Nome Foto-4 : " + (snapshot.data[index].data['nome4']),
                                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)) :
                                (snapshot.data[index].data["numberPicture"] == 5) ?
                              Text(" Codigo : " + (snapshot.data[index].data['codVenda'])+
                                  " -  Nome Família : " + (snapshot.data[index].data['nomefamilia']) +
                                  " -  Nome Foto-1 : " + (snapshot.data[index].data['nome1']) +
                                  " -  Nome Foto-2 : " + (snapshot.data[index].data['nome2']) +
                                  " -  Nome Foto-3 : " + (snapshot.data[index].data['nome3']) +"\n"+
                                  "                                                       Nome Foto-4 : " + (snapshot.data[index].data['nome4']) +
                                  " Nome Foto-5 : " + (snapshot.data[index].data['nome5']),
                                    style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)):

                              Text(" Codigo : " + (snapshot.data[index].data['codVenda'])+
                                  " -  Nome Família : " + (snapshot.data[index].data['nomefamilia']) +
                                  " -  Nome Foto-1 : " + (snapshot.data[index].data['nome1'])+
                                  " -  Nome Foto-2 : " + (snapshot.data[index].data['nome2']) +
                                  " -  Nome Foto-3 : " + (snapshot.data[index].data['nome3']) +
                                  "                                                       Nome Foto-4 : " + (snapshot.data[index].data['nome4']) +
                                  " Nome Foto-5 : " + (snapshot.data[index].data['nome5']) +
                                  " Nome Foto-6 : " + (snapshot.data[index].data['nome6']),
                                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold))
                              ,
                              subtitle: Text(snapshot.data[index].data["codVenda"] ),
                              onTap: () {
//

                                if (snapshot.data[index].data["numberPicture"] == 1)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Foto1Page(
                                                  (snapshot.data[index]
                                                      .data["codVenda"]),
                                                widget.nome,
                                                  widget.email,
                                                  (snapshot.data[index]
                                                      .data["dataPicket1"]),
                                                  (snapshot.data[index]
                                                      .data["nome1"]),
                                                  (snapshot.data[index]
                                                      .data["distanciadb1"]),
                                                  (snapshot.data[index]
                                                      .data["luadiadb1"]),
                                                  (snapshot.data[index]
                                                      .data["proximodb1"]),
                                                  (snapshot.data[index]
                                                      .data["signo1"]),
                                                  (snapshot.data[index]
                                                      .data["timedb1"]))
                                      ));
                                }
                                else if (snapshot.data[index].data["numberPicture"] == 2)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Foto2Page(
                                                  (snapshot.data[index].data["codVenda"]),
                                                  widget.nome,
                                                  widget.email,
                                                  (snapshot.data[index].data["dataPicket1"]),
                                                  (snapshot.data[index].data["nome1"]),
                                                  (snapshot.data[index].data["distanciadb1"]),
                                                  (snapshot.data[index].data["luadiadb1"]),
                                                  (snapshot.data[index].data["proximodb1"]),
                                                  (snapshot.data[index].data["signo1"]),
                                                  (snapshot.data[index].data["timedb1"]),
                                                  (snapshot.data[index].data["dataPicket2"]),
                                                  (snapshot.data[index].data["nome2"]),
                                                  (snapshot.data[index].data["distanciadb2"]),
                                                  (snapshot.data[index].data["luadiadb2"]),
                                                  (snapshot.data[index].data["proximodb2"]),
                                                  (snapshot.data[index].data["signo2"]),
                                                  (snapshot.data[index].data["timedb2"])
                                              )
                                      ));
                                }
                                else if (snapshot.data[index].data["numberPicture"] == 3)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Foto3Page(
                                                  (snapshot.data[index].data["codVenda"]),
                                                  "",
                                                  widget.email,
                                                  (snapshot.data[index].data["dataPicket1"]),
                                                  (snapshot.data[index].data["nome1"]),
                                                  (snapshot.data[index].data["distanciadb1"]),
                                                  (snapshot.data[index].data["luadiadb1"]),
                                                  (snapshot.data[index].data["proximodb1"]),
                                                  (snapshot.data[index].data["signo1"]),
                                                  (snapshot.data[index].data["timedb1"]),
                                                  (snapshot.data[index].data["dataPicket2"]),
                                                  (snapshot.data[index].data["nome2"]),
                                                  (snapshot.data[index].data["distanciadb2"]),
                                                  (snapshot.data[index].data["luadiadb2"]),
                                                  (snapshot.data[index].data["proximodb2"]),
                                                  (snapshot.data[index].data["signo2"]),
                                                  (snapshot.data[index].data["timedb2"]),
                                                  (snapshot.data[index].data["dataPicket3"]),
                                                  (snapshot.data[index].data["nome3"]),
                                                  (snapshot.data[index].data["distanciadb3"]),
                                                  (snapshot.data[index].data["luadiadb3"]),
                                                  (snapshot.data[index].data["proximodb3"]),
                                                  (snapshot.data[index].data["signo3"]),
                                                  (snapshot.data[index].data["timedb3"])
                                              )
                                      ));
                                }
                                else if (snapshot.data[index].data["numberPicture"] == 4)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Foto4Page(
                                                  (snapshot.data[index].data["codVenda"]),
                                                  "",
                                                  widget.email,
                                                  (snapshot.data[index].data["dataPicket1"]),
                                                  (snapshot.data[index].data["nome1"]),
                                                  (snapshot.data[index].data["distanciadb1"]),
                                                  (snapshot.data[index].data["luadiadb1"]),
                                                  (snapshot.data[index].data["proximodb1"]),
                                                  (snapshot.data[index].data["signo1"]),
                                                  (snapshot.data[index].data["timedb1"]),
                                                  (snapshot.data[index].data["dataPicket2"]),
                                                  (snapshot.data[index].data["nome2"]),
                                                  (snapshot.data[index].data["distanciadb2"]),
                                                  (snapshot.data[index].data["luadiadb2"]),
                                                  (snapshot.data[index].data["proximodb2"]),
                                                  (snapshot.data[index].data["signo2"]),
                                                  (snapshot.data[index].data["timedb2"]),
                                                  (snapshot.data[index].data["dataPicket3"]),
                                                  (snapshot.data[index].data["nome3"]),
                                                  (snapshot.data[index].data["distanciadb3"]),
                                                  (snapshot.data[index].data["luadiadb3"]),
                                                  (snapshot.data[index].data["proximodb3"]),
                                                  (snapshot.data[index].data["signo3"]),
                                                  (snapshot.data[index].data["timedb3"]),
                                                  (snapshot.data[index].data["dataPicket4"]),
                                                  (snapshot.data[index].data["nome4"]),
                                                  (snapshot.data[index].data["distanciadb4"]),
                                                  (snapshot.data[index].data["luadiadb4"]),
                                                  (snapshot.data[index].data["proximodb4"]),
                                                  (snapshot.data[index].data["signo4"]),
                                                  (snapshot.data[index].data["timedb4"])
                                              )
                                      ));
                                }
                                else if (snapshot.data[index].data["numberPicture"] == 5)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Foto5Page(
                                                  (snapshot.data[index].data["codVenda"]),
                                                  "",
                                                  widget.email,
                                                  (snapshot.data[index].data["dataPicket1"]),
                                                  (snapshot.data[index].data["nome1"]),
                                                  (snapshot.data[index].data["distanciadb1"]),
                                                  (snapshot.data[index].data["luadiadb1"]),
                                                  (snapshot.data[index].data["proximodb1"]),
                                                  (snapshot.data[index].data["signo1"]),
                                                  (snapshot.data[index].data["timedb1"]),
                                                  (snapshot.data[index].data["dataPicket2"]),
                                                  (snapshot.data[index].data["nome2"]),
                                                  (snapshot.data[index].data["distanciadb2"]),
                                                  (snapshot.data[index].data["luadiadb2"]),
                                                  (snapshot.data[index].data["proximodb2"]),
                                                  (snapshot.data[index].data["signo2"]),
                                                  (snapshot.data[index].data["timedb2"]),
                                                  (snapshot.data[index].data["dataPicket3"]),
                                                  (snapshot.data[index].data["nome3"]),
                                                  (snapshot.data[index].data["distanciadb3"]),
                                                  (snapshot.data[index].data["luadiadb3"]),
                                                  (snapshot.data[index].data["proximodb3"]),
                                                  (snapshot.data[index].data["signo3"]),
                                                  (snapshot.data[index].data["timedb3"]),
                                                  (snapshot.data[index].data["dataPicket4"]),
                                                  (snapshot.data[index].data["nome4"]),
                                                  (snapshot.data[index].data["distanciadb4"]),
                                                  (snapshot.data[index].data["luadiadb4"]),
                                                  (snapshot.data[index].data["proximodb4"]),
                                                  (snapshot.data[index].data["signo4"]),
                                                  (snapshot.data[index].data["timedb4"]),
                                                  (snapshot.data[index].data["dataPicket5"]),
                                                  (snapshot.data[index].data["nome5"]),
                                                  (snapshot.data[index].data["distanciadb5"]),
                                                  (snapshot.data[index].data["luadiadb5"]),
                                                  (snapshot.data[index].data["proximodb5"]),
                                                  (snapshot.data[index].data["signo5"]),
                                                  (snapshot.data[index].data["timedb5"])
                                              )
                                      ));
                                }
                                else if (snapshot.data[index].data["numberPicture"] == 6)
                                {
                                   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Foto6Page(
                                                  (snapshot.data[index].data["codVenda"]),
                                                  "",
                                                  widget.email,
                                                  (snapshot.data[index].data["dataPicket1"]),
                                                  (snapshot.data[index].data["nome1"]),
                                                  (snapshot.data[index].data["distanciadb1"]),
                                                  (snapshot.data[index].data["luadiadb1"]),
                                                  (snapshot.data[index].data["proximodb1"]),
                                                  (snapshot.data[index].data["signo1"]),
                                                  (snapshot.data[index].data["timedb1"]),
                                                  (snapshot.data[index].data["dataPicket2"]),
                                                  (snapshot.data[index].data["nome2"]),
                                                  (snapshot.data[index].data["distanciadb2"]),
                                                  (snapshot.data[index].data["luadiadb2"]),
                                                  (snapshot.data[index].data["proximodb2"]),
                                                  (snapshot.data[index].data["signo2"]),
                                                  (snapshot.data[index].data["timedb2"]),
                                                  (snapshot.data[index].data["dataPicket3"]),
                                                  (snapshot.data[index].data["nome3"]),
                                                  (snapshot.data[index].data["distanciadb3"]),
                                                  (snapshot.data[index].data["luadiadb3"]),
                                                  (snapshot.data[index].data["proximodb3"]),
                                                  (snapshot.data[index].data["signo3"]),
                                                  (snapshot.data[index].data["timedb3"]),
                                                  (snapshot.data[index].data["dataPicket4"]),
                                                  (snapshot.data[index].data["nome4"]),
                                                  (snapshot.data[index].data["distanciadb4"]),
                                                  (snapshot.data[index].data["luadiadb4"]),
                                                  (snapshot.data[index].data["proximodb4"]),
                                                  (snapshot.data[index].data["signo4"]),
                                                  (snapshot.data[index].data["timedb4"]),
                                                  (snapshot.data[index].data["dataPicket5"]),
                                                  (snapshot.data[index].data["nome5"]),
                                                  (snapshot.data[index].data["distanciadb5"]),
                                                  (snapshot.data[index].data["luadiadb5"]),
                                                  (snapshot.data[index].data["proximodb5"]),
                                                  (snapshot.data[index].data["signo5"]),
                                                  (snapshot.data[index].data["timedb5"]),
                                                  (snapshot.data[index].data["dataPicket6"]),
                                                  (snapshot.data[index].data["nome6"]),
                                                  (snapshot.data[index].data["distanciadb6"]),
                                                  (snapshot.data[index].data["luadiadb6"]),
                                                  (snapshot.data[index].data["proximodb6"]),
                                                  (snapshot.data[index].data["signo6"]),
                                                  (snapshot.data[index].data["timedb6"])
                                              )
                                      ));
                                }
                              }
                          )
                      );

                    }

                );
              }
            }
        )
    );
  }
}
//
class DetailPage extends StatefulWidget {

  final DocumentSnapshot post;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(widget.post.data["codVenda"]),
          subtitle: Text(widget.post.data["email"]),

        ),
      ),
    );
  }
}
