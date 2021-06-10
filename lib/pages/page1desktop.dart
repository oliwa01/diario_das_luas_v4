import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:diario_das_luas/pages/principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:url_launcher/url_launcher.dart';

import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'dart:ui';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Comprar.dart';
import 'HomeDesktop.dart';
import 'Login.dart';
import 'SimuleDesktop.dart';



class Page1Desktop extends StatefulWidget {
  String nome;
  String email;
  Page1Desktop(this.nome,this.email);
  @override
  _Page1DesktopState createState() => _Page1DesktopState();
}

class _Page1DesktopState extends State<Page1Desktop> {
  //
  GlobalKey<ConvexAppBarState> _appBarKey1 = GlobalKey<ConvexAppBarState>();
  GlobalKey<ConvexAppBarState> _appBarKey2 = GlobalKey<ConvexAppBarState>();
  GlobalKey<ConvexAppBarState> _appBarKey3 = GlobalKey<ConvexAppBarState>();

//
  Animation<double> _animation;
  AnimationController _animationController;
//
  FocusNode myFocusNode;
  GlobalKey _containerKey = GlobalKey();
  bool loading = false;

  String _colorName = 'No';
  Color _color = Colors.black;

 String _dataPicket = " ";
  String _diadataPicket = "";
  String _mesdataPicket = "";
  String _anodataPicket = "";

  String _nome;

  bool _mostraLayout = true;
  bool _mostraImagem = false;
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
// DropBox
//
  List<dianasc> _diaDropdown = dianasc.getDia();
  List<mesnasc> _mesDropdown = mesnasc.getMes();
  List<anonasc> _anoDropdown = anonasc.getAno();

