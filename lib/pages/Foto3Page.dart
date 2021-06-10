import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;
import 'dart:ui';


import 'ComprarFotoGerada.dart';
import 'GeraFotos.dart';
import 'HomeDesktop.dart';
import 'Login.dart';


class Foto3Page extends StatefulWidget {
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
  String dataPicket2;
  String nome2;
  double distancia2;
  int luadiadb2;
  String proximodb2;
  String signosdb2;
  String timedb2;
  String dataPicket3;
  String nome3;
  double distancia3;
  int luadiadb3;
  String proximodb3;
  String signosdb3;
  String timedb3;

  Foto3Page(
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
      this.dataPicket2,
      this.nome2,
      this.distancia2,
      this.luadiadb2,
      this.proximodb2,
      this.signosdb2,
      this.timedb2,
      this.dataPicket3,
      this.nome3,
      this.distancia3,
      this.luadiadb3,
      this.proximodb3,
      this.signosdb3,
      this.timedb3
      );
  @override
  _Foto3PageState createState() => _Foto3PageState();
}

class _Foto3PageState extends State<Foto3Page> {
  GlobalKey _containerKey = GlobalKey();
  bool loading = false;

  String _dataPicket = " ";
  String _diadataPicket = "";
  String _mesdataPicket = "";
  String _anodataPicket = "";
  String _dataPicket2 = " ";
  String _diadataPicket2 = "";
  String _mesdataPicket2 = "";
  String _anodataPicket2 = "";
  String _dataPicket3 = " ";
  String _diadataPicket3 = "";
  String _mesdataPicket3 = "";
  String _anodataPicket3 = "";



  String _dataPicket_tela = "";
  String _dataPicket2_tela = "";
  String _dataPicket3_tela = "";

  String _nome;
  String _nome2;
  String _nome3;

  String _nomefamilia;
  bool _nomefamiliaalterado = false;

  bool _nomealterado = false;
  bool _dataalterada = false;
  bool _nomealterado2 = false;
  bool _dataalterada2 = false;
  bool _nomealterado3 = false;
  bool _dataalterada3 = false;

//
  bool _diadataalterada = false;
  bool _mesdataalterada = false;
  bool _anodataalterada = false;

  bool _diadataalterada2 = false;
  bool _mesdataalterada2 = false;
  bool _anodataalterada2 = false;

  bool _diadataalterada3 = false;
  bool _mesdataalterada3 = false;
  bool _anodataalterada3 = false;
  //
  bool _mostraLayout = false;
  bool _mostraImagem = true;



  bool _mostrabotaoimagem = false;

  //

  String _launched = "";
  String _dataDb1;
  String _datasLuaFind;
  String _timeDb1 = " ";
  String _proximoDb1 = " ";
  String _signoDb1 = " ";
  double _distanciaDb1;
  int _luadiaDb1 = 0;

  String _launched2 = "";
  String _dataDb2;
  String _datasLuaFind2;
  String _timeDb2 = " ";
  String _proximoDb2 = " ";
  String _signoDb2 = " ";
  double _distanciaDb2;
  int _luadiaDb2 = 0;



