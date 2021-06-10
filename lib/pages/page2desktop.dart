import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:diario_das_luas/pages/principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;

import 'dart:ui';

import 'Comprar.dart';
import 'Login.dart';
import 'SimuleDesktop.dart';

class Page2Desktop extends StatefulWidget {
  String nome;
  String email;
  Page2Desktop(this.nome, this.email);
  @override
  _Page2DesktopState createState() => _Page2DesktopState();
}

class _Page2DesktopState extends State<Page2Desktop> {
  //
  GlobalKey<ConvexAppBarState> _appBarKey1 = GlobalKey<ConvexAppBarState>();
  GlobalKey<ConvexAppBarState> _appBarKey2 = GlobalKey<ConvexAppBarState>();
  GlobalKey<ConvexAppBarState> _appBarKey3 = GlobalKey<ConvexAppBarState>();

  //
  GlobalKey _containerKey = GlobalKey();
  bool loading = false;
  bool _page1 = true;
  bool _page2 = false;
  bool _page3 = false;
  bool _page4 = false;
  String _dataPicket = " ";

  String _dataPicket2 = "";

  String _nome;
  String _nome2;
  String _nomefamilia;
  bool _nomefamiliaalterado = false;
  bool _nomealterado2 = false;
  bool _dataalterada2 = false;
  bool _mostratitulo = false;

//
  bool _diadataalterada = false;
  bool _mesdataalterada = false;
  bool _anodataalterada = false;
  bool _diadataalterada2 = false;
  bool _mesdataalterada2 = false;
  bool _anodataalterada2 = false;
  //
  bool _mostraLayout = true;
  bool _mostraImagem = false;
  bool _nomealterado = false;
  bool _dataalterada = false;

  bool _mostrabotaoimagem = false;
  //

  String _dataDb1;

  String _timeDb1 = " ";
  String _proximoDb1 = " ";
  String _signoDb1 = " ";
  double _distanciaDb1;
  int _luadiaDb1 = 0;

  String _dataDb2;

  String _timeDb2 = " ";
  String _proximoDb2 = " ";
  String _signoDb2 = " ";
  double _distanciaDb2;
  int _luadiaDb2 = 0;
//
// DropBox
//
  List<dianasc> _diaDropdown = dianasc.getDia();
  List<mesnasc> _mesDropdown = mesnasc.getMes();
  List<anonasc> _anoDropdown = anonasc.getAno();
  //
  List<dianasc2> _diaDropdown2 = dianasc2.getDia2();
  List<mesnasc2> _mesDropdown2 = mesnasc2.getMes2();
  List<anonasc2> _anoDropdown2 = anonasc2.getAno2();

  List<DropdownMenuItem<dianasc>> _dropdownMenuItemsdia;
  dianasc _selecteddianasc;
  List<DropdownMenuItem<mesnasc>> _dropdownMenuItemsmes;
  mesnasc _selectedmesnasc;
  List<DropdownMenuItem<anonasc>> _dropdownMenuItemsano;
  anonasc _selectedanonasc;
  //
  List<DropdownMenuItem<dianasc2>> _dropdownMenuItemsdia2;
  dianasc2 _selecteddianasc2;
  List<DropdownMenuItem<mesnasc2>> _dropdownMenuItemsmes2;
  mesnasc2 _selectedmesnasc2;
  List<DropdownMenuItem<anonasc2>> _dropdownMenuItemsano2;
  anonasc2 _selectedanonasc2;