  List<DropdownMenuItem<dianasc>> _dropdownMenuItemsdia;
  dianasc _selecteddianasc;
  List<DropdownMenuItem<mesnasc>> _dropdownMenuItemsmes;
  mesnasc _selectedmesnasc;
  List<DropdownMenuItem<anonasc>> _dropdownMenuItemsano;
  anonasc _selectedanonasc;

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
  if((_diadataalterada == true) && (_mesdataalterada == true) && (_anodataalterada == true))
  {
    setState(() {
      _dataalterada = true;
    });
    _dataPicket = (_selectedanonasc.ano.toString()+_selectedmesnasc.mes.toString()+_selecteddianasc.dia.toString());
    _geraDados(_dataPicket);
  }
  if ((_nomealterado) && (_dataalterada))
  {_mostrabotaoimagem = true;} else
  {_mostrabotaoimagem = false;}
}
  //
  Future<void>_geraDados (String datalua) async {



    fs.Firestore luas = fb.firestore();
    fs.DocumentSnapshot documentSnapshot = await luas.collection("DiarioLuas").doc(datalua).get();
     var dadosdb = documentSnapshot.data();

  _salvaDados(dadosdb['DataDb'].toString(), dadosdb['SignosDb'], dadosdb['TimeDb'],dadosdb['ProximoDb'],dadosdb['LuadiaDb'], dadosdb['Distanciadb']);
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
      case 1 : return("1% Iluminação");break;
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

  //
  bool _page1 = true;
  bool _page2 = false;
  bool _page3 = false;
  bool _page4 = false;
  //
  void initState() {
    _dropdownMenuItemsdia = buildDropdownMenuItemsdia(_diaDropdown);
    _selecteddianasc = _dropdownMenuItemsdia[0].value;
    _dropdownMenuItemsmes = buildDropdownMenuItemsmes(_mesDropdown);
    _selectedmesnasc = _dropdownMenuItemsmes[0].value;
    _dropdownMenuItemsano = buildDropdownMenuItemsano(_anoDropdown);
    _selectedanonasc = _dropdownMenuItemsano[0].value;
    myFocusNode = FocusNode();

    super.initState();
  }
  //
  int _limite1 = 400;
  int _limite2 = 400;
  int _limite3 = 400;
  int _limite4 = 400;
  @override

  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    //
    bool portrait = (widthlua > 600 ? false: true);

    //
    int  luasize = (widthlua > 1200? _limite1: widthlua > 1000? _limite2 : widthlua > 800 ? _limite3 : _limite4);
    double  fatortitle    = portrait ? (heightlua  / 50) : (heightlua  / 25);

    double _fontmenu =
    (widthlua > 1600 ? 40 :
    widthlua > 1500 ?39 :
    widthlua > 1400 ?38 :
    widthlua > 1300 ?37 :
    widthlua > 1200 ?36 :
    widthlua > 1100 ?35 :
    widthlua > 1000 ?34 :
    widthlua > 900 ?33 :
    widthlua > 800 ?32 :
    widthlua > 700 ?30 : 26 );

    double titlesize = portrait ?
    (widthlua > 800 ? 20 : widthlua > 700 ? 19 : widthlua > 600 ? 18 : widthlua > 500 ? 17 : widthlua > 400 ? 16 : widthlua > 300 ? 15 : widthlua > 200 ? 14 : 12 )
                                  :
    (widthlua > 1600 ?30 :  widthlua > 1500 ?29 : widthlua > 1400 ?28 : widthlua > 1300 ?27 : widthlua > 1200 ?26 :
    widthlua > 1100 ?15 :  widthlua > 1000 ?14 : widthlua > 900 ?12 :  widthlua > 800 ?10 :  widthlua > 700 ?8 :6 );
    //
    double nomesize = portrait ?
    (widthlua > 800 ? 35 : widthlua > 700 ? 30 : widthlua > 600 ? 26 : widthlua > 500 ? 25 : widthlua > 400 ? 16 : widthlua > 300 ? 16 : widthlua > 200 ? 16 : 16 )
                                      :
    (widthlua > 2100 ? widthlua /45 : widthlua > 2000 ? widthlua /44 : widthlua > 1900 ? widthlua /43 : widthlua > 1800 ? widthlua /41 : widthlua > 1700 ? widthlua /40 :
    widthlua > 1600 ? widthlua /38 :  widthlua > 1500 ? widthlua /35 : widthlua > 1400 ? widthlua /33 :  widthlua > 1300 ? widthlua /32 : widthlua > 1200 ? widthlua /31 :
    widthlua > 1100 ? widthlua /30 :  widthlua > 1000 ? widthlua /29 :  widthlua > 900 ? widthlua /26 : widthlua > 800 ? widthlua /25 : widthlua > 700 ? widthlua /18 : widthlua /16 );
    //
    double boxnomeh = portrait ?
    (widthlua > 800 ? 60 : widthlua > 700 ? 50 : widthlua > 600 ? 45 : widthlua > 500 ? 45 : widthlua > 400 ? 40 : widthlua > 300 ? 38 : widthlua > 200 ? 30 : 30 )
        :
    (widthlua > 2100 ? widthlua /35 : widthlua > 2000 ? widthlua /34 : widthlua > 1900 ? widthlua /33 : widthlua > 1800 ? widthlua /32 : widthlua > 1700 ? widthlua /31 :
    widthlua > 1600 ? widthlua /30 :  widthlua > 1500 ? widthlua /29 : widthlua > 1400 ? widthlua /28 : widthlua > 1300 ? widthlua /27 : widthlua > 1200 ? widthlua /26 :
    widthlua > 1100 ? widthlua /25 :  widthlua > 1000 ? widthlua /24 : widthlua > 900 ? widthlua /22 :  widthlua > 800 ? widthlua /20 :  widthlua > 700 ? widthlua /18 : widthlua /16 );
    //
    double hbox = heightlua*0.08; // box nome e data
    double hbox0 = heightlua * 0.400; // box fundo branco tranparente sem botão
    double hbox1 = heightlua * 0.36; // box fundo branco tranparente
    double hspace0 = heightlua * 0.03; //box espaçoantes nome
    double hspace1 = heightlua * 0.02;
    double hspace2 =  (widthlua > 1400 ? heightlua * 0.05 : widthlua > 1200 ? heightlua *0.04 : widthlua > 1000 ? heightlua *0.035 : widthlua > 900 ? heightlua *0.03 : widthlua > 300 ? heightlua *0.03 : heightlua *0.02);
    double hspace3 = heightlua * 0.005;
    double hspace4 = heightlua * 0.02;
    //
    double  h60p = heightlua * 0.60;
    double  h80p = heightlua * 1.20;
    double  h20p = heightlua * 0.20;
    double  h10p = heightlua * 0.10;
    //
    double nomeluasize = heightlua /40;
    double datasize = heightlua /46;
    double tipoluasize = heightlua / 57;
    double distanciasize = heightlua /60;
    double signowsize = portrait ? (widthlua / 4): ( widthlua /3 );
    double signohsize = portrait ? (heightlua / 22): ( heightlua /20 );
    double tipoluzsize = heightlua / 65;
    double  boxnome       = portrait ? (widthlua - 160): ( widthlua - 60 );
    double  fontsizetitle = portrait ?  35 : 40;
    //
     _dataalterada =  ((_diadataalterada == true) && (_mesdataalterada == true) && (_anodataalterada == true)) ? true : false;
    _dataPicket =("$_anodataPicket$_mesdataPicket$_diadataPicket");
    return FocusWatcher(
      child: Scaffold(
          backgroundColor: Colors.black,
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
                  child:  Image.asset( "assets/images/iconseta.png",
                width: 12, height: 12
                , // add custom icons also
              ))),
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
                                       widget.nome,
                                       widget.email,
                                       1,
                                       "",
                                       _dataDb1,
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       _nome,
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       _distanciaDb1,
                                       0.0,
                                       0.0,
                                       0.0,
                                       0.0,
                                       0.0,
                                       _luadiaDb1,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       _proximoDb1,
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       _signoDb1,
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       _timeDb1,
                                       "",
                                       "",
                                       "",
                                       "",
                                       ""
                                   )
                           ));
                     }
                     else {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) =>
                                   Comprar(
                                       widget.nome,
                                       widget.email,
                                       1,
                                       "",
                                       _dataDb1,
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       _nome,
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       _distanciaDb1,
                                       0.0,
                                       0.0,
                                       0.0,
                                       0.0,
                                       0.0,
                                       _luadiaDb1,
                                       0,
                                       0,
                                       0,
                                       0,
                                       0,
                                       _proximoDb1,
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       _signoDb1,
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       _timeDb1,
                                       "",
                                       "",
                                       "",
                                       "",
                                       ""
                                   )
                           ));
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
                        if ((_limite1 > 700) ||(_limite2 > 700) ||(_limite3 > 700) ||(_limite4 > 700) ) {
                        _limite1 =  700;
                        _limite2 =  700;
                        _limite3 =  700;
                        _limite4 =  700;
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

          //Menu Botoes

    body:Container(
      width: widthlua,
      height: heightlua,
      child: Column(
    children: <Widget>[
    Container(
    height: heightlua * 0.80,
     child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView( // horizontal scroll widget
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView( // vertical scroll widget
                scrollDirection: Axis.vertical,
                child: Column(
            children: <Widget>[
              //
              // Pagina entrada de dados
              //
              //
              Visibility(
                visible: _page1,
                child:
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/fundodatas.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child :Column(
                      children:<Widget> [
                        SizedBox(height: heightlua*0.29),
                        Container(
                            width: widthlua * 0.90,
                            height: hbox1,

                            child: Container(
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
                                                        height: hbox + 40,
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
                                                                  if ((_nomealterado) && (_dataalterada))
                                                                  {_mostrabotaoimagem = true;} else
                                                                  {_mostrabotaoimagem = false;}
                                                                });}
                                                            },
                                                            decoration: InputDecoration(
                                                              //  labelText: "Nome Completo",
                                                              border: InputBorder.none,
                                                              hintText: 'Nome Completo',
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
                                                "Data Nascimento", textAlign: TextAlign.center,
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
                                                      width:  widthlua*0.7,
                                                      height: hbox,
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
                                                                      padding: EdgeInsets.only(left: 1, right: 1),
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
                                                                      padding: EdgeInsets.only(left: 1, right: 1),
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
                                                                      padding: EdgeInsets.only(left: 1, right: 1),
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
                                        ]
                                    )
                                )
                            )
                        )
                      ]
                  )
              )),
              //
              // pagina Mostra imagem
              //
              //
                Visibility(
                    visible: _page2,
                    child:
              Container(
                color: Colors.black,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                       RepaintBoundary(
                      key: _containerKey,
                      child: Column(
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
                      width: _mostraImagem ? luasize: 0,
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
                      ])
                      ),
                      //    SizedBox(height: 10),
                  //
                  //botoes tela magem
                  //


              ]))),

          ]
         ))
      ))),
