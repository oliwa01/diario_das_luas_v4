import 'package:diario_das_luas/pages/GeraFotos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;
import 'dart:ui';

import 'Comprar.dart';
import 'ComprarFotoGerada.dart';
import 'HomeDesktop.dart';
import 'Login.dart';



class Foto1Page extends StatefulWidget {

  String codvenda;
  String nome;
  String email;
  String dataPicket1;
  String nome1;
  double distancia1;
  int luadiadb1;
  String proximodb1;
  String signosdb1;
  String timedb1;

  Foto1Page(
      this.codvenda,
      this.nome,
      this.email,
      this.dataPicket1,
      this.nome1,
      this.distancia1,
      this.luadiadb1,
      this.proximodb1,
      this.signosdb1,
      this.timedb1,
      );
  @override
  _Foto1PageState createState() => _Foto1PageState();
}

class _Foto1PageState extends State<Foto1Page> {
  GlobalKey _containerKey = GlobalKey();
  bool loading = false;

  String _dataPicket = " ";
  String _diadataPicket = "";
  String _mesdataPicket = "";
  String _anodataPicket = "";

  String _nome;

  bool _mostraLayout = false;
  bool _mostraImagem = true;
  bool _nomealterado = false;
  bool _dataalterada = false;
  bool _diadataalterada = false;
  bool _mesdataalterada = false;
  bool _anodataalterada = false;
  bool _mostrabotaoimagem = false;

  //

  // final fs.Firestore firestore = fb.firestore();
  String _launched = "";
  String _dataDb1;
  String _datasLuaFind;
  String _timeDb1 = " ";
  String _proximoDb1 = " ";
  String _signoDb1 = " ";
  double _distanciaDb1;
  int _luadiaDb1 = 0;

  //


  _salvaDados(String datadb, String signodb, String timedb, String proximodb,
      int luadiadb, double distanciadb) {
    setState(() {
      _nome = widget.nome1;
      _dataDb1 = datadb;
      _signoDb1 = signodb;
      _timeDb1 = timedb;
      _distanciaDb1 = distanciadb;
      _luadiaDb1 = luadiadb;
      _proximoDb1 = proximodb;
    });
  }

  _geratipolua(dia)  {

    switch(dia) {
      case 0 : return("Lua Nova");break;
      case 1 : return("Lua Crescente  - 1°  Dia");break;
      case 2 : return("Lua Crescente - 2°  Dia");break;
      case 3 : return("Lua Crescente - 3°  Dia");break;
      case 4 : return("Lua Crescente - 4°  Dia");break;
      case 5 : return("Lua Crescente - 5°  Dia");break;
      case 6 : return("Lua Crescente - 6°  Dia");break;
      case 7 : return("Lua Quarto Crescente - 7°  Dia");break;
      case 8 : return("Lua Quarto Crescente - 8°  Dia");break;
      case 9 : return("Lua Quarto Crescente - 9°  Dia");break;
      case 10 : return("Lua Quarto Crescente - 10°  Dia");break;
      case 11 : return("Lua Quarto Crescente - 11°  Dia");break;
      case 12 : return("Lua Quarto Crescente - 12°  Dia");break;
      case 13 : return("Lua Quarto Crescente - 13°  Dia");break;
      case 14 : return("Lua Quarto Crescente - 14°  Dia");break;
      case 15 : return("Lua Cheia - 15°  Dia");break;
      case 16 : return("Lua Minguante Convexa - 16°  Dia");break;
      case 17 : return("Lua Minguante Convexa - 17°  Dia");break;
      case 18 : return("Lua Minguante Convexa - 18°  Dia");break;
      case 19 : return("Lua Minguante Convexa - 19°  Dia");break;
      case 20 : return("Lua Minguante Convexa - 20°  Dia");break;
      case 21 : return("Lua Minguante Convexa - 21°  Dia");break;
      case 22 : return("Lua Quarto Minguante - 22°  Dia");break;
      case 23 : return("Lua Minguante - 23°  Dia");break;
      case 24 : return("Lua Minguante - 24°  Dia");break;
      case 25 : return("Lua Minguante - 25°  Dia");break;
      case 26 : return("Lua Minguante - 26°  Dia");break;
      case 27 : return("Lua Minguante - 27°  Dia");break;
      case 28 : return("Lua Minguante - 28°  Dia");break;
      case 29 : return("Lua Minguante - 29°  Dia");break;


      default: {print("Lua");} break;
    }}
  _geratipoluz(dia)  {

    switch(dia) {
      case 0 : return("0% Iluminação");break;
      case 1 : return("Iluminação");break;
      case 2 : return("4% Iluminação");break;
      case 3 : return("8% Iluminação");break;
      case 4 : return("16% Iluminação");break;
      case 5 : return("23% Iluminação");break;
      case 6 : return("31% Iluminação");break;
      case 7 : return("50% Iluminação");break;
      case 8 : return("60% Iluminação");break;
      case 9 : return("69% Iluminação");break;
      case 10 : return("78% Iluminação");break;
      case 11 : return("88% Iluminação");break;
      case 12 : return("94% Iluminação");break;
      case 13 : return("95% Iluminação");break;
      case 14 : return("98% Iluminação");break;
      case 15 : return("100% Iluminação");break;
      case 16 : return("99% Iluminação");break;
      case 17 : return("94% Iluminação");break;
      case 18 : return("90% Iluminação");break;
      case 19 : return("81% Iluminação");break;
      case 20 : return("71% Iluminação");break;
      case 21 : return("61% Iluminação");break;
      case 22 : return("50% Iluminação");break;
      case 23 : return("40% Iluminação");break;
      case 24 : return("30% Iluminação");break;
      case 25 : return("21% Iluminação");break;
      case 26 : return("14% Iluminação");break;
      case 27 : return("8% Iluminação");break;
      case 28 : return("4% Iluminação");break;
      case 29 : return("1% Iluminação");break;


      default: {print("0% Iluminação");} break;
    }}