  List<DropdownMenuItem<dianasc>> buildDropdownMenuItemsdia(List dia) {
    List<DropdownMenuItem<dianasc>> items = List();
    for (dianasc dianascimento in dia) {
      items.add(
        DropdownMenuItem(
          value: dianascimento,
          child: Text(dianascimento.dia),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<mesnasc>> buildDropdownMenuItemsmes(List mes) {
    List<DropdownMenuItem<mesnasc>> items = List();
    for (mesnasc mesnascimento in mes) {
      items.add(
        DropdownMenuItem(
          value: mesnascimento,
          child: Text(mesnascimento.mesTitle),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<anonasc>> buildDropdownMenuItemsano(List ano) {
    List<DropdownMenuItem<anonasc>> items = List();
    for (anonasc anonascimento in ano) {
      items.add(
        DropdownMenuItem(
          value: anonascimento,
          child: Text(anonascimento.ano.toString()),
        ),
      );
    }
    return items;
  }

  //
  List<DropdownMenuItem<dianasc2>> buildDropdownMenuItemsdia2(List dia2) {
    List<DropdownMenuItem<dianasc2>> items = List();
    for (dianasc2 dianascimento2 in dia2) {
      items.add(
        DropdownMenuItem(
          value: dianascimento2,
          child: Text(dianascimento2.dia2),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<mesnasc2>> buildDropdownMenuItemsmes2(List mes2) {
    List<DropdownMenuItem<mesnasc2>> items = List();
    for (mesnasc2 mesnascimento2 in mes2) {
      items.add(
        DropdownMenuItem(
          value: mesnascimento2,
          child: Text(mesnascimento2.mesTitle2),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<anonasc2>> buildDropdownMenuItemsano2(List ano2) {
    List<DropdownMenuItem<anonasc2>> items = List();
    for (anonasc2 anonascimento2 in ano2) {
      items.add(
        DropdownMenuItem(
          value: anonascimento2,
          child: Text(anonascimento2.ano2.toString()),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItemdia(dianasc selecteddianasc) {
    setState(() {
      _selecteddianasc = selecteddianasc;
      _diadataalterada = true;
    });
    _verificaBotaoGeraImage();
  }

  onChangeDropdownItemmes(mesnasc selectedmesnasc) {
    setState(() {
      _selectedmesnasc = selectedmesnasc;
      _mesdataalterada = true;
    });
    _verificaBotaoGeraImage();
  }

  onChangeDropdownItemano(anonasc selectedanonasc) {
    setState(() {
      _selectedanonasc = selectedanonasc;
      _anodataalterada = true;
    });
    _verificaBotaoGeraImage();
  }

  _verificaBotaoGeraImage() {
    if ((_diadataalterada == true) &&
        (_mesdataalterada == true) &&
        (_anodataalterada == true)) {
      setState(() {
        _dataalterada = true;
      });
      _dataPicket = (_selectedanonasc.ano.toString() +
          _selectedmesnasc.mes.toString() +
          _selecteddianasc.dia.toString());
      _geraDados(_dataPicket);
    }
    if ((_nomealterado) &&
        (_dataalterada) &&
        (_nomealterado2) &&
        (_dataalterada2)) {
      _mostrabotaoimagem = true;
    } else {
      _mostrabotaoimagem = false;
    }
  }

//
  onChangeDropdownItemdia2(dianasc2 selecteddianasc2) {
    setState(() {
      _selecteddianasc2 = selecteddianasc2;
      _diadataalterada2 = true;
    });
    _verificaBotaoGeraImage2();
  }

  onChangeDropdownItemmes2(mesnasc2 selectedmesnasc2) {
    setState(() {
      _selectedmesnasc2 = selectedmesnasc2;
      _mesdataalterada2 = true;
    });
    _verificaBotaoGeraImage2();
  }

  onChangeDropdownItemano2(anonasc2 selectedanonasc2) {
    setState(() {
      _selectedanonasc2 = selectedanonasc2;
      _anodataalterada2 = true;
    });
    _verificaBotaoGeraImage2();
  }

  _verificaBotaoGeraImage2() {
    if ((_diadataalterada2 == true) &&
        (_mesdataalterada2 == true) &&
        (_anodataalterada2 == true)) {
      setState(() {
        _dataalterada2 = true;
      });
      _dataPicket2 = (_selectedanonasc2.ano2.toString() +
          _selectedmesnasc2.mes2.toString() +
          _selecteddianasc2.dia2.toString());
      _geraDados2(_dataPicket2);
    }
    if ((_nomealterado) &&
        (_dataalterada) &&
        (_nomealterado2) &&
        (_dataalterada2) &&
        (_nomefamiliaalterado)) {
      _mostrabotaoimagem = true;
    } else {
      _mostrabotaoimagem = false;
    }
  }

//
  Future<void> _geraDados(String datalua) async {
    fs.Firestore luas = fb.firestore();
    fs.DocumentSnapshot documentSnapshot =
        await luas.collection("DiarioLuas").doc(datalua).get();
    var dadosdb = documentSnapshot.data();

    _salvaDados(
        dadosdb['DataDb'].toString(),
        dadosdb['SignosDb'],
        dadosdb['TimeDb'],
        dadosdb['ProximoDb'],
        dadosdb['LuadiaDb'],
        dadosdb['Distanciadb']);
  }

  Future<void> _geraDados2(String datalua) async {
    fs.Firestore luas = fb.firestore();
    fs.DocumentSnapshot documentSnapshot =
        await luas.collection("DiarioLuas").doc(datalua).get();
    var dadosdb = documentSnapshot.data();

    _salvaDados2(
        dadosdb['DataDb'].toString(),
        dadosdb['SignosDb'],
        dadosdb['TimeDb'],
        dadosdb['ProximoDb'],
        dadosdb['LuadiaDb'],
        dadosdb['Distanciadb']);
  }

  _salvaDados(String datadb, String signodb, String timedb, String proximodb,
      int luadiadb, double distanciadb) {
    setState(() {
      _dataDb1 = datadb;
      _signoDb1 = signodb;
      _timeDb1 = timedb;
      _distanciaDb1 = distanciadb;
      _luadiaDb1 = luadiadb;
      _proximoDb1 = proximodb;
    });
  }

  _salvaDados2(String datadb, String signodb, String timedb, String proximodb,
      int luadiadb, double distanciadb) {
    setState(() {
      _dataDb2 = datadb;
      _signoDb2 = signodb;
      _timeDb2 = timedb;
      _distanciaDb2 = distanciadb;
      _luadiaDb2 = luadiadb;
      _proximoDb2 = proximodb;
    });
  }

  _geratipolua(dia) {
    switch (dia) {
      case 0:
        return ("Lua Nova");
        break;
      case 1:
        return ("Lua Crescente  - 1°  Dia");
        break;
      case 2:
        return ("Lua Crescente - 2°  Dia");
        break;
      case 3:
        return ("Lua Crescente - 3°  Dia");
        break;
      case 4:
        return ("Lua Crescente - 4°  Dia");
        break;
      case 5:
        return ("Lua Crescente - 5°  Dia");
        break;
      case 6:
        return ("Lua Crescente - 6°  Dia");
        break;
      case 7:
        return ("Lua Quarto Crescente - 7°  Dia");
        break;
      case 8:
        return ("Lua Quarto Crescente - 8°  Dia");
        break;
      case 9:
        return ("Lua Quarto Crescente - 9°  Dia");
        break;
      case 10:
        return ("Lua Quarto Crescente - 10°  Dia");
        break;
      case 11:
        return ("Lua Quarto Crescente - 11°  Dia");
        break;
      case 12:
        return ("Lua Quarto Crescente - 12°  Dia");
        break;
      case 13:
        return ("Lua Quarto Crescente - 13°  Dia");
        break;
      case 14:
        return ("Lua Quarto Crescente - 14°  Dia");
        break;
      case 15:
        return ("Lua Cheia - 15°  Dia");
        break;
      case 16:
        return ("Lua Minguante Convexa - 16°  Dia");
        break;
      case 17:
        return ("Lua Minguante Convexa - 17°  Dia");
        break;
      case 18:
        return ("Lua Minguante Convexa - 18°  Dia");
        break;
      case 19:
        return ("Lua Minguante Convexa - 19°  Dia");
        break;
      case 20:
        return ("Lua Minguante Convexa - 20°  Dia");
        break;
      case 21:
        return ("Lua Minguante Convexa - 21°  Dia");
        break;
      case 22:
        return ("Lua Quarto Minguante - 22°  Dia");
        break;
      case 23:
        return ("Lua Minguante - 23°  Dia");
        break;
      case 24:
        return ("Lua Minguante - 24°  Dia");
        break;
      case 25:
        return ("Lua Minguante - 25°  Dia");
        break;
      case 26:
        return ("Lua Minguante - 26°  Dia");
        break;
      case 27:
        return ("Lua Minguante - 27°  Dia");
        break;
      case 28:
        return ("Lua Minguante - 28°  Dia");
        break;
      case 29:
        return ("Lua Minguante - 29°  Dia");
        break;

      default:
        {
          print("Lua");
        }
        break;
    }
  }

  _geratipoluz(dia) {
    switch (dia) {
      case 0:
        return ("0% Iluminação");
        break;
      case 1:
        return ("1% Iluminação");
        break;
      case 2:
        return ("4% Iluminação");
        break;
      case 3:
        return ("8% Iluminação");
        break;
      case 4:
        return ("16% Iluminação");
        break;
      case 5:
        return ("23% Iluminação");
        break;
      case 6:
        return ("31% Iluminação");
        break;
      case 7:
        return ("50% Iluminação");
        break;
      case 8:
        return ("60% Iluminação");
        break;
      case 9:
        return ("69% Iluminação");
        break;
      case 10:
        return ("78% Iluminação");
        break;
      case 11:
        return ("88% Iluminação");
        break;
      case 12:
        return ("94% Iluminação");
        break;
      case 13:
        return ("95% Iluminação");
        break;
      case 14:
        return ("98% Iluminação");
        break;
      case 15:
        return ("100% Iluminação");
        break;
      case 16:
        return ("99% Iluminação");
        break;
      case 17:
        return ("94% Iluminação");
        break;
      case 18:
        return ("90% Iluminação");
        break;
      case 19:
        return ("81% Iluminação");
        break;
      case 20:
        return ("71% Iluminação");
        break;
      case 21:
        return ("61% Iluminação");
        break;
      case 22:
        return ("50% Iluminação");
        break;
      case 23:
        return ("40% Iluminação");
        break;
      case 24:
        return ("30% Iluminação");
        break;
      case 25:
        return ("21% Iluminação");
        break;
      case 26:
        return ("14% Iluminação");
        break;
      case 27:
        return ("8% Iluminação");
        break;
      case 28:
        return ("4% Iluminação");
        break;
      case 29:
        return ("1% Iluminação");
        break;

      default:
        {
          print("0% Iluminação");
        }
        break;
    }
  }

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

  _gerasigno(signo, proximo) {
    if ((signo == "cp") && (proximo == "I")) {
      return ("assets/images/cap.png");
    } else if ((signo == "cp") && (proximo == "D")) {
      return ("assets/images/cap-aq.png");
    } else if ((signo == "aq") && (proximo == "I")) {
      return ("assets/images/aq.png");
    } else if ((signo == "aq") && (proximo == "D")) {
      return ("assets/images/aq-pe.png");
    } else if ((signo == "pi") && (proximo == "I")) {
      return ("assets/images/pe.png");
    } else if ((signo == "pi") && (proximo == "D")) {
      return ("assets/images/pe-ar.png");
    } else if ((signo == "ar") && (proximo == "I")) {
      return ("assets/images/ar.png");
    } else if ((signo == "ar") && (proximo == "D")) {
      return ("assets/images/ar-to.png");
    } else if ((signo == "ta") && (proximo == "I")) {
      return ("assets/images/to.png");
    } else if ((signo == "ta") && (proximo == "D")) {
      return ("assets/images/to-ge.png");
    } else if ((signo == "ge") && (proximo == "I")) {
      return ("assets/images/ge.png");
    } else if ((signo == "ge") && (proximo == "D")) {
      return ("assets/images/ge-ca.png");
    } else if ((signo == "cn") && (proximo == "I")) {
      return ("assets/images/ca.png");
    } else if ((signo == "cn") && (proximo == "D")) {
      return ("assets/images/ca-le.png");
    } else if ((signo == "le") && (proximo == "I")) {
      return ("assets/images/le.png");
    } else if ((signo == "le") && (proximo == "D")) {
      return ("assets/images/le-vi.png");
    } else if ((signo == "vi") && (proximo == "I")) {
      return ("assets/images/vi.png");
    } else if ((signo == "vi") && (proximo == "D")) {
      return ("assets/images/vi-li.png");
    } else if ((signo == "li") && (proximo == "I")) {
      return ("assets/images/li.png");
    } else if ((signo == "li") && (proximo == "D")) {
      return ("assets/images/li-es.png");
    } else if ((signo == "sc") && (proximo == "I")) {
      return ("assets/images/es.png");
    } else if ((signo == "sc") && (proximo == "D")) {
      return ("assets/images/es-sa.png");
    } else if ((signo == "sa") && (proximo == "I")) {
      return ("assets/images/sa.png");
    } else if ((signo == "sa") && (proximo == "D")) {
      return ("assets/images/sa-ca.png");
    } else {
      return ("images/ca.png");
    }
  }

  _geradatas(String data) {
    int dia = int.parse(data.substring(6, 8));
    int mes = int.parse(data.substring(4, 6));
    int ano = int.parse(data.substring(0, 4));

    switch (mes) {
      case 0:
        return ("error");
        break;
      case 1:
        return ("$dia de Janeiro de $ano");
        break;
      case 2:
        return ("$dia de Fevereiro de $ano");
        break;
      case 3:
        return ("$dia de Março de $ano");
        break;
      case 4:
        return ("$dia de Abril de $ano");
        break;
      case 5:
        return ("$dia de Maio de $ano");
        break;
      case 6:
        return ("$dia de Junho de $ano");
        break;
      case 7:
        return ("$dia de Julho de $ano");
        break;
      case 8:
        return ("$dia de Agosto de $ano");
        break;
      case 9:
        return ("$dia de Setembro de $ano");
        break;
      case 10:
        return ("$dia de Outubro de $ano");
        break;
      case 11:
        return ("$dia de Novembro de $ano");
        break;
      case 12:
        return ("$dia de Dezembro de $ano");
        break;
    }
  }
  //
  int _limite1 = 800;
  int _limite2 = 700;
  int _limite3 = 600;
  int _limite4 = 500;
  //
  void initState() {
    _dropdownMenuItemsdia = buildDropdownMenuItemsdia(_diaDropdown);
    _selecteddianasc = _dropdownMenuItemsdia[0].value;
    _dropdownMenuItemsmes = buildDropdownMenuItemsmes(_mesDropdown);
    _selectedmesnasc = _dropdownMenuItemsmes[0].value;
    _dropdownMenuItemsano = buildDropdownMenuItemsano(_anoDropdown);
    _selectedanonasc = _dropdownMenuItemsano[0].value;
    //
    _dropdownMenuItemsdia2 = buildDropdownMenuItemsdia2(_diaDropdown2);
    _selecteddianasc2 = _dropdownMenuItemsdia2[0].value;
    _dropdownMenuItemsmes2 = buildDropdownMenuItemsmes2(_mesDropdown2);
    _selectedmesnasc2 = _dropdownMenuItemsmes2[0].value;
    _dropdownMenuItemsano2 = buildDropdownMenuItemsano2(_anoDropdown2);
    _selectedanonasc2 = _dropdownMenuItemsano2[0].value;
  }

  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    //
    //


    double  h10p = heightlua * 0.10;
    double  h20p = heightlua * 0.20;
    double  h80p = heightlua * 1.20;
    double  h40p = 400;
    double  h60p = heightlua * 0.60;
    //
    bool portrait = (widthlua > heightlua ? false: true);
    widthlua < 501 ? SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]) : SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    double titlesize = portrait ?
    (widthlua > 800 ? 28 : widthlua > 600 ? 24 : widthlua > 300 ? 19 : widthlua > 200 ? 18 : 18 )
        :
    (widthlua > 2100 ? 30 : widthlua > 1000 ? 24 : widthlua > 500 ? 23 : 20 );
    //
    double nomesize = portrait ?
    (widthlua > 800 ? 30 : widthlua > 600 ? 20 : widthlua > 300 ? 19 : widthlua > 200 ? 18 : 18 )
        :
    (widthlua > 2100 ? 30 : widthlua > 1000 ? 24 : widthlua > 500 ? 23 : 20 );
    //
    //
    //
    double nomeluasize = heightlua /50;
    double datasize = heightlua /60;
    double tipoluasize = heightlua / 57;
    double distanciasize = heightlua /60;
    double signowsize = portrait ? (widthlua / 4): ( widthlua /3 );
    double signohsize = portrait ? (heightlua / 22): ( heightlua /20 );
    double tipoluzsize = heightlua / 65;

    double hbox = heightlua*0.08; // box nome e data
    double boxbrancof = heightlua * 0.14;
    double boxbranco1 = heightlua * 0.30; // box fundo branco tranparente sem botão
    double boxbranco2 = heightlua * 0.35; // box fundo branco tranparente
    double hspace0 = heightlua * 0.03; //box espaçoantes nome
    double hspace1 = heightlua * 0.02;
    double hspace2 =  (widthlua > 1400 ? heightlua * 0.05 : widthlua > 1200 ? heightlua *0.04 : widthlua > 1000 ? heightlua *0.035 : widthlua > 900 ? heightlua *0.03 : widthlua > 300 ? heightlua *0.03 : heightlua *0.02);
    double hspace3 = heightlua * 0.005;
    double hspace4 = heightlua * 0.02;

    ;
    double boxnomeh = portrait ?
    (widthlua > 800 ? 60 : widthlua > 700 ? 50 : widthlua > 600 ? 45 : widthlua > 500 ? 45 : widthlua > 400 ? 40 : widthlua > 300 ? 38 : widthlua > 200 ? 30 : 30 )
        :
    (widthlua > 2100 ? widthlua /45 : widthlua > 2000 ? widthlua /44 : widthlua > 1900 ? widthlua /43 : widthlua > 1800 ? widthlua /42 : widthlua > 1700 ? widthlua /41 :
    widthlua > 1600 ? widthlua /40 :  widthlua > 1500 ? widthlua /39 : widthlua > 1400 ? widthlua /38 : widthlua > 1300 ? widthlua /37 : widthlua > 1200 ? widthlua /36 :
    widthlua > 1100 ? widthlua /35 :  widthlua > 1000 ? widthlua /34 : widthlua > 900 ? widthlua /32 :  widthlua > 800 ? widthlua /30 :  widthlua > 700 ? widthlua /28 : widthlua /26 );
    //
    int  luasize = (widthlua > 1200? _limite1: widthlua > 1000? _limite2 : widthlua > 800 ? _limite3 : _limite4);
    //

    return FocusWatcher(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: (Image.asset("assets/images/logo.png",
                  width: 160, height: 100)),
               leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SimuleDesktop(widget.nome, widget.email)));
                  },
                  child: Image.asset( "assets/images/iconseta.png",
                    width: 12, height: 12
                    , // add custom icons also
                  )
              )),
        backgroundColor: Colors.black,
          bottomNavigationBar:
          _page1 & _mostrabotaoimagem  ?
          ConvexAppBar(key: _appBarKey1,
            items: [
              TabItem(icon: Image.asset('assets/images/logo2.png') ),
              TabItem(icon: Image.asset('assets/images/foto.png'), title: 'Gerar Imagem'),
              TabItem(icon: Image.asset('assets/images/menu.png'), title: 'Menu Anterior'),
              TabItem(icon: Image.asset('assets/images/blank.png')),
            ],
            initialActiveIndex: _page1 & _mostrabotaoimagem  ? 0: _page1 ? 0: 0,//optional, default as 0
            backgroundColor: Colors.deepOrange,
            height: heightlua * 0.10,
            onTabNotify: (i) {
              var intercept = i == 0;
              if (intercept) {
                null;
              }
              return !intercept;
            },

            onTap: (int i) {
              if (i == 1) {
                setState(() {
                  _mostrabotaoimagem = false;
                  _mostraImagem = true;
                  _page1 = false;
                  _page2 = true;
                });
              } else
              if (i == 2) {
                setState(() {
                  _mostraImagem = false;
                  _mostraLayout = true;
                  _mostrabotaoimagem = false;
                  _dataPicket = "";
                  _nome = "";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SimuleDesktop(widget.nome,widget.email)));
                });
              }
              else
              if (i == 3) {
                setState(() {
                  _mostraImagem = false;
                  _mostraLayout = true;
                  _mostrabotaoimagem = false;
                  _dataPicket = "";
                  _nome = "";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Principal(widget.nome,widget.email)));
                });
              }
              ;  },
          ) :
          _page1  ?
          ConvexAppBar(key: _appBarKey2,
            items: [
              TabItem(icon: Image.asset('assets/images/logo2.png') ),
              TabItem(icon: Image.asset('assets/images/menu.png'), title: 'Menu Anterior'),
              TabItem(icon: Image.asset('assets/images/menu.png'), title: 'Menu Principal'),
              TabItem(icon: Image.asset('assets/images/blank.png')),
            ],
            initialActiveIndex: _page1 & _mostrabotaoimagem  ? 0: _page1 ? 0: 0,//optional, default as 0
            backgroundColor: Colors.deepOrange,
            height: heightlua * 0.10,
            onTabNotify: (i) {

              var intercept = i == 0;
              if (intercept) {
                null;
              }
              return !intercept;
            },
            onTap: (int i) {


              if (i == 1) {
                setState(() {
                  _mostraImagem = false;
                  _mostraLayout = true;
                  _mostrabotaoimagem = false;
                  _dataPicket = "";
                  _nome = "";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SimuleDesktop(widget.nome,widget.email)));
                });
              }
              else
              if (i == 2) {
                setState(() {
                  _mostraImagem = false;
                  _mostraLayout = true;
                  _mostrabotaoimagem = false;
                  _dataPicket = "";
                  _nome = "";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Principal(widget.nome,widget.email)));
                });
              }
              ; },
          ) :
          ConvexAppBar(key: _appBarKey3,
              items: [
                TabItem(icon: Image.asset('assets/images/logo2.png') ),
                TabItem(icon: Image.asset('assets/images/dolar.png'), title: 'Preço da Foto'),
                TabItem(icon: Image.asset('assets/images/zoomo.png'), title: 'Zoom - '),
                TabItem(icon: Image.asset('assets/images/zoomi.png'), title: 'Zoom +'),
                TabItem(icon: Image.asset('assets/images/menu.png'), title: 'Menu Anterior'),
                TabItem(icon: Image.asset('assets/images/blank.png')),

              ],
              initialActiveIndex: _page1 & _mostrabotaoimagem  ? 0: _page1 ? 0: 0,//optional, default as 0
              backgroundColor: Colors.deepOrange,
              height: heightlua * 0.10,
              onTabNotify: (i) {

                var intercept = i == 0;
                if (intercept) {
                  null;
                }
                return !intercept;
              },
              onTap: (int i) {

                if (i == 1) {
                  if (widget.email == "@ANONIMO") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Login(
                                    widget.nome,widget.email,
                                    2,
                                    _nomefamilia,
                                    _dataDb1,
                                    _dataDb2,
                                    "",
                                    "",
                                    "",
                                    "",
                                    _nome,
                                    _nome2,
                                    "",
                                    "",
                                    "",
                                    "",
                                    _distanciaDb1,
                                    _distanciaDb2,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    _luadiaDb1,
                                    _luadiaDb2,
                                    0,
                                    0,
                                    0,
                                    0,
                                    _proximoDb1,
                                    _proximoDb2,
                                    "",
                                    "",
                                    "",
                                    "",
                                    _signoDb1,
                                    _signoDb2,
                                    "",
                                    "",
                                    "",
                                    "",
                                    _timeDb1,
                                    _timeDb2,
                                    "",
                                    "",
                                    "",
                                    ""
                                )));
                  }
                  else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Comprar(
                                    widget.nome,widget.email,
                                    2,
                                    _nomefamilia,
                                    _dataDb1,
                                    _dataDb2,
                                    "",
                                    "",
                                    "",
                                    "",
                                    _nome,
                                    _nome2,
                                    "",
                                    "",
                                    "",
                                    "",
                                    _distanciaDb1,
                                    _distanciaDb2,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    _luadiaDb1,
                                    _luadiaDb2,
                                    0,
                                    0,
                                    0,
                                    0,
                                    _proximoDb1,
                                    _proximoDb2,
                                    "",
                                    "",
                                    "",
                                    "",
                                    _signoDb1,
                                    _signoDb2,
                                    "",
                                    "",
                                    "",
                                    "",
                                    _timeDb1,
                                    _timeDb2,
                                    "",
                                    "",
                                    "",
                                    ""
                                )));
                  }
                } else
                if (i == 2) {
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
                } else
                if (i == 3) {
                  setState(() {
                    _limite1 = _limite1 + 50;
                    _limite2 = _limite2 + 50;
                    _limite3 = _limite3 + 50;
                    _limite4 = _limite4 + 50;
                    if ((_limite1 > 1200) ||(_limite2 > 1200) ||(_limite3 > 1200) ||(_limite4 > 1200) ) {
                      _limite1 =  1200;
                      _limite2 =  1200;
                      _limite3 =  1200;
                      _limite4 =  1200;
                    }});

                } else
                if (i == 4) {
                  setState(() {
                    _mostraImagem = false;
                    _mostrabotaoimagem = true;
                    setState(() {
                      _page1 = true;
                      _page2 = false;
                    });
                  });
                }
                ;  }
          )  ,
      body: Container(
          width: widthlua,
          height: heightlua,
          child:
      Column(
      children: <Widget>[
      Container(
          height: heightlua * 0.90 -57,
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
                                Column(
                                    children: <Widget>[
                                      //
                                      // Pagina entrada de dados
                                      //
                                      //
                                      _page1 ? Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/fundodatas.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child:SingleChildScrollView(
                                              scrollDirection:  Axis.vertical,
                                              child :Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children:<Widget> [
                                                    Container(
                                                        child: Column(
                                                            children:<Widget> [
                                                              //FAMILIA

                                                              Container(
                                                                  width: widthlua*0.85,
                                                                  height: boxbrancof,
                                                                  child: Material(
                                                                      elevation: 10.0,
                                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                      color: Color.fromRGBO(255,255,255, 0.4),
                                                                      child: Column(
                                                                          children: <Widget>[
// INPUT DADOS NOME familia
//
                                                                            SizedBox(height: hspace0),
                                                                            SizedBox(
                                                                              width: widthlua*0.7+40,
                                                                              height: hbox,
                                                                              child: Material(
                                                                                  elevation: 5.0,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                  color: Colors.blue,
//   Nome Famílha
                                                                                  child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(2.0),
                                                                                          child: Image.asset( "assets/images/person.png",
                                                                                              width:25 , height:  25
                                                                                          ),),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: (_nomefamiliaalterado ? Colors.white : Colors.redAccent),
                                                                                            borderRadius: BorderRadius.only(
                                                                                                topRight: Radius.circular(10.0),
                                                                                                bottomRight: Radius.circular(10.0)),
                                                                                          ),
                                                                                          width: widthlua*0.7,
                                                                                          height: hbox,
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: TextField(
                                                                                              onChanged: (text) {
                                                                                                if (text.isEmpty) {
                                                                                                  setState(() {
                                                                                                    _nomefamiliaalterado = false;
                                                                                                    _mostrabotaoimagem = false;
                                                                                                    _nomefamilia = "";
                                                                                                  });
                                                                                                } else {
                                                                                                  setState(() {
                                                                                                    _nomefamilia = text;
                                                                                                    _nomefamiliaalterado = true;
                                                                                                    if ((_nomealterado) &&
                                                                                                        (_dataalterada) &&
                                                                                                        (_nomealterado2) &&
                                                                                                        (_dataalterada2) &&
                                                                                                        (_nomefamiliaalterado)) {
                                                                                                      _mostrabotaoimagem = true;
                                                                                                    } else {
                                                                                                      _mostrabotaoimagem = false;
                                                                                                    }
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              decoration: InputDecoration(
                                                                                                // labelText: "Nome Completo1",
                                                                                                border: InputBorder.none,
                                                                                                hintText: 'Nome da Família',
                                                                                                fillColor: Colors.white,
                                                                                              ),
                                                                                              style: TextStyle(
                                                                                                  fontSize: nomesize,
                                                                                                  color: Colors.black
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        )])),),
                                                                            SizedBox(height: hspace1)

                                                                          ]
                                                                      )
                                                                  )
                                                              ),
                                                              //NOME1
                                                              SizedBox(height:heightlua*0.02),
                                                              Container(
                                                                  width: widthlua*0.90,
                                                                  height: boxbranco1,
                                                                  child: Material(
                                                                      elevation: 10.0,
                                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                      color: Color.fromRGBO(255,255,255, 0.4),
                                                                      child: Column(
                                                                          children: <Widget>[
// INPUT DADOS NOME DATA
//
                                                                            SizedBox(height: hspace0),
                                                                            SizedBox(
                                                                              width: widthlua*0.7+40,
                                                                              height: hbox,
                                                                              child: Material(
                                                                                  elevation: 15.0,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                  color: Colors.blue,
//
// NOME
//
                                                                                  child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: <Widget>[
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(2.0),
                                                                                          child: Image.asset( "assets/images/person.png",
                                                                                              width:25 , height:  25
                                                                                          ),),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: (_nomealterado ? Colors.white : Colors.redAccent),
                                                                                            borderRadius: BorderRadius.only(
                                                                                                topRight: Radius.circular(10.0),
                                                                                                bottomRight: Radius.circular(10.0)),
                                                                                          ),
                                                                                          width: widthlua*0.7,
                                                                                          height: hbox,
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: TextField(
                                                                                              onEditingComplete: () {
                                                                                                FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                                if (!currentFocus.hasPrimaryFocus) {
                                                                                                  currentFocus.unfocus();
                                                                                                }
                                                                                              },
                                                                                              onChanged: (text) {
                                                                                                if (text.isEmpty) {
                                                                                                  setState(() {
                                                                                                    _nomealterado = false;
                                                                                                    _mostrabotaoimagem =false;
                                                                                                    _nome = "";
                                                                                                  });} else{
                                                                                                  setState(() {
                                                                                                    _nome = text;
                                                                                                    _nomealterado = true;
                                                                                                    if ((_nomealterado) &&
                                                                                                        (_dataalterada) &&
                                                                                                        (_nomealterado2) &&
                                                                                                        (_dataalterada2) &&
                                                                                                        (_nomefamiliaalterado))
                                                                                                    {_mostrabotaoimagem = true;} else
                                                                                                    {_mostrabotaoimagem = false;}
                                                                                                  });}
                                                                                              },
                                                                                              decoration: InputDecoration(
                                                                                                //  labelText: "Nome Completo",
                                                                                                border: InputBorder.none,
                                                                                                hintText: 'Nome Completo - 1',
                                                                                                fillColor: Colors.white,
                                                                                                // filled: true
                                                                                              ),
                                                                                              style: TextStyle(
                                                                                                  fontSize: nomesize,
                                                                                                  color: Colors.black
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ])
                                                                              ),),
                                                                            SizedBox(height: hspace1),
                                                                            //texto data nascimento
                                                                            SizedBox(
                                                                              width: widthlua* 0.7,
                                                                              height: hspace2,
                                                                              child: Text(
                                                                                  "Data Nascimento - 1", textAlign: TextAlign.center,
                                                                                  style: TextStyle(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Colors.white,
                                                                                      fontSize: titlesize)
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: hspace3),
                                                                            SizedBox(
                                                                                width: widthlua*0.7+45,
                                                                                height : hbox,
                                                                                child: Material(
                                                                                  elevation: 10.0,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                  color: Colors.blue,
//
//   Data de Nascimento
//
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: <Widget>[
                                                                                      Container(
                                                                                          width: 45,
                                                                                          child: Image.asset( "assets/images/calendar.png",
                                                                                            width: 45, height: 45
                                                                                            , // add custom icons also
                                                                                          )),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: (_dataalterada ? Colors.white : Colors.redAccent),
                                                                                          borderRadius: BorderRadius.only(
                                                                                              topRight: Radius.circular(10.0),
                                                                                              bottomRight: Radius.circular(10.0)),
                                                                                        ),
                                                                                        width: widthlua*0.7,
                                                                                        height : hbox,
                                                                                        child: Padding(

                                                                                          padding: const EdgeInsets.all(2.0),
                                                                                          child: Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: <Widget>[
                                                                                              Row(
                                                                                                  children: <Widget>[
                                                                                                    Container(
                                                                                                        color: (_dataalterada ? Colors.white : Colors.redAccent),
                                                                                                        padding: EdgeInsets.only(left: 5, right: 5),
                                                                                                        child:
                                                                                                        DropdownButton(
                                                                                                          value: _selecteddianasc,
                                                                                                          items: _dropdownMenuItemsdia,
                                                                                                          style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                                          onTap: () {
                                                                                                            FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                                            if (!currentFocus.hasPrimaryFocus) {
                                                                                                              currentFocus.unfocus();
                                                                                                            }
                                                                                                          },
                                                                                                          onChanged: onChangeDropdownItemdia,
                                                                                                        )),
                                                                                                    SizedBox(
                                                                                                      height: 20.0,
                                                                                                    ),
                                                                                                  ]),
                                                                                              Row(
                                                                                                  children: <Widget>[
                                                                                                    Container(
                                                                                                        padding: EdgeInsets.only(left: 5, right: 5),
                                                                                                        color: (_dataalterada ? Colors.white : Colors.redAccent),
                                                                                                        child:
                                                                                                        DropdownButton(
                                                                                                          value: _selectedmesnasc,
                                                                                                          items: _dropdownMenuItemsmes,
                                                                                                          style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                                          onTap: () {
                                                                                                            FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                                            if (!currentFocus.hasPrimaryFocus) {
                                                                                                              currentFocus.unfocus();
                                                                                                            }
                                                                                                          },
                                                                                                          onChanged: onChangeDropdownItemmes,
                                                                                                          dropdownColor: Colors.white,
                                                                                                        )),
                                                                                                    SizedBox(
                                                                                                      height: 10.0,
                                                                                                    ),
                                                                                                  ]),
                                                                                              Row(
                                                                                                  children: <Widget>[
                                                                                                    Container(
                                                                                                        color: (_dataalterada ? Colors.white : Colors.redAccent),
                                                                                                        padding: EdgeInsets.only(left: 5, right: 5),
                                                                                                        child:  DropdownButton(
                                                                                                          value: _selectedanonasc,
                                                                                                          items: _dropdownMenuItemsano,
                                                                                                          onTap: () {
                                                                                                            FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                                            if (!currentFocus.hasPrimaryFocus) {
                                                                                                              currentFocus.unfocus();
                                                                                                            }
                                                                                                          },
                                                                                                          style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                                          onChanged: onChangeDropdownItemano,
                                                                                                        )),
                                                                                                    SizedBox(
                                                                                                      height: 10.0,
                                                                                                    ),
                                                                                                  ])
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      )

                                                                                    ],
                                                                                  ),

                                                                                )
                                                                            ),
                                                                            SizedBox(height:hspace4),

                                                                          ]
                                                                      )
                                                                  )
                                                              ),
                                                              //NOME2
                                                              SizedBox(height:heightlua*0.02),
                                                              Container(
                                                                  width: widthlua*0.90,
                                                                  height: boxbranco1,
                                                                  child: Material(
                                                                      elevation: 10.0,
                                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                      color: Color.fromRGBO(255,255,255, 0.4),
                                                                      child: Column(
                                                                          children: <Widget>[
// INPUT DADOS NOME DATA
//
                                                                            SizedBox(height: hspace0),
                                                                            SizedBox(
                                                                              width: widthlua*0.7+40,
                                                                              height: hbox,
                                                                              child: Material(
                                                                                  elevation: 15.0,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                  color: Colors.blue,
//
// NOME
//
                                                                                  child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: <Widget>[
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(2.0),
                                                                                          child: Image.asset( "assets/images/person.png",
                                                                                              width:25 , height:  25
                                                                                          ),),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: (_nomealterado2 ? Colors.white : Colors.redAccent),
                                                                                            borderRadius: BorderRadius.only(
                                                                                                topRight: Radius.circular(10.0),
                                                                                                bottomRight: Radius.circular(10.0)),
                                                                                          ),
                                                                                          width: widthlua*0.7,
                                                                                          height: hbox,
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: TextField(
                                                                                              onEditingComplete: () {
                                                                                                FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                                if (!currentFocus.hasPrimaryFocus) {
                                                                                                  currentFocus.unfocus();
                                                                                                }
                                                                                              },
                                                                                              onChanged: (text) {
                                                                                                if (text.isEmpty) {
                                                                                                  setState(() {
                                                                                                    _nomealterado = false;
                                                                                                    _mostrabotaoimagem =false;
                                                                                                    _nome2 = "";
                                                                                                  });} else{
                                                                                                  setState(() {
                                                                                                    _nome2 = text;
                                                                                                    _nomealterado2 = true;
                                                                                                    if ((_nomealterado) &&
                                                                                                        (_dataalterada) &&
                                                                                                        (_nomealterado2) &&
                                                                                                        (_dataalterada2) &&
                                                                                                        (_nomefamiliaalterado))
                                                                                                    {_mostrabotaoimagem = true;} else
                                                                                                    {_mostrabotaoimagem = false;}
                                                                                                  });}
                                                                                              },
                                                                                              decoration: InputDecoration(
                                                                                                //  labelText: "Nome Completo",
                                                                                                border: InputBorder.none,
                                                                                                hintText: 'Nome Completo - 2',
                                                                                                fillColor: Colors.white,
                                                                                                // filled: true
                                                                                              ),
                                                                                              style: TextStyle(
                                                                                                  fontSize: nomesize,
                                                                                                  color: Colors.black
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ])
                                                                              ),),
                                                                            SizedBox(height: hspace1),
                                                                            //texto data nascimento
                                                                            SizedBox(
                                                                              width: widthlua* 0.7,
                                                                              height: hspace2,
                                                                              child: Text(
                                                                                  "Data Nascimento - 2", textAlign: TextAlign.center,
                                                                                  style: TextStyle(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Colors.white,
                                                                                      fontSize: titlesize)
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: hspace3),
                                                                            SizedBox(
                                                                                width: widthlua*0.7+45,
                                                                                height : hbox,
                                                                                child: Material(
                                                                                  elevation: 10.0,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                                  color: Colors.blue,
//
//   Data de Nascimento
//
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: <Widget>[
                                                                                      Container(
                                                                                      width: 45,
                                                                                      child: Image.asset( "assets/images/calendar.png",
                                                                                        width: 45, height: 45
                                                                                        , // add custom icons also
                                                                                      )),

                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: (_dataalterada2 ? Colors.white : Colors.redAccent),
                                                                                          borderRadius: BorderRadius.only(
                                                                                              topRight: Radius.circular(10.0),
                                                                                              bottomRight: Radius.circular(10.0)),
                                                                                        ),
                                                                                        width: widthlua*0.7,
                                                                                        height : hbox,
                                                                                        child: Padding(

                                                                                          padding: const EdgeInsets.all(2.0),
                                                                                          child: Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: <Widget>[
                                                                                              Row(
                                                                                                  children: <Widget>[
                                                                                                    Container(
                                                                                                        color: (_dataalterada2 ? Colors.white : Colors.redAccent),
                                                                                                        padding: EdgeInsets.only(left: 5, right: 5),
                                                                                                        child:
                                                                                                        DropdownButton(
                                                                                                          value: _selecteddianasc2,
                                                                                                          items: _dropdownMenuItemsdia2,
                                                                                                          style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                                          onTap: () {
                                                                                                            FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                                            if (!currentFocus.hasPrimaryFocus) {
                                                                                                              currentFocus.unfocus();
                                                                                                            }
                                                                                                          },
                                                                                                          onChanged: onChangeDropdownItemdia2,
                                                                                                        )),
                                                                                                    SizedBox(
                                                                                                      height: 20.0,
                                                                                                    ),
                                                                                                  ]),
                                                                                              Row(
                                                                                                  children: <Widget>[
                                                                                                    Container(
                                                                                                        padding: EdgeInsets.only(left: 5, right: 5),
                                                                                                        color: (_dataalterada2 ? Colors.white : Colors.redAccent),
                                                                                                        child:
                                                                                                        DropdownButton(
                                                                                                          value: _selectedmesnasc2,
                                                                                                          items: _dropdownMenuItemsmes2,
                                                                                                          style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                                          onTap: () {
                                                                                                            FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                                            if (!currentFocus.hasPrimaryFocus) {
                                                                                                              currentFocus.unfocus();
                                                                                                            }
                                                                                                          },
                                                                                                          onChanged: onChangeDropdownItemmes2,
                                                                                                          dropdownColor: Colors.white,
                                                                                                        )),
                                                                                                    SizedBox(
                                                                                                      height: 10.0,
                                                                                                    ),
                                                                                                  ]),
                                                                                              Row(
                                                                                                  children: <Widget>[
                                                                                                    Container(
                                                                                                        color: (_dataalterada2 ? Colors.white : Colors.redAccent),
                                                                                                        padding: EdgeInsets.only(left: 5, right: 5),
                                                                                                        child:  DropdownButton(
                                                                                                          value: _selectedanonasc2,
                                                                                                          items: _dropdownMenuItemsano2,
                                                                                                          onTap: () {
                                                                                                            FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                                            if (!currentFocus.hasPrimaryFocus) {
                                                                                                              currentFocus.unfocus();
                                                                                                            }
                                                                                                          },
                                                                                                          style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                                          onChanged: onChangeDropdownItemano2,
                                                                                                        )),
                                                                                                    SizedBox(
                                                                                                      height: 10.0,
                                                                                                    ),
                                                                                                  ])
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      )

                                                                                    ],
                                                                                  ),

                                                                                )
                                                                            ),
                                                                            SizedBox(height:hspace4),

                                                                          ]
                                                                      )
                                                                  )
                                                              ),
                                                              // NOME3_ botão
                                                              SizedBox(height:heightlua*0.02),

                                                            ])
                                                    )
                                                  ]
                                              ))
                                      ) : Container(),
                                      //
                                      // pagina Mostra imagem
                                      //
                                      //
                                     _page2 ?  Container(

                                          color: Colors.black,
                                          child:SingleChildScrollView(
                                              scrollDirection:  Axis.horizontal,
                                              child: Column(
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
                                                                    SizedBox(height: 10),
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
                                                                        height: _mostraImagem ? (h20p + 30) : 0,
                                                                        child: Column(
                                                                          children: <Widget>[
                                                                            //
                                                                            // NOME
                                                                            //

                                                                            Text(_nome == null ? "" : _nome,
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: nomeluasize,
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


                                                                            Text( _distanciaDb1.toString() == null ?  "Distância :  +00.00" : "Distância :  " + _distanciaDb1.toString()+ " Kms" ,
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: distanciasize,
                                                                              ),),
                                                                            SizedBox(height: 5),
                                                                            //
                                                                            // SIGNO
                                                                            //
                                                                            Text( "Lua na constelação de" ,
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: distanciasize * 0.6,
                                                                              ),),
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
                                                                    SizedBox(height: 10),
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
                                                                                      image: new AssetImage(_luadiaDb2 == null
                                                                                          ? _geraimage(00)
                                                                                          : _geraimage(_luadiaDb2)),
                                                                                      fit: BoxFit.cover)),
                                                                            )
                                                                        )

                                                                    ),
                                                                    Container(
                                                                        height: _mostraImagem ? (h20p + 30) : 0,
                                                                        child: Column(
                                                                          children: <Widget>[
                                                                            //
                                                                            // NOME
                                                                            //

                                                                            Text(_nome2 == null ? "" : _nome2,
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: nomeluasize,
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


                                                                            Text( _distanciaDb2.toString() == null ?  "Distância :  +00.00" : "Distância :  " + _distanciaDb2.toString()+ " Kms" ,
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: distanciasize,
                                                                              ),),
                                                                            SizedBox(height: 5),
                                                                            //
                                                                            // SIGNO
                                                                            //
                                                                            Text( "Lua na constelação de" ,
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: distanciasize * 0.6,
                                                                              ),),
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
                                                                  ])

                                                            ])
                                                    ),
                                                    //    SizedBox(height: 10),
                                                    //
                                                    //botoes tela magem
                                                  ])))
                                         :
                                         Container(),
                                    ]
                                )]))))
          ),
          ]))
    ));
  }
}