  String _launched3 = "";
  String _dataDb3;
  String _datasLuaFind3;
  String _timeDb3 = " ";
  String _proximoDb3 = " ";
  String _signoDb3 = " ";
  double _distanciaDb3;
  int _luadiaDb3 = 0;
//
  int _limite1 = 600;
  int _limite2 = 500;
  int _limite3 = 300;
  int _limite4 = 200;
//
  Future<void>_geraDados () async {
    setState(() {
      _nome = widget.nome1;
      _dataDb1 = widget.dataPicket1;
      _signoDb1 = widget.signosdb1;
      _timeDb1 = widget.timedb1;
      _distanciaDb1 = widget.distancia1;
      _luadiaDb1 = widget.luadiadb1;
      _proximoDb1 = widget.proximodb1;
      _nome2 = widget.nome2;
      _dataDb2 = widget.dataPicket2;
      _signoDb2 = widget.signosdb2;
      _timeDb2 = widget.timedb2;
      _distanciaDb2 = widget.distancia2;
      _luadiaDb2 = widget.luadiadb2;
      _proximoDb2 = widget.proximodb2;
      _nome3 = widget.nome3;
      _dataDb3 = widget.dataPicket3;
      _signoDb3 = widget.signosdb3;
      _timeDb3 = widget.timedb3;
      _distanciaDb3 = widget.distancia3;
      _luadiaDb3 = widget.luadiadb3;
      _proximoDb3 = widget.proximodb3;
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
  //

  //
  void initState() {
    _geraDados();
  }

  @override

  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    widthlua < 800 ? SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]) : SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    int  luasize = (widthlua > 1200? _limite1: widthlua > 1000? _limite2 : widthlua > 800 ? _limite3 : _limite4);
      double  datasize      = 15;
    double  tipoluasize   = 15;
    double  distanciasize = 12;
    double  signowsize    = 150;
    double  signohsize    = 25;
    double  tipoluzsize   =10;
    double  boxnomesize   = 140;
    double  nomesize      = 20;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
        children: <Widget>[
//corpo
        Container(
          height: heightlua * 0.90,
        child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView( // horizontal scroll widget
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView( // vertical scroll widget
        scrollDirection: Axis.vertical,
        child:
        Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RepaintBoundary(
                              key: _containerKey,
                              child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height:10),
                                          //
                                          //tela  esquerda
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
                                                            fit: BoxFit.fill)),
                                                  )
                                              )

                                          ),
                                          Container(
                                              height: _mostraImagem ? boxnomesize : 0,
                                              child: Column(
                                                children: <Widget>[
                                                  //
                                                  // NOME
                                                  //

                                                  Text(_nome == null ? "" : _nome,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: nomesize,
                                                    ),),
                                                  SizedBox(height: 6),
                                                  //
                                                  // DATA
                                                  //
                                                  Text(_dataDb1 == null ? "**********" : _geradatas(_dataDb1),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: datasize,
                                                    ),),
                                                  //
                                                  // DISTANCIA
                                                  //


                                                  Text( _distanciaDb1.toString() == null ?  "Distancia :  +00.00" : "Distancia :  " + _distanciaDb1.toString()+ " Kms",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: distanciasize
                                                    ),),
                                                  SizedBox(height: 5),
                                                  //
                                                  // SIGNO
                                                  //
                                                  SizedBox(
                                                      width: signowsize,
                                                      height: signohsize,
                                                      child: Image(image: AssetImage(_gerasigno(_signoDb1, _proximoDb1)))),
//
// TIPO DE LUA
//
                                                  Text( _luadiaDb1 == null ? _geratipolua(00) : _geratipolua(_luadiaDb1), textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: tipoluasize,
                                                    ),),
                                                  //
// TIPO DE iluminação
//
                                                  Text( _luadiaDb1 == null ? _geratipoluz(00) : _geratipoluz(_luadiaDb1), textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: tipoluzsize,
                                                    ),)
                                                ],
                                                //
                                              )
                                          )
                                        ]),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height:10),
                                          //
                                          //tela centro
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
                                                            image: new AssetImage(_luadiaDb2 == null
                                                                ? _geraimage(00)
                                                                : _geraimage(_luadiaDb2)),
                                                            fit: BoxFit.fill)),
                                                  )
                                              )

                                          ),
                                          Container(
                                              height: _mostraImagem ? boxnomesize : 0,
                                              child: Column(
                                                children: <Widget>[
                                                  //
                                                  // NOME
                                                  //

                                                  Text(_nome2 == null ? "" : _nome2,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: nomesize,
                                                    ),),
                                                  SizedBox(height: 6),
                                                  //
                                                  // DATA
                                                  //
                                                  Text(_dataDb2 == null ? "**********" : _geradatas(_dataDb2),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: datasize,
                                                    ),),
                                                  //
                                                  // DISTANCIA
                                                  //


                                                  Text( _distanciaDb2.toString() == null ?  "Distancia :  +00.00" : "Distancia :  " + _distanciaDb2.toString()+ " Kms",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: distanciasize,
                                                    ),),
                                                  SizedBox(height: 5),
                                                  //
                                                  // SIGNO
                                                  //
                                                  SizedBox(
                                                      width: signowsize,
                                                      height: signohsize,
                                                      child: Image(image: AssetImage(_gerasigno(_signoDb2, _proximoDb2)))),