  _geraimage(dia)  {

    switch(dia) {
      case 0 : return("assets/images/lua-29.png"); break;
      case 1 : return("assets/images/lua-01.png"); break;
      case 2 : return("assets/images/lua-02.png"); break;
      case 3 : return("assets/images/lua-03.png"); break;
      case 4 : return("assets/images/lua-04.png"); break;
      case 5 : return("assets/images/lua-05.png"); break;
      case 6 : return("assets/images/lua-06.png"); break;
      case 7 : return("assets/images/lua-07.png"); break;
      case 8 : return("assets/images/lua-08.png"); break;
      case 9 : return("assets/images/lua-09.png"); break;
      case 10 : return("assets/images/lua-10.png"); break;
      case 11 : return("assets/images/lua-11.png"); break;
      case 12 : return("assets/images/lua-12.png"); break;
      case 13 : return("assets/images/lua-13.png"); break;
      case 14 : return("assets/images/lua-14.png"); break;
      case 15 : return("assets/images/lua-15.png"); break;
      case 16 : return("assets/images/lua-16.png"); break;
      case 17 : return("assets/images/lua-17.png"); break;
      case 18 : return("assets/images/lua-18.png"); break;
      case 19 : return("assets/images/lua-19.png"); break;
      case 20 : return("assets/images/lua-20.png"); break;
      case 21 : return("assets/images/lua-21.png"); break;
      case 22 : return("assets/images/lua-22.png"); break;
      case 23 : return("assets/images/lua-23.png"); break;
      case 24 : return("assets/images/lua-24.png"); break;
      case 25 : return("assets/images/lua-25.png"); break;
      case 26 : return("assets/images/lua-26.png"); break;
      case 27 : return("assets/images/lua-27.png"); break;
      case 28 : return("assets/images/lua-28.png"); break;
      case 29 : return("assets/images/lua-29.png"); break;
      default: {print("Invalid choice");} break;
    }
  }
  _gerasigno(signo , proximo)  {

    if ((signo == "cp") && (proximo == "I")) {return ("assets/images/cap.png");} else
    if ((signo == "cp") && (proximo == "D")) {return("assets/images/cap-aq.png");} else
    if ((signo == "aq") && (proximo == "I")) {return ("assets/images/aq.png");} else
    if ((signo == "aq") && (proximo == "D")) {return ("assets/images/aq-pe.png");}else
    if ((signo == "pi") && (proximo == "I")) {return ("assets/images/pe.png");} else
    if ((signo == "pi") && (proximo == "D")) {return("assets/images/pe-ar.png");} else
    if ((signo == "ar") && (proximo == "I")) {return ("assets/images/ar.png");} else
    if ((signo == "ar") && (proximo == "D")) {return ("assets/images/ar-to.png");}else
    if ((signo == "ta") && (proximo == "I")) {return ("assets/images/to.png");} else
    if ((signo == "ta") && (proximo == "D")) {return("assets/images/to-ge.png");} else
    if ((signo == "ge") && (proximo == "I")) {return ("assets/images/ge.png");} else
    if ((signo == "ge") && (proximo == "D")) {return ("assets/images/ge-ca.png");}else
    if ((signo == "cn") && (proximo == "I")) {return ("assets/images/ca.png");} else
    if ((signo == "cn") && (proximo == "D")) {return("assets/images/ca-le.png");} else
    if ((signo == "le") && (proximo == "I")) {return ("assets/images/le.png");} else
    if ((signo == "le") && (proximo == "D")) {return ("assets/images/le-vi.png");}else
    if ((signo == "vi") && (proximo == "I")) {return ("assets/images/vi.png");} else
    if ((signo == "vi") && (proximo == "D")) {return("assets/images/vi-li.png");} else
    if ((signo == "li") && (proximo == "I")) {return ("assets/images/li.png");} else
    if ((signo == "li") && (proximo == "D")) {return ("assets/images/li-es.png");}else
    if ((signo == "sc") && (proximo == "I")) {return ("assets/images/es.png");} else
    if ((signo == "sc") && (proximo == "D")) {return("assets/images/es-sa.png");} else
    if ((signo == "sa") && (proximo == "I")) {return ("assets/images/sa.png");} else
    if ((signo == "sa") && (proximo == "D")) {return ("assets/images/sa-ca.png");}else
    {return("images/ca.png");}
  }
  _geradatas (String data)  {

    int dia = int.parse(data.substring(6,8));
    int mes = int.parse(data.substring(4,6));
    int ano = int.parse(data.substring(0,4));

    switch(mes) {
      case 0 :
        return ("error");
        break;
      case 1 :
        return ("$dia de Janeiro de $ano");
        break;
      case 2 :
        return ("$dia de Fevereiro de $ano");
        break;
      case 3 :
        return ("$dia de Março de $ano");
        break;
      case 4 :
        return ("$dia de Abril de $ano");
        break;
      case 5 :
        return ("$dia de Maio de $ano");
        break;
      case 6 :
        return ("$dia de Junho de $ano");
        break;
      case 7 :
        return ("$dia de Julho de $ano");
        break;
      case 8 :
        return ("$dia de Agosto de $ano");
        break;
      case 9 :
        return ("$dia de Setembro de $ano");
        break;
      case 10 :
        return ("$dia de Outubro de $ano");
        break;
      case 11 :
        return ("$dia de Novembro de $ano");
        break;
      case 12 :
        return ("$dia de Dezembro de $ano");
        break;
    }
  }
  _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  //
  int _limite1 = 600;
  int _limite2 = 500;
  int _limite3 = 300;
  int _limite4 = 200;
  //
  void initState() {
    _salvaDados(widget.dataPicket1 , widget.signosdb1, widget.timedb1, widget.proximodb1,widget.luadiadb1,widget.distancia1);
    super.initState();
  }
  //

  @override

  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    double  font_adj = (widthlua > 1600) ? 34:
    (widthlua > 1500)  ?  33 :
    (widthlua > 1400)  ?  32 :
    (widthlua > 1300)  ?  31 :
    (widthlua > 1200)  ?  30 :
    (widthlua > 1100)  ?  31 :
    (widthlua > 1000)  ?  31 :
    (widthlua > 900)  ?   30:
    (widthlua > 800)  ?   29 :
    (widthlua > 700)  ?   26 :
    (widthlua > 600)  ?   23 :
    (widthlua > 500)  ?   22 :
    (widthlua > 400)  ?   20 :
    (widthlua > 300)  ?   18 :
    (widthlua > 200)  ?   17 :  16 ;
    int  luasize = (widthlua > 1200? _limite1: widthlua > 1000? _limite2 : widthlua > 800 ? _limite3 : _limite4);
    double titlesize = (widthlua > 1200? 30: widthlua > 1000? 20 : widthlua > 800 ? 16 : 14);
    _dataalterada =  ((_diadataalterada == true) && (_mesdataalterada == true) && (_anodataalterada == true)) ? true : false;
    _dataPicket =("$_anodataPicket$_mesdataPicket$_diadataPicket");
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            children: <Widget>[
        Container(
        height: heightlua * 0.90,
        child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView( // horizontal scroll widget
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView( // vertical scroll widget
        scrollDirection: Axis.vertical,
        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RepaintBoundary(
                              key: _containerKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(height:30),
                                    //
                                    //tela pronta
                                    //
                                    Container(
                                        alignment: Alignment.topCenter,
                                        child: LimitedBox(
                                            maxWidth: _mostraImagem ? luasize : 0,
                                            maxHeight: _mostraImagem ? luasize : 0,
                                            child: Container(
                                              width: _mostraImagem ? luasize : 0,
                                              height: _mostraImagem ? luasize : 0,
                                              alignment: Alignment.topCenter,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Colors.black,
                                                  image: DecorationImage(
                                                      image: new AssetImage(_luadiaDb1 == null
                                                          ? _geraimage(00)
                                                          : _geraimage(_luadiaDb1)),
                                                      fit: BoxFit.cover)),
                                            )
                                        )

                                    ),
                                    Container(
                                        height: _mostraImagem ? 150 : 0,
                                        child: Column(
                                          children: <Widget>[
                                            //
                                            // NOME
                                            //

                                            Text(_nome == null ? "" : _nome,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),),
                                            SizedBox(height: 6),
                                            //
                                            // DATA
                                            //
                                            Text(_dataDb1 == null ? "**********" : _geradatas(_dataDb1),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),),
                                            //
                                            // DISTANCIA
                                            //


                                            Text( _distanciaDb1.toString() == null ?  "Distancia :  +00.00" : "Distancia :  " + _distanciaDb1.toString()+ " Kms",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),),
                                            SizedBox(height: 5),
                                            //
                                            // SIGNO
                                            //
                                            SizedBox(
                                                width: 150,
                                                height: 25,
                                                child: Image(image: AssetImage(_gerasigno(_signoDb1, _proximoDb1)))),
//
// TIPO DE LUA
//
                                            Text( _luadiaDb1 == null ? _geratipolua(00) : _geratipolua(_luadiaDb1), textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),),
                                            //
// TIPO DE iluminação
//
                                            Text( _luadiaDb1 == null ? _geratipoluz(00) : _geratipoluz(_luadiaDb1), textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8,
                                              ),)
                                          ],
                                          //
                                        )
                                    )
                                  ])
                          ),
                          SizedBox(height: 10),