class dianasc {
  int id;
  String dia;

  dianasc(this.id, this.dia);

  static List<dianasc> getDia() {
    return <dianasc>[
      dianasc(0, 'Dia'),
      dianasc(1, '01'),
      dianasc(2, '02'),
      dianasc(3, '03'),
      dianasc(4, '04'),
      dianasc(5, '05'),
      dianasc(6, '06'),
      dianasc(7, '07'),
      dianasc(8, '08'),
      dianasc(9, '09'),
      dianasc(10, '10'),
      dianasc(11, '11'),
      dianasc(12, '12'),
      dianasc(13, '13'),
      dianasc(14, '14'),
      dianasc(15, '15'),
      dianasc(16, '16'),
      dianasc(17, '17'),
      dianasc(18, '18'),
      dianasc(19, '19'),
      dianasc(20, '20'),
      dianasc(21, '21'),
      dianasc(22, '22'),
      dianasc(23, '23'),
      dianasc(24, '24'),
      dianasc(25, '25'),
      dianasc(26, '26'),
      dianasc(27, '27'),
      dianasc(28, '28'),
      dianasc(29, '29'),
      dianasc(30, '30'),
      dianasc(31, '31')
    ];
  }
}

class anonasc {
  int id;
  int ano;

  anonasc(this.id, this.ano);