//xxxxxx
        Visibility(
            visible: _page2,
            child: Container()


        )
//xxxxx

    ]))));
  }

}
// Alert custom content
_onBasicAlertPressed(context) {
  // Reusable alert style
  var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
      constraints: BoxConstraints.expand(width: 300),
      //First to chars "55" represents transparency of color
      overlayColor: Color(0x55000000),
      alertElevation: 0,
      alertAlignment: Alignment.topCenter
  );

  // Alert dialog using custom alert style
  Alert(
    context: context,
    style: alertStyle,
    type: AlertType.info,
    title: "IMAGEM MODIFICADA",
    desc: "Esta imagem foi modificada na proporção e qualidade, para se adequar ao dispositivo utilizado e facilitar a visualização da foto.",
    buttons: [
      DialogButton(
        child: Text(
          "Fechar",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Color.fromRGBO(0, 179, 134, 1.0),
        radius: BorderRadius.circular(0.0),
      ),
    ],
  ).show();
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
      anonasc(0,0000),
      anonasc(1,2021),
      anonasc(1,2020),
      anonasc(2,2019),
      anonasc(3,2018),
      anonasc(4,2017),
      anonasc(5,2016),
      anonasc(6,2015),
      anonasc(7,2014),
      anonasc(8,2013),
      anonasc(9,2012),
      anonasc(10,2011),
      anonasc(11,2010),
      anonasc(12,2009),
      anonasc(13,2008),
      anonasc(14,2007),
      anonasc(15,2006),
      anonasc(16,2005),
      anonasc(17,2004),
      anonasc(18,2003),
      anonasc(19,2002),
      anonasc(20,2001),
      anonasc(21,2000),
      anonasc(22,1999),
      anonasc(23,1998),
      anonasc(24,1997),
      anonasc(25,1996),
      anonasc(26,1995),
      anonasc(27,1994),
      anonasc(28,1993),
      anonasc(29,1992),
      anonasc(30,1991),
      anonasc(31,1990),
      anonasc(32,1989),
      anonasc(33,1988),
      anonasc(34,1987),
      anonasc(35,1986),
      anonasc(36,1985),
      anonasc(37,1984),
      anonasc(38,1983),
      anonasc(39,1982),
      anonasc(40,1981),
      anonasc(41,1980),
      anonasc(42,1979),
      anonasc(43,1978),
      anonasc(44,1977),
      anonasc(45,1976),
      anonasc(46,1975),
      anonasc(47,1974),
      anonasc(48,1973),
      anonasc(49,1972),
      anonasc(50,1971),
      anonasc(51,1970),
      anonasc(52,1969),
      anonasc(53,1968),
      anonasc(54,1967),
      anonasc(55,1966),
      anonasc(56,1965),
      anonasc(57,1964),
      anonasc(58,1963),
      anonasc(59,1962),
      anonasc(60,1961),
      anonasc(61,1960),
      anonasc(62,1959),
      anonasc(63,1958),
      anonasc(64,1957),
      anonasc(65,1956),
      anonasc(66,1955),
      anonasc(67,1954),
      anonasc(68,1953),
      anonasc(69,1952),
      anonasc(70,1951),
      anonasc(71,1950),
      anonasc(72,1949),
      anonasc(73,1948),
      anonasc(74,1947),
      anonasc(75,1946),
      anonasc(76,1945),
      anonasc(77,1944),
      anonasc(78,1943),
      anonasc(79,1942),
      anonasc(80,1941),
      anonasc(81,1940),
      anonasc(82,1939),
      anonasc(83,1938),
      anonasc(84,1937),
      anonasc(85,1936),
      anonasc(86,1935),
      anonasc(87,1934),
      anonasc(88,1933),
      anonasc(89,1932),
      anonasc(90,1931),
      anonasc(91,1930),
      anonasc(92,1929),
      anonasc(93,1928),
      anonasc(94,1927),
      anonasc(95,1926),
      anonasc(96,1925),
      anonasc(97,1924),
      anonasc(98,1923),
      anonasc(99,1922),
      anonasc(100,1921),
      anonasc(101,1920),
      anonasc(102,1919),
      anonasc(103,1918),
      anonasc(104,1917),
      anonasc(105,1916),
      anonasc(106,1915),
      anonasc(107,1914),
      anonasc(108,1913),
      anonasc(109,1912),
      anonasc(110,1911),
      anonasc(111,1910),
      anonasc(112,1909),
      anonasc(113,1908),
      anonasc(114,1907),
      anonasc(115,1906),
      anonasc(116,1905),
      anonasc(117,1904),
      anonasc(118,1903),
      anonasc(119,1902),
      anonasc(120,1901),
      anonasc(121,1900),

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
      mesnasc(0, 'Mes','00'),
      mesnasc(1, 'Janeiro','01'),
      mesnasc(2, 'Fevereiro','02'),
      mesnasc(3, 'Março','03'),
      mesnasc(4, 'Abril','04'),
      mesnasc(5, 'Maio','05'),
      mesnasc(6, 'Junho','06'),
      mesnasc(7, 'Julho','07'),
      mesnasc(8, 'Agosto','08'),
      mesnasc(9, 'Setembro','09'),
      mesnasc(10, 'Outubro', '10'),
      mesnasc(11, 'Novembro', '11'),
      mesnasc(12, 'Dezembro', '12')


    ];
  }
}