//
//botoes tela magem
//



    ])
        )
      )
      )
      ),
        Container(
                height: heightlua * 0.10,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: (_mostraImagem ? (heightlua * 0.04) : 0),
                              child: MaterialButton(
                                color: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                onPressed: () {
                                  print("Nome = "+widget.nome);
                                  print("Email = "+widget.email);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GeraFotos(widget.nome,widget.email)));
                                },
                                child: Text(
                                  "Voltar",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          SizedBox(width: heightlua * 0.02),
                          SizedBox(
                              height: (_mostraImagem ? (heightlua * 0.04) : 0),
                              child: MaterialButton(
                                color: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                onPressed: () => setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ComprarFotoGerada(
                                                  widget.codvenda,
                                                  widget.nome,
                                                  widget.email,
                                                  1)
                                      ));

                                }),
                                child: const Text('Comprar esta foto',style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ]),
                    SizedBox(height: heightlua * 0.02),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: (_mostraImagem ? (heightlua * 0.04) : 0),
                              child: MaterialButton(
                                color: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                onPressed: () {
                                  setState(() {
                                    _limite1 = _limite1 - 50;
                                    _limite2 = _limite2 - 50;
                                    _limite3 = _limite3 - 50;
                                    _limite4 = _limite4 - 50;
                                    if ((_limite1 < 0) ||(_limite2 < 0) ||(_limite3 < 0) ||(_limite4 < 0) ) {
                                      _limite1 =  50;
                                      _limite2 =  50;
                                      _limite3 =  50;
                                      _limite4 =  50;
                                    }
                                  });
                                },
                                child: Text(
                                  "ZOOM - ",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          SizedBox(width:  heightlua * 0.02),
                          SizedBox(
                              height: (_mostraImagem ? (heightlua * 0.04) : 0),
                              child: MaterialButton(
                                color: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                onPressed: () {
                                  setState(() {
                                    _limite1 = _limite1 + 50;
                                    _limite2 = _limite2 + 50;
                                    _limite3 = _limite3 + 50;
                                    _limite4 = _limite4 + 50;
                                  });
                                },
                                child: const Text('ZOOM + ',style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ]),
                  ],
                ),
          )
    ]));

  }

}