  static List<anonasc> getAno() {
    return <anonasc>[
      anonasc(0, 0000),
      anonasc(1,2021),
      anonasc(1, 2020),
      anonasc(2, 2019),
      anonasc(3, 2018),
      anonasc(4, 2017),
      anonasc(5, 2016),
      anonasc(6, 2015),
      anonasc(7, 2014),
      anonasc(8, 2013),
      anonasc(9, 2012),
      anonasc(10, 2011),
      anonasc(11, 2010),
      anonasc(12, 2009),
      anonasc(13, 2008),
      anonasc(14, 2007),
      anonasc(15, 2006),
      anonasc(16, 2005),
      anonasc(17, 2004),
      anonasc(18, 2003),
      anonasc(19, 2002),
      anonasc(20, 2001),
      anonasc(21, 2000),
      anonasc(22, 1999),
      anonasc(23, 1998),
      anonasc(24, 1997),
      anonasc(25, 1996),
      anonasc(26, 1995),
      anonasc(27, 1994),
      anonasc(28, 1993),
      anonasc(29, 1992),
      anonasc(30, 1991),
      anonasc(31, 1990),
      anonasc(32, 1989),
      anonasc(33, 1988),
      anonasc(34, 1987),
      anonasc(35, 1986),
      anonasc(36, 1985),
      anonasc(37, 1984),
      anonasc(38, 1983),
      anonasc(39, 1982),
      anonasc(40, 1981),
      anonasc(41, 1980),
      anonasc(42, 1979),
      anonasc(43, 1978),
      anonasc(44, 1977),
      anonasc(45, 1976),
      anonasc(46, 1975),
      anonasc(47, 1974),
      anonasc(48, 1973),
      anonasc(49, 1972),
      anonasc(50, 1971),
      anonasc(51, 1970),
      anonasc(52, 1969),
      anonasc(53, 1968),
      anonasc(54, 1967),
      anonasc(55, 1966),
      anonasc(56, 1965),
      anonasc(57, 1964),
      anonasc(58, 1963),
      anonasc(59, 1962),
      anonasc(60, 1961),
      anonasc(61, 1960),
      anonasc(62, 1959),
      anonasc(63, 1958),
      anonasc(64, 1957),
      anonasc(65, 1956),
      anonasc(66, 1955),
      anonasc(67, 1954),
      anonasc(68, 1953),
      anonasc(69, 1952),
      anonasc(70, 1951),
      anonasc(71, 1950),
      anonasc(72, 1949),
      anonasc(73, 1948),
      anonasc(74, 1947),
      anonasc(75, 1946),
      anonasc(76, 1945),
      anonasc(77, 1944),
      anonasc(78, 1943),
      anonasc(79, 1942),
      anonasc(80, 1941),
      anonasc(81, 1940),
      anonasc(82, 1939),
      anonasc(83, 1938),
      anonasc(84, 1937),
      anonasc(85, 1936),
      anonasc(86, 1935),
      anonasc(87, 1934),
      anonasc(88, 1933),
      anonasc(89, 1932),
      anonasc(90, 1931),
      anonasc(91, 1930),
      anonasc(92, 1929),
      anonasc(93, 1928),
      anonasc(94, 1927),
      anonasc(95, 1926),
      anonasc(96, 1925),
      anonasc(97, 1924),
      anonasc(98, 1923),
      anonasc(99, 1922),
      anonasc(100, 1921),
      anonasc(101, 1920),
      anonasc(102, 1919),
      anonasc(103, 1918),
      anonasc(104, 1917),
      anonasc(105, 1916),
      anonasc(106, 1915),
      anonasc(107, 1914),
      anonasc(108, 1913),
      anonasc(109, 1912),
      anonasc(110, 1911),
      anonasc(111, 1910),
      anonasc(112, 1909),
      anonasc(113, 1908),
      anonasc(114, 1907),
      anonasc(115, 1906),
      anonasc(116, 1905),
      anonasc(117, 1904),
      anonasc(118, 1903),
      anonasc(119, 1902),
      anonasc(120, 1901),
      anonasc(121, 1900),
    ];
  }
}

class mesnasc {
  int id;
  String mesTitle;
  String mes;

  mesnasc(this.id, this.mesTitle, this.mes);

  static List<mesnasc> getMes() {
    return <mesnasc>[
      mesnasc(0, 'Mes', '00'),
      mesnasc(1, 'Janeiro', '01'),
      mesnasc(2, 'Fevereiro', '02'),
      mesnasc(3, 'Março', '03'),
      mesnasc(4, 'Abril', '04'),
      mesnasc(5, 'Maio', '05'),
      mesnasc(6, 'Junho', '06'),
      mesnasc(7, 'Julho', '07'),
      mesnasc(8, 'Agosto', '08'),
      mesnasc(9, 'Setembro', '09'),
      mesnasc(10, 'Outubro', '10'),
      mesnasc(11, 'Novembro', '11'),
      mesnasc(12, 'Dezembro', '12')
    ];
  }
}

class dianasc2 {
  int id2;
  String dia2;

  dianasc2(this.id2, this.dia2);

  static List<dianasc2> getDia2() {
    return <dianasc2>[
      dianasc2(0, 'Dia'),
      dianasc2(1, '01'),
      dianasc2(2, '02'),
      dianasc2(3, '03'),
      dianasc2(4, '04'),
      dianasc2(5, '05'),
      dianasc2(6, '06'),
      dianasc2(7, '07'),
      dianasc2(8, '08'),
      dianasc2(9, '09'),
      dianasc2(10, '10'),
      dianasc2(11, '11'),
      dianasc2(12, '12'),
      dianasc2(13, '13'),
      dianasc2(14, '14'),
      dianasc2(15, '15'),
      dianasc2(16, '16'),
      dianasc2(17, '17'),
      dianasc2(18, '18'),
      dianasc2(19, '19'),
      dianasc2(20, '20'),
      dianasc2(21, '21'),
      dianasc2(22, '22'),
      dianasc2(23, '23'),
      dianasc2(24, '24'),
      dianasc2(25, '25'),
      dianasc2(26, '26'),
      dianasc2(27, '27'),
      dianasc2(28, '28'),
      dianasc2(29, '29'),
      dianasc2(30, '30'),
      dianasc2(31, '31')
    ];
  }
}

class anonasc2 {
  int id2;
  int ano2;

  anonasc2(this.id2, this.ano2);

  static List<anonasc2> getAno2() {
    return <anonasc2>[
      anonasc2(0, 0000),
      anonasc2(1,2021),
      anonasc2(1, 2020),
      anonasc2(2, 2019),
      anonasc2(3, 2018),
      anonasc2(4, 2017),
      anonasc2(5, 2016),
      anonasc2(6, 2015),
      anonasc2(7, 2014),
      anonasc2(8, 2013),
      anonasc2(9, 2012),
      anonasc2(10, 2011),
      anonasc2(11, 2010),
      anonasc2(12, 2009),
      anonasc2(13, 2008),
      anonasc2(14, 2007),
      anonasc2(15, 2006),
      anonasc2(16, 2005),
      anonasc2(17, 2004),
      anonasc2(18, 2003),
      anonasc2(19, 2002),
      anonasc2(20, 2001),
      anonasc2(21, 2000),
      anonasc2(22, 1999),
      anonasc2(23, 1998),
      anonasc2(24, 1997),
      anonasc2(25, 1996),
      anonasc2(26, 1995),
      anonasc2(27, 1994),
      anonasc2(28, 1993),
      anonasc2(29, 1992),
      anonasc2(30, 1991),
      anonasc2(31, 1990),
      anonasc2(32, 1989),
      anonasc2(33, 1988),
      anonasc2(34, 1987),
      anonasc2(35, 1986),
      anonasc2(36, 1985),
      anonasc2(37, 1984),
      anonasc2(38, 1983),
      anonasc2(39, 1982),
      anonasc2(40, 1981),
      anonasc2(41, 1980),
      anonasc2(42, 1979),
      anonasc2(43, 1978),
      anonasc2(44, 1977),
      anonasc2(45, 1976),
      anonasc2(46, 1975),
      anonasc2(47, 1974),
      anonasc2(48, 1973),
      anonasc2(49, 1972),
      anonasc2(50, 1971),
      anonasc2(51, 1970),
      anonasc2(52, 1969),
      anonasc2(53, 1968),
      anonasc2(54, 1967),
      anonasc2(55, 1966),
      anonasc2(56, 1965),
      anonasc2(57, 1964),
      anonasc2(58, 1963),
      anonasc2(59, 1962),
      anonasc2(60, 1961),
      anonasc2(61, 1960),
      anonasc2(62, 1959),
      anonasc2(63, 1958),
      anonasc2(64, 1957),
      anonasc2(65, 1956),
      anonasc2(66, 1955),
      anonasc2(67, 1954),
      anonasc2(68, 1953),
      anonasc2(69, 1952),
      anonasc2(70, 1951),
      anonasc2(71, 1950),
      anonasc2(72, 1949),
      anonasc2(73, 1948),
      anonasc2(74, 1947),
      anonasc2(75, 1946),
      anonasc2(76, 1945),
      anonasc2(77, 1944),
      anonasc2(78, 1943),
      anonasc2(79, 1942),
      anonasc2(80, 1941),
      anonasc2(81, 1940),
      anonasc2(82, 1939),
      anonasc2(83, 1938),
      anonasc2(84, 1937),
      anonasc2(85, 1936),
      anonasc2(86, 1935),
      anonasc2(87, 1934),
      anonasc2(88, 1933),
      anonasc2(89, 1932),
      anonasc2(90, 1931),
      anonasc2(91, 1930),
      anonasc2(92, 1929),
      anonasc2(93, 1928),
      anonasc2(94, 1927),
      anonasc2(95, 1926),
      anonasc2(96, 1925),
      anonasc2(97, 1924),
      anonasc2(98, 1923),
      anonasc2(99, 1922),
      anonasc2(100, 1921),
      anonasc2(101, 1920),
      anonasc2(102, 1919),
      anonasc2(103, 1918),
      anonasc2(104, 1917),
      anonasc2(105, 1916),
      anonasc2(106, 1915),
      anonasc2(107, 1914),
      anonasc2(108, 1913),
      anonasc2(109, 1912),
      anonasc2(110, 1911),
      anonasc2(111, 1910),
      anonasc2(112, 1909),
      anonasc2(113, 1908),
      anonasc2(114, 1907),
      anonasc2(115, 1906),
      anonasc2(116, 1905),
      anonasc2(117, 1904),
      anonasc2(118, 1903),
      anonasc2(119, 1902),
      anonasc2(120, 1901),
      anonasc2(121, 1900),
    ];
  }
}

class mesnasc2 {
  int id2;
  String mesTitle2;
  String mes2;

  mesnasc2(this.id2, this.mesTitle2, this.mes2);

  static List<mesnasc2> getMes2() {
    return <mesnasc2>[
      mesnasc2(0, 'Mes', '00'),
      mesnasc2(1, 'Janeiro', '01'),
      mesnasc2(2, 'Fevereiro', '02'),
      mesnasc2(3, 'Março', '03'),
      mesnasc2(4, 'Abril', '04'),
      mesnasc2(5, 'Maio', '05'),
      mesnasc2(6, 'Junho', '06'),
      mesnasc2(7, 'Julho', '07'),
      mesnasc2(8, 'Agosto', '08'),
      mesnasc2(9, 'Setembro', '09'),
      mesnasc2(10, 'Outubro', '10'),
      mesnasc2(11, 'Novembro', '11'),
      mesnasc2(12, 'Dezembro', '12')
    ];
  }
}