//
// TIPO DE LUA
//
                                                  Text( _luadiaDb2 == null ? _geratipolua(00) : _geratipolua(_luadiaDb2), textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: tipoluasize,
                                                    ),),
                                                  //
// TIPO DE iluminação
//
                                                  Text( _luadiaDb2 == null ? _geratipoluz(00) : _geratipoluz(_luadiaDb2), textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: tipoluzsize,
                                                    ),)
                                                ],
                                                //
                                              )
                                          )
                                        ]),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height:10),
                                          //
                                          //tela direita
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
                                                            image: new AssetImage(_luadiaDb3 == null
                                                                ? _geraimage(00)
                                                                : _geraimage(_luadiaDb3)),
                                                            fit: BoxFit.fill)),
                                                  )
                                              )

                                          ),
                                          Container(
                                              height: _mostraImagem ? boxnomesize : 0,
                                              child: Column(
                                                children: <Widget>[
                                                  //
                                                  // NOME
                                                  //

                                                  Text(_nome3 == null ? "" : _nome3,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: nomesize,
                                                    ),),
                                                  SizedBox(height: 6),
                                                  //
                                                  // DATA
                                                  //
                                                  Text(_dataDb3 == null ? "**********" : _geradatas(_dataDb3),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: datasize,
                                                    ),),
                                                  //
                                                  // DISTANCIA
                                                  //


                                                  Text( _distanciaDb3.toString() == null ?  "Distancia :  +00.00" : "Distancia :  " + _distanciaDb3.toString()+ " Kms",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: distanciasize,
                                                    ),),
                                                  SizedBox(height: 5),
                                                  //
                                                  // SIGNO
                                                  //
                                                  SizedBox(
                                                      width: signowsize,
                                                      height: signohsize,
                                                      child: Image(image: AssetImage(_gerasigno(_signoDb3, _proximoDb3)))),
//
// TIPO DE LUA
//
                                                  Text( _luadiaDb3 == null ? _geratipolua(00) : _geratipolua(_luadiaDb3), textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: tipoluasize,
                                                    ),),
                                                  //
// TIPO DE iluminação
//
                                                  Text( _luadiaDb3 == null ? _geratipoluz(00) : _geratipoluz(_luadiaDb3), textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: tipoluzsize,
                                                    ),)
                                                ],
                                                //
                                              )
                                          )
                                        ]),

                                  ])
                          ),
                          //
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: _mostraImagem ? (widthlua > 1200? 30: widthlua > 1000? 20 : widthlua > 800 ? 15 : 10) : 0,
                                child: Container(
                                  child: Text(
                                    _nomefamilia == null
                                        ? ""
                                        : "Mapa Lunar - Família $_nomefamilia",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: (widthlua > 1200? 30: widthlua > 1000? 20 : widthlua > 800 ? 14 : 10),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //
                          //
                          SizedBox(height: 10),

                        ]))
                ))),
//botoes
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
                            onPressed: () => setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GeraFotos(widget.nome, widget.email)
                                  ));

                            }),
                            child: Text(
                              "Voltar",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      SizedBox(width: 40),
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
                                              3)
                                  ));
                            }),
                            child: const Text('Comprar esta foto',style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ]),
                SizedBox(height: 10),
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
    ]
    )
    );
  }

}