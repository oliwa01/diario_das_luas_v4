
import 'dart:html';
import 'package:diario_das_luas/pages/principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;

import 'dart:ui';

import 'Comprar.dart';
import 'Login.dart';
import 'SimuleDesktop.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Page6Desktop extends StatefulWidget {
  String nome;
  String email;
  Page6Desktop(this.nome,this.email);
  @override
  _Page6DesktopState createState() => _Page6DesktopState();
}

class _Page6DesktopState extends State<Page6Desktop> {
  GlobalKey _containerKey = GlobalKey();
  bool loading = false;
  GlobalKey<ConvexAppBarState> _appBarKey1 = GlobalKey<ConvexAppBarState>();
  GlobalKey<ConvexAppBarState> _appBarKey2 = GlobalKey<ConvexAppBarState>();
  GlobalKey<ConvexAppBarState> _appBarKey3 = GlobalKey<ConvexAppBarState>();
  String  _launched;

  String _dataPicket = " ";
  String _dataPicket2 = " ";
  String _dataPicket3 = " ";
  String _dataPicket4= " ";
  String _dataPicket5= " ";
  String _dataPicket6= " ";
  String _nome;
  String _nome2;
  String _nome3;
  String _nome4;
  String _nome5;
  String _nome6;

  String _nomefamilia;
  bool _nomefamiliaalterado = false;

  bool _nomealterado = false;
  bool _dataalterada = false;

  bool _nomealterado2 = false;
  bool _dataalterada2 = false;

  bool _nomealterado3 = false;
  bool _dataalterada3 = false;

  bool _nomealterado4 = false;
  bool _dataalterada4 = false;

  bool _nomealterado5 = false;
  bool _dataalterada5 = false;

  bool _nomealterado6 = false;
  bool _dataalterada6 = false;
//
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


  bool _diadataalterada4 = false;
  bool _mesdataalterada4 = false;
  bool _anodataalterada4 = false;

  bool _diadataalterada5 = false;
  bool _mesdataalterada5 = false;
  bool _anodataalterada5 = false;

  bool _diadataalterada6 = false;
  bool _mesdataalterada6 = false;
  bool _anodataalterada6 = false;
  //

  //
  bool _mostraLayout = true;
  bool _mostraImagem = false;
  bool _mostrabotaoimagem = false;
  //


  String _dataDb1;
  String _proximoDb1 = " ";
  String _signoDb1 = " ";
  String _timeDb1 = " ";
  double _distanciaDb1;
  int _luadiaDb1 = 0;


  String _dataDb2;
  String _timeDb2 = " ";
  String _proximoDb2 = " ";
  String _signoDb2 = " ";
  double _distanciaDb2;
  int _luadiaDb2 = 0;


  String _dataDb3;
  String _timeDb3 = " ";
  String _proximoDb3 = " ";
  String _signoDb3 = " ";
  double _distanciaDb3;
  int _luadiaDb3 = 0;

  String _dataDb4;
  String _timeDb4 = " ";
  String _proximoDb4 = " ";
  String _signoDb4 = " ";
  double _distanciaDb4;
  int _luadiaDb4 = 0;


  String _dataDb5;
  String _timeDb5 = " ";
  String _proximoDb5 = " ";
  String _signoDb5 = " ";
  double _distanciaDb5;
  int _luadiaDb5 = 0;


  String _dataDb6;
  String _timeDb6 = " ";
  String _proximoDb6 = " ";
  String _signoDb6 = " ";
  double _distanciaDb6;
  int _luadiaDb6 = 0;

//
//
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
  //
  List<dianasc3> _diaDropdown3 = dianasc3.getDia3();
  List<mesnasc3> _mesDropdown3 = mesnasc3.getMes3();
  List<anonasc3> _anoDropdown3 = anonasc3.getAno3();
  //
  List<dianasc4> _diaDropdown4 = dianasc4.getDia4();
  List<mesnasc4> _mesDropdown4 = mesnasc4.getMes4();
  List<anonasc4> _anoDropdown4 = anonasc4.getAno4();
  //
  List<dianasc5> _diaDropdown5 = dianasc5.getDia5();
  List<mesnasc5> _mesDropdown5 = mesnasc5.getMes5();
  List<anonasc5> _anoDropdown5 = anonasc5.getAno5();
  //
  List<dianasc6> _diaDropdown6 = dianasc6.getDia6();
  List<mesnasc6> _mesDropdown6 = mesnasc6.getMes6();
  List<anonasc6> _anoDropdown6 = anonasc6.getAno6();
  //
  //
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
  //
  List<DropdownMenuItem<dianasc3>> _dropdownMenuItemsdia3;
  dianasc3 _selecteddianasc3;
  List<DropdownMenuItem<mesnasc3>> _dropdownMenuItemsmes3;
  mesnasc3 _selectedmesnasc3;
  List<DropdownMenuItem<anonasc3>> _dropdownMenuItemsano3;
  anonasc3 _selectedanonasc3;
  //
  List<DropdownMenuItem<dianasc4>> _dropdownMenuItemsdia4;
  dianasc4 _selecteddianasc4;
  List<DropdownMenuItem<mesnasc4>> _dropdownMenuItemsmes4;
  mesnasc4 _selectedmesnasc4;
  List<DropdownMenuItem<anonasc4>> _dropdownMenuItemsano4;
  anonasc4 _selectedanonasc4;
  //
  List<DropdownMenuItem<dianasc5>> _dropdownMenuItemsdia5;
  dianasc5 _selecteddianasc5;
  List<DropdownMenuItem<mesnasc5>> _dropdownMenuItemsmes5;
  mesnasc5 _selectedmesnasc5;
  List<DropdownMenuItem<anonasc5>> _dropdownMenuItemsano5;
  anonasc5 _selectedanonasc5;
  //
  List<DropdownMenuItem<dianasc6>> _dropdownMenuItemsdia6;
  dianasc6 _selecteddianasc6;
  List<DropdownMenuItem<mesnasc6>> _dropdownMenuItemsmes6;
  mesnasc6 _selectedmesnasc6;
  List<DropdownMenuItem<anonasc6>> _dropdownMenuItemsano6;
  anonasc6 _selectedanonasc6;
  //
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
  //
  List<DropdownMenuItem<dianasc3>> buildDropdownMenuItemsdia3(List dia3) {
    List<DropdownMenuItem<dianasc3>> items = List();
    for (dianasc3 dianascimento3 in dia3) {
      items.add(
        DropdownMenuItem(
          value: dianascimento3,
          child: Text(dianascimento3.dia3),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<mesnasc3>> buildDropdownMenuItemsmes3(List mes3) {
    List<DropdownMenuItem<mesnasc3>> items = List();
    for (mesnasc3 mesnascimento3 in mes3) {
      items.add(
        DropdownMenuItem(
          value: mesnascimento3,
          child: Text(mesnascimento3.mesTitle3),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<anonasc3>> buildDropdownMenuItemsano3(List ano3) {
    List<DropdownMenuItem<anonasc3>> items = List();
    for (anonasc3 anonascimento3 in ano3) {
      items.add(
        DropdownMenuItem(
          value: anonascimento3,
          child: Text(anonascimento3.ano3.toString()),
        ),
      );
    }
    return items;
  }
  //
  List<DropdownMenuItem<dianasc4>> buildDropdownMenuItemsdia4(List dia4) {
    List<DropdownMenuItem<dianasc4>> items = List();
    for (dianasc4 dianascimento4 in dia4) {
      items.add(
        DropdownMenuItem(
          value: dianascimento4,
          child: Text(dianascimento4.dia4),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<mesnasc4>> buildDropdownMenuItemsmes4(List mes4) {
    List<DropdownMenuItem<mesnasc4>> items = List();
    for (mesnasc4 mesnascimento4 in mes4) {
      items.add(
        DropdownMenuItem(
          value: mesnascimento4,
          child: Text(mesnascimento4.mesTitle4),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<anonasc4>> buildDropdownMenuItemsano4(List ano4) {
    List<DropdownMenuItem<anonasc4>> items = List();
    for (anonasc4 anonascimento4 in ano4) {
      items.add(
        DropdownMenuItem(
          value: anonascimento4,
          child: Text(anonascimento4.ano4.toString()),
        ),
      );
    }
    return items;
  }
  //
  List<DropdownMenuItem<dianasc5>> buildDropdownMenuItemsdia5(List dia5) {
    List<DropdownMenuItem<dianasc5>> items = List();
    for (dianasc5 dianascimento5 in dia5) {
      items.add(
        DropdownMenuItem(
          value: dianascimento5,
          child: Text(dianascimento5.dia5),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<mesnasc5>> buildDropdownMenuItemsmes5(List mes5) {
    List<DropdownMenuItem<mesnasc5>> items = List();
    for (mesnasc5 mesnascimento5 in mes5) {
      items.add(
        DropdownMenuItem(
          value: mesnascimento5,
          child: Text(mesnascimento5.mesTitle5),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<anonasc5>> buildDropdownMenuItemsano5(List ano5) {
    List<DropdownMenuItem<anonasc5>> items = List();
    for (anonasc5 anonascimento5 in ano5) {
      items.add(
        DropdownMenuItem(
          value: anonascimento5,
          child: Text(anonascimento5.ano5.toString()),
        ),
      );
    }
    return items;
  }
  //
  List<DropdownMenuItem<dianasc6>> buildDropdownMenuItemsdia6(List dia6) {
    List<DropdownMenuItem<dianasc6>> items = List();
    for (dianasc6 dianascimento6 in dia6) {
      items.add(
        DropdownMenuItem(
          value: dianascimento6,
          child: Text(dianascimento6.dia6),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<mesnasc6>> buildDropdownMenuItemsmes6(List mes6) {
    List<DropdownMenuItem<mesnasc6>> items = List();
    for (mesnasc6 mesnascimento6 in mes6) {
      items.add(
        DropdownMenuItem(
          value: mesnascimento6,
          child: Text(mesnascimento6.mesTitle6),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<anonasc6>> buildDropdownMenuItemsano6(List ano6) {
    List<DropdownMenuItem<anonasc6>> items = List();
    for (anonasc6 anonascimento6 in ano6) {
      items.add(
        DropdownMenuItem(
          value: anonascimento6,
          child: Text(anonascimento6.ano6.toString()),
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
    if ((_nomealterado) &&
        (_dataalterada) &&
        (_nomealterado2) &&
        (_dataalterada2) &&
        (_nomealterado3) &&
        (_dataalterada3) &&
        (_nomealterado4) &&
        (_dataalterada4) &&
        (_nomealterado5) &&
        (_dataalterada5) &&
        (_nomealterado6) &&
        (_dataalterada6) &&
        (_nomefamiliaalterado))
    {_mostrabotaoimagem = true;} else
    {_mostrabotaoimagem = false;}

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
    if((_diadataalterada2 == true) && (_mesdataalterada2 == true) && (_anodataalterada2 == true))
    {
      setState(() {
        _dataalterada2 = true;
      });
      _dataPicket2 = (_selectedanonasc2.ano2.toString()+_selectedmesnasc2.mes2.toString()+_selecteddianasc2.dia2.toString());
      _geraDados2(_dataPicket2);
    }
    if ((_nomealterado) &&
        (_dataalterada) &&
        (_nomealterado2) &&
        (_dataalterada2) &&
        (_nomealterado3) &&
        (_dataalterada3) &&
        (_nomealterado4) &&
        (_dataalterada4) &&
        (_nomealterado5) &&
        (_dataalterada5) &&
        (_nomealterado6) &&
        (_dataalterada6) &&
        (_nomefamiliaalterado))
    {_mostrabotaoimagem = true;} else
    {_mostrabotaoimagem = false;}

  }
//
  //
  onChangeDropdownItemdia3(dianasc3 selecteddianasc3) {
    setState(() {
      _selecteddianasc3 = selecteddianasc3;
      _diadataalterada3 = true;
    });
    _verificaBotaoGeraImage3();
  }

  onChangeDropdownItemmes3(mesnasc3 selectedmesnasc3) {
    setState(() {
      _selectedmesnasc3 = selectedmesnasc3;
      _mesdataalterada3 = true;
    });
    _verificaBotaoGeraImage3();
  }

  onChangeDropdownItemano3(anonasc3 selectedanonasc3) {
    setState(() {
      _selectedanonasc3 = selectedanonasc3;
      _anodataalterada3 = true;
    });
    _verificaBotaoGeraImage3();
  }

  _verificaBotaoGeraImage3() {
    if((_diadataalterada3 == true) && (_mesdataalterada3 == true) && (_anodataalterada3 == true))
    {
      setState(() {
        _dataalterada3 = true;
      });
      _dataPicket3 = (_selectedanonasc3.ano3.toString()+_selectedmesnasc3.mes3.toString()+_selecteddianasc3.dia3.toString());
      _geraDados3(_dataPicket3);
    }
    if ((_nomealterado) &&
        (_dataalterada) &&
        (_nomealterado2) &&
        (_dataalterada2) &&
        (_nomealterado3) &&
        (_dataalterada3) &&
        (_nomealterado4) &&
        (_dataalterada4) &&
        (_nomealterado5) &&
        (_dataalterada5) &&
        (_nomealterado6) &&
        (_dataalterada6) &&
        (_nomefamiliaalterado))
    {_mostrabotaoimagem = true;} else
    {_mostrabotaoimagem = false;}

  }
  //
  onChangeDropdownItemdia4(dianasc4 selecteddianasc4) {
    setState(() {
      _selecteddianasc4 = selecteddianasc4;
      _diadataalterada4 = true;
    });
    _verificaBotaoGeraImage4();
  }

  onChangeDropdownItemmes4(mesnasc4 selectedmesnasc4) {
    setState(() {
      _selectedmesnasc4 = selectedmesnasc4;
      _mesdataalterada4 = true;
    });
    _verificaBotaoGeraImage4();
  }

  onChangeDropdownItemano4(anonasc4 selectedanonasc4) {
    setState(() {
      _selectedanonasc4 = selectedanonasc4;
      _anodataalterada4 = true;
    });
    _verificaBotaoGeraImage4();
  }

  _verificaBotaoGeraImage4() {
    if((_diadataalterada4 == true) && (_mesdataalterada4 == true) && (_anodataalterada4 == true))
    {
      setState(() {
        _dataalterada4 = true;
      });
      _dataPicket4 = (_selectedanonasc4.ano4.toString()+_selectedmesnasc4.mes4.toString()+_selecteddianasc4.dia4.toString());
      _geraDados4(_dataPicket4);
    }
    if ((_nomealterado) &&
        (_dataalterada) &&
        (_nomealterado2) &&
        (_dataalterada2) &&
        (_nomealterado3) &&
        (_dataalterada3) &&
        (_nomealterado4) &&
        (_dataalterada4) &&
        (_nomealterado5) &&
        (_dataalterada5) &&
        (_nomealterado6) &&
        (_dataalterada6) &&
        (_nomefamiliaalterado))
    {_mostrabotaoimagem = true;} else
    {_mostrabotaoimagem = false;}

  }
  //
  onChangeDropdownItemdia5(dianasc5 selecteddianasc5) {
    setState(() {
      _selecteddianasc5 = selecteddianasc5;
      _diadataalterada5 = true;
    });
    _verificaBotaoGeraImage5();
  }

  onChangeDropdownItemmes5(mesnasc5 selectedmesnasc5) {
    setState(() {
      _selectedmesnasc5 = selectedmesnasc5;
      _mesdataalterada5 = true;
    });
    _verificaBotaoGeraImage5();
  }

  onChangeDropdownItemano5(anonasc5 selectedanonasc5) {
    setState(() {
      _selectedanonasc5 = selectedanonasc5;
      _anodataalterada5 = true;
    });
    _verificaBotaoGeraImage5();
  }

  _verificaBotaoGeraImage5() {
    if((_diadataalterada5 == true) && (_mesdataalterada5 == true) && (_anodataalterada5 == true))
    {
      setState(() {
        _dataalterada5 = true;
      });
      _dataPicket5 = (_selectedanonasc5.ano5.toString()+_selectedmesnasc5.mes5.toString()+_selecteddianasc5.dia5.toString());
      _geraDados5(_dataPicket5);
    }
    if ((_nomealterado) &&
        (_dataalterada) &&
        (_nomealterado2) &&
        (_dataalterada2) &&
        (_nomealterado3) &&
        (_dataalterada3) &&
        (_nomealterado4) &&
        (_dataalterada4) &&
        (_nomealterado5) &&
        (_dataalterada5) &&
        (_nomealterado6) &&
        (_dataalterada6) &&
        (_nomefamiliaalterado))
    {_mostrabotaoimagem = true;} else
    {_mostrabotaoimagem = false;}

  }
//
  onChangeDropdownItemdia6(dianasc6 selecteddianasc6) {
    setState(() {
      _selecteddianasc6 = selecteddianasc6;
      _diadataalterada6 = true;
    });
    _verificaBotaoGeraImage6();
  }

  onChangeDropdownItemmes6(mesnasc6 selectedmesnasc6) {
    setState(() {
      _selectedmesnasc6 = selectedmesnasc6;
      _mesdataalterada6 = true;
    });
    _verificaBotaoGeraImage6();
  }

  onChangeDropdownItemano6(anonasc6 selectedanonasc6) {
    setState(() {
      _selectedanonasc6 = selectedanonasc6;
      _anodataalterada6 = true;
    });
    _verificaBotaoGeraImage6();
  }

  _verificaBotaoGeraImage6() {
    if((_diadataalterada6 == true) && (_mesdataalterada6 == true) && (_anodataalterada6 == true))
    {
      setState(() {
        _dataalterada6 = true;
      });
      _dataPicket6 = (_selectedanonasc6.ano6.toString()+_selectedmesnasc6.mes6.toString()+_selecteddianasc6.dia6.toString());
      _geraDados6(_dataPicket6);
    }
    if ((_nomealterado) &&
        (_dataalterada) &&
        (_nomealterado2) &&
        (_dataalterada2) &&
        (_nomealterado3) &&
        (_dataalterada3) &&
        (_nomealterado4) &&
        (_dataalterada4) &&
        (_nomealterado5) &&
        (_dataalterada5) &&
        (_nomealterado6) &&
        (_dataalterada6) &&
        (_nomefamiliaalterado))
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

  Future<void>_geraDados2 (String datalua) async {



    fs.Firestore luas = fb.firestore();
    fs.DocumentSnapshot documentSnapshot = await luas.collection("DiarioLuas").doc(datalua).get();
    var dadosdb = documentSnapshot.data();

    _salvaDados2(dadosdb['DataDb'].toString(), dadosdb['SignosDb'], dadosdb['TimeDb'],dadosdb['ProximoDb'],dadosdb['LuadiaDb'], dadosdb['Distanciadb']);
  }

  Future<void>_geraDados3 (String datalua) async {



    fs.Firestore luas = fb.firestore();
    fs.DocumentSnapshot documentSnapshot = await luas.collection("DiarioLuas").doc(datalua).get();
    var dadosdb = documentSnapshot.data();

    _salvaDados3(dadosdb['DataDb'].toString(), dadosdb['SignosDb'], dadosdb['TimeDb'],dadosdb['ProximoDb'],dadosdb['LuadiaDb'], dadosdb['Distanciadb']);
  }

  Future<void>_geraDados4 (String datalua) async {



    fs.Firestore luas = fb.firestore();
    fs.DocumentSnapshot documentSnapshot = await luas.collection("DiarioLuas").doc(datalua).get();
    var dadosdb = documentSnapshot.data();

    _salvaDados4(dadosdb['DataDb'].toString(), dadosdb['SignosDb'], dadosdb['TimeDb'],dadosdb['ProximoDb'],dadosdb['LuadiaDb'], dadosdb['Distanciadb']);
  }

  Future<void>_geraDados5 (String datalua) async {
    fs.Firestore luas = fb.firestore();
    fs.DocumentSnapshot documentSnapshot = await luas.collection("DiarioLuas").doc(datalua).get();
    var dadosdb = documentSnapshot.data();

    _salvaDados5(dadosdb['DataDb'].toString(), dadosdb['SignosDb'], dadosdb['TimeDb'],dadosdb['ProximoDb'],dadosdb['LuadiaDb'], dadosdb['Distanciadb']);
  }

  Future<void>_geraDados6 (String datalua) async {
    fs.Firestore luas = fb.firestore();
    fs.DocumentSnapshot documentSnapshot = await luas.collection("DiarioLuas").doc(datalua).get();
    var dadosdb = documentSnapshot.data();

    _salvaDados6(dadosdb['DataDb'].toString(), dadosdb['SignosDb'], dadosdb['TimeDb'],dadosdb['ProximoDb'],dadosdb['LuadiaDb'], dadosdb['Distanciadb']);
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

  _salvaDados3(String datadb, String signodb, String timedb, String proximodb,
      int luadiadb, double distanciadb) {
    setState(() {

      _dataDb3 = datadb;
      _signoDb3 = signodb;
      _timeDb3 = timedb;
      _distanciaDb3 = distanciadb;
      _luadiaDb3 = luadiadb;
      _proximoDb3 = proximodb;
    });
  }

  _salvaDados4(String datadb, String signodb, String timedb, String proximodb,
      int luadiadb, double distanciadb) {
    setState(() {

      _dataDb4 = datadb;
      _signoDb4 = signodb;
      _timeDb4 = timedb;
      _distanciaDb4 = distanciadb;
      _luadiaDb4 = luadiadb;
      _proximoDb4 = proximodb;
    });
  }

  _salvaDados5(String datadb, String signodb, String timedb, String proximodb,
      int luadiadb, double distanciadb) {
    setState(() {

      _dataDb5 = datadb;
      _signoDb5 = signodb;
      _timeDb5 = timedb;
      _distanciaDb5 = distanciadb;
      _luadiaDb5 = luadiadb;
      _proximoDb5 = proximodb;
    });
  }

  _salvaDados6(String datadb, String signodb, String timedb, String proximodb,
      int luadiadb, double distanciadb) {
    setState(() {

      _dataDb6 = datadb;
      _signoDb6 = signodb;
      _timeDb6 = timedb;
      _distanciaDb6 = distanciadb;
      _luadiaDb6 = luadiadb;
      _proximoDb6 = proximodb;
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
    //
    _dropdownMenuItemsdia3 = buildDropdownMenuItemsdia3(_diaDropdown3);
    _selecteddianasc3 = _dropdownMenuItemsdia3[0].value;
    _dropdownMenuItemsmes3 = buildDropdownMenuItemsmes3(_mesDropdown3);
    _selectedmesnasc3 = _dropdownMenuItemsmes3[0].value;
    _dropdownMenuItemsano3 = buildDropdownMenuItemsano3(_anoDropdown3);
    _selectedanonasc3 = _dropdownMenuItemsano3[0].value;
    //
    _dropdownMenuItemsdia4 = buildDropdownMenuItemsdia4(_diaDropdown4);
    _selecteddianasc4 = _dropdownMenuItemsdia4[0].value;
    _dropdownMenuItemsmes4 = buildDropdownMenuItemsmes4(_mesDropdown4);
    _selectedmesnasc4 = _dropdownMenuItemsmes4[0].value;
    _dropdownMenuItemsano4 = buildDropdownMenuItemsano4(_anoDropdown4);
    _selectedanonasc4 = _dropdownMenuItemsano4[0].value;
    //
    _dropdownMenuItemsdia5 = buildDropdownMenuItemsdia5(_diaDropdown5);
    _selecteddianasc5 = _dropdownMenuItemsdia5[0].value;
    _dropdownMenuItemsmes5 = buildDropdownMenuItemsmes5(_mesDropdown5);
    _selectedmesnasc5 = _dropdownMenuItemsmes5[0].value;
    _dropdownMenuItemsano5 = buildDropdownMenuItemsano5(_anoDropdown5);
    _selectedanonasc5 = _dropdownMenuItemsano5[0].value;
    //
    _dropdownMenuItemsdia6 = buildDropdownMenuItemsdia6(_diaDropdown6);
    _selecteddianasc6 = _dropdownMenuItemsdia6[0].value;
    _dropdownMenuItemsmes6 = buildDropdownMenuItemsmes6(_mesDropdown6);
    _selectedmesnasc6 = _dropdownMenuItemsmes6[0].value;
    _dropdownMenuItemsano6 = buildDropdownMenuItemsano6(_anoDropdown6);
    _selectedanonasc6 = _dropdownMenuItemsano6[0].value;
  }

  @override

  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    //
    bool portrait = (widthlua > 600 ? false: true);
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
    double nomesize2 = portrait ? (widthlua /80): ( heightlua /160 );
    double datasize = portrait ? (widthlua / 60 ): ( heightlua /80 );
    double datasize2 = portrait ? (widthlua / 100 ): ( heightlua /80 );
    double tipoluasize = portrait ? (widthlua /60): ( heightlua /80 );
    double distanciasize = portrait ? (widthlua / 100): ( heightlua /120 );
    double tipoluasize2 = portrait ? (widthlua /120): ( heightlua /160 );
    double distanciasize2 = portrait ? (widthlua / 160): ( heightlua /180 );
    double signowsize = portrait ? (widthlua / 4): ( heightlua /10 );
    double signohsize = portrait ? (heightlua / 22): ( heightlua /30 );
    double tipoluzsize = portrait ? (widthlua / 120): ( heightlua / 100 );
    double tipoluzsize2 = portrait ? (widthlua / 160): ( heightlua / 120 );

    double  boxnomefamilia  = portrait ? (widthlua - 120): ( widthlua  - 400);
    double  boxnome       = portrait ?
    (widthlua > 800 ? widthlua - 120 :
    widthlua > 700 ? widthlua - 120 :
    widthlua > 600 ? widthlua - 120 :
    widthlua > 500 ? widthlua - 110 :
    widthlua > 400 ? widthlua - 110 :
    widthlua > 300 ? widthlua - 105 :
    widthlua > 200 ? widthlua : widthlua )
        :
    (widthlua > 1800 ? (widthlua / 2)  - 200 :
    widthlua > 1700 ? (widthlua / 2)   - 190 :
    widthlua > 1600 ? (widthlua / 2)    - 180 :
    widthlua > 1500 ? (widthlua / 2)   - 170 :
    widthlua > 1400 ? (widthlua / 2)   - 160 :
    widthlua > 1300 ? (widthlua / 2)    - 150 :
    widthlua > 1200 ? (widthlua / 2 ) - 140  : (widthlua / 2 ) -130 )
    ;
    double boxnomeh = portrait ?
    (widthlua > 800 ? 60 : widthlua > 700 ? 50 : widthlua > 600 ? 45 : widthlua > 500 ? 45 : widthlua > 400 ? 40 : widthlua > 300 ? 38 : widthlua > 200 ? 30 : 30 )
        :
    (widthlua > 2100 ? widthlua /45 : widthlua > 2000 ? widthlua /44 : widthlua > 1900 ? widthlua /43 : widthlua > 1800 ? widthlua /42 : widthlua > 1700 ? widthlua /41 :
    widthlua > 1600 ? widthlua /40 :  widthlua > 1500 ? widthlua /39 : widthlua > 1400 ? widthlua /38 : widthlua > 1300 ? widthlua /37 : widthlua > 1200 ? widthlua /36 :
    widthlua > 1100 ? widthlua /35 :  widthlua > 1000 ? widthlua /34 : widthlua > 900 ? widthlua /32 :  widthlua > 800 ? widthlua /30 :  widthlua > 700 ? widthlua /28 : widthlua /26 );
    //
    double  boxnomesize   = portrait ? ((heightlua * 0.20) - 20): ((heightlua * 0.20) - 10);
    double  boxnomesize2  = portrait ? ((heightlua * 0.10)): ((heightlua * 0.10));
    double  fontsizetitle = portrait ?  20 : 40;

    double  luasize = portrait ? (widthlua * 0.4) : (heightlua / 4 );
    double  luasize2 = portrait ? (widthlua * 0.2) : (heightlua / 8 );


    double  h10p = heightlua * 0.10;

    double signowsize2 = (widthlua > 1200? 75: widthlua > 1000? 50 : widthlua > 800 ? 35 : 30);
    double signohsize2 = (widthlua > 1200? 15: widthlua > 1000? 10 : widthlua > 800 ? 6 : 5);



    double hbox = heightlua*0.06; // box nome e data
    double boxbrancof = heightlua * 0.14;
    double boxbranco1 = heightlua * 0.26; // box fundo branco tranparente sem botão
    double boxbranco2 = heightlua * 0.30; // box fundo branco tranparente
    double hspace0 = heightlua * 0.03; //box espaçoantes nome
    double hspace1 = heightlua * 0.02;
    double hspace2 =  (widthlua > 1400 ? heightlua * 0.05 : widthlua > 1200 ? heightlua *0.04 : widthlua > 1000 ? heightlua *0.035 : widthlua > 900 ? heightlua *0.03 : widthlua > 300 ? heightlua *0.03 : heightlua *0.02);
    double hspace3 = heightlua * 0.005;
    double hspace4 = heightlua * 0.02;

    return FocusWatcher(
        child: Scaffold(
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
                                      5,
                                      _nomefamilia,
                                      _dataDb1,
                                      _dataDb2,
                                      _dataDb3,
                                      _dataDb4,
                                      _dataDb5,
                                      "",
                                      _nome,
                                      _nome2,
                                      _nome3,
                                      _nome4,
                                      _nome5,
                                      "",
                                      _distanciaDb1,
                                      _distanciaDb2,
                                      _distanciaDb3,
                                      _distanciaDb4,
                                      _distanciaDb5,
                                      0.0,
                                      _luadiaDb1,
                                      _luadiaDb2,
                                      _luadiaDb3,
                                      _luadiaDb4,
                                      _luadiaDb5,
                                      0,
                                      _proximoDb1,
                                      _proximoDb2,
                                      _proximoDb3,
                                      _proximoDb4,
                                      _proximoDb5,
                                      "",
                                      _signoDb1,
                                      _signoDb2,
                                      _signoDb3,
                                      _signoDb4,
                                      _signoDb5,
                                      "",
                                      _timeDb1,
                                      _timeDb2,
                                      _timeDb3,
                                      _timeDb4,
                                      _timeDb5,
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
                                      widget.nome,widget.email,
                                      5,
                                      _nomefamilia,
                                      _dataDb1,
                                      _dataDb2,
                                      _dataDb3,
                                      _dataDb4,
                                      _dataDb5,
                                      "",
                                      _nome,
                                      _nome2,
                                      _nome3,
                                      _nome4,
                                      _nome5,
                                      "",
                                      _distanciaDb1,
                                      _distanciaDb2,
                                      _distanciaDb3,
                                      _distanciaDb4,
                                      _distanciaDb5,
                                      0.0,
                                      _luadiaDb1,
                                      _luadiaDb2,
                                      _luadiaDb3,
                                      _luadiaDb4,
                                      _luadiaDb5,
                                      0,
                                      _proximoDb1,
                                      _proximoDb2,
                                      _proximoDb3,
                                      _proximoDb4,
                                      _proximoDb5,
                                      "",
                                      _signoDb1,
                                      _signoDb2,
                                      _signoDb3,
                                      _signoDb4,
                                      _signoDb5,
                                      "",
                                      _timeDb1,
                                      _timeDb2,
                                      _timeDb3,
                                      _timeDb4,
                                      _timeDb5,
                                      ""
                                  )
                          ));
                    }
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
                }
            )  ,
            body: Column(
                children: <Widget>[
                  //
                  // Pagina entrada de dados
                  //
                  //
                  Container(
                      width: _page1? widthlua : 0,
                      height: _page1? heightlua - 56 : 0,
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
                                          SizedBox(height: heightlua*0.1),
                                          Container(
                                              width: widthlua*0.90,
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
                                                                                    (_nomealterado3) &&
                                                                                    (_dataalterada3) &&
                                                                                    (_nomealterado4) &&
                                                                                    (_dataalterada4) &&
                                                                                    (_nomealterado5) &&
                                                                                    (_dataalterada5) &&
                                                                                    (_nomealterado6) &&
                                                                                    (_dataalterada6) &&
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
                                                                                    (_nomealterado3) &&
                                                                                    (_dataalterada3) &&
                                                                                    (_nomealterado4) &&
                                                                                    (_dataalterada4) &&
                                                                                    (_nomealterado5) &&
                                                                                    (_dataalterada5) &&
                                                                                    (_nomealterado6) &&
                                                                                    (_dataalterada6) &&
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
                                                                                    (_nomealterado3) &&
                                                                                    (_dataalterada3) &&
                                                                                    (_nomealterado4) &&
                                                                                    (_dataalterada4) &&
                                                                                    (_nomealterado5) &&
                                                                                    (_dataalterada5) &&
                                                                                    (_nomealterado6) &&
                                                                                    (_dataalterada6) &&
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
                                          //NOME3
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
                                                                        color: (_nomealterado3 ? Colors.white : Colors.redAccent),
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
                                                                                _nome3 = "";
                                                                              });} else{
                                                                              setState(() {
                                                                                _nome3 = text;
                                                                                _nomealterado3 = true;
                                                                                if ((_nomealterado) &&
                                                                                    (_dataalterada) &&
                                                                                    (_nomealterado2) &&
                                                                                    (_dataalterada2) &&
                                                                                    (_nomealterado3) &&
                                                                                    (_dataalterada3) &&
                                                                                    (_nomealterado4) &&
                                                                                    (_dataalterada4) &&
                                                                                    (_nomealterado5) &&
                                                                                    (_dataalterada5) &&
                                                                                    (_nomealterado6) &&
                                                                                    (_dataalterada6) &&
                                                                                    (_nomefamiliaalterado))
                                                                                {_mostrabotaoimagem = true;} else
                                                                                {_mostrabotaoimagem = false;}
                                                                              });}
                                                                          },
                                                                          decoration: InputDecoration(
                                                                            //  labelText: "Nome Completo",
                                                                            border: InputBorder.none,
                                                                            hintText: 'Nome Completo - 3',
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
                                                              "Data Nascimento - 3", textAlign: TextAlign.center,
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
                                                                      color: (_dataalterada3 ? Colors.white : Colors.redAccent),
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
                                                                                    color: (_dataalterada3 ? Colors.white : Colors.redAccent),
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    child:
                                                                                    DropdownButton(
                                                                                      value: _selecteddianasc3,
                                                                                      items: _dropdownMenuItemsdia3,
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      onChanged: onChangeDropdownItemdia3,
                                                                                    )),
                                                                                SizedBox(
                                                                                  height: 20.0,
                                                                                ),
                                                                              ]),
                                                                          Row(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    color: (_dataalterada3 ? Colors.white : Colors.redAccent),
                                                                                    child:
                                                                                    DropdownButton(
                                                                                      value: _selectedmesnasc3,
                                                                                      items: _dropdownMenuItemsmes3,
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      onChanged: onChangeDropdownItemmes3,
                                                                                      dropdownColor: Colors.white,
                                                                                    )),
                                                                                SizedBox(
                                                                                  height: 10.0,
                                                                                ),
                                                                              ]),
                                                                          Row(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                    color: (_dataalterada3 ? Colors.white : Colors.redAccent),
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    child:  DropdownButton(
                                                                                      value: _selectedanonasc3,
                                                                                      items: _dropdownMenuItemsano3,
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onChanged: onChangeDropdownItemano3,
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
                                          //NOME4
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
                                                                        color: (_nomealterado4 ? Colors.white : Colors.redAccent),
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
                                                                                _nome4 = "";
                                                                              });} else{
                                                                              setState(() {
                                                                                _nome4 = text;
                                                                                _nomealterado4 = true;
                                                                                if ((_nomealterado) &&
                                                                                    (_dataalterada) &&
                                                                                    (_nomealterado2) &&
                                                                                    (_dataalterada2) &&
                                                                                    (_nomealterado3) &&
                                                                                    (_dataalterada3) &&
                                                                                    (_nomealterado4) &&
                                                                                    (_dataalterada4) &&
                                                                                    (_nomealterado5) &&
                                                                                    (_dataalterada5) &&
                                                                                    (_nomealterado6) &&
                                                                                    (_dataalterada6) &&
                                                                                    (_nomefamiliaalterado))
                                                                                {_mostrabotaoimagem = true;} else
                                                                                {_mostrabotaoimagem = false;}
                                                                              });}
                                                                          },
                                                                          decoration: InputDecoration(
                                                                            //  labelText: "Nome Completo",
                                                                            border: InputBorder.none,
                                                                            hintText: 'Nome Completo - 4',
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
                                                              "Data Nascimento - 4", textAlign: TextAlign.center,
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
                                                                      color: (_dataalterada4 ? Colors.white : Colors.redAccent),
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
                                                                                    color: (_dataalterada4 ? Colors.white : Colors.redAccent),
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    child:
                                                                                    DropdownButton(
                                                                                      value: _selecteddianasc4,
                                                                                      items: _dropdownMenuItemsdia4,
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      onChanged: onChangeDropdownItemdia4,
                                                                                    )),
                                                                                SizedBox(
                                                                                  height: 20.0,
                                                                                ),
                                                                              ]),
                                                                          Row(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    color: (_dataalterada4 ? Colors.white : Colors.redAccent),
                                                                                    child:
                                                                                    DropdownButton(
                                                                                      value: _selectedmesnasc4,
                                                                                      items: _dropdownMenuItemsmes4,
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      onChanged: onChangeDropdownItemmes4,
                                                                                      dropdownColor: Colors.white,
                                                                                    )),
                                                                                SizedBox(
                                                                                  height: 10.0,
                                                                                ),
                                                                              ]),
                                                                          Row(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                    color: (_dataalterada4 ? Colors.white : Colors.redAccent),
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    child:  DropdownButton(
                                                                                      value: _selectedanonasc4,
                                                                                      items: _dropdownMenuItemsano4,
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onChanged: onChangeDropdownItemano4,
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
                                          //NOME5
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
                                                                        color: (_nomealterado5 ? Colors.white : Colors.redAccent),
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
                                                                                _nome5 = "";
                                                                              });} else{
                                                                              setState(() {
                                                                                _nome5 = text;
                                                                                _nomealterado5 = true;
                                                                                if ((_nomealterado) &&
                                                                                    (_dataalterada) &&
                                                                                    (_nomealterado2) &&
                                                                                    (_dataalterada2) &&
                                                                                    (_nomealterado3) &&
                                                                                    (_dataalterada3) &&
                                                                                    (_nomealterado4) &&
                                                                                    (_dataalterada4) &&
                                                                                    (_nomealterado5) &&
                                                                                    (_dataalterada5) &&
                                                                                    (_nomealterado6) &&
                                                                                    (_dataalterada6) &&
                                                                                    (_nomefamiliaalterado))
                                                                                {_mostrabotaoimagem = true;} else
                                                                                {_mostrabotaoimagem = false;}
                                                                              });}
                                                                          },
                                                                          decoration: InputDecoration(
                                                                            //  labelText: "Nome Completo",
                                                                            border: InputBorder.none,
                                                                            hintText: 'Nome Completo - 5',
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
                                                              "Data Nascimento - 5", textAlign: TextAlign.center,
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
                                                                      color: (_dataalterada5 ? Colors.white : Colors.redAccent),
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
                                                                                    color: (_dataalterada5 ? Colors.white : Colors.redAccent),
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    child:
                                                                                    DropdownButton(
                                                                                      value: _selecteddianasc5,
                                                                                      items: _dropdownMenuItemsdia5,
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      onChanged: onChangeDropdownItemdia5,
                                                                                    )),
                                                                                SizedBox(
                                                                                  height: 20.0,
                                                                                ),
                                                                              ]),
                                                                          Row(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    color: (_dataalterada5 ? Colors.white : Colors.redAccent),
                                                                                    child:
                                                                                    DropdownButton(
                                                                                      value: _selectedmesnasc5,
                                                                                      items: _dropdownMenuItemsmes5,
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      onChanged: onChangeDropdownItemmes5,
                                                                                      dropdownColor: Colors.white,
                                                                                    )),
                                                                                SizedBox(
                                                                                  height: 10.0,
                                                                                ),
                                                                              ]),
                                                                          Row(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                    color: (_dataalterada5 ? Colors.white : Colors.redAccent),
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    child:  DropdownButton(
                                                                                      value: _selectedanonasc5,
                                                                                      items: _dropdownMenuItemsano5,
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onChanged: onChangeDropdownItemano5,
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
                                          // NOME6 botão
                                          SizedBox(height:heightlua*0.02),
                                          Container(
                                              width: widthlua*0.90,
                                              height: boxbranco2,
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
                                                                          color: (_nomealterado6 ? Colors.white : Colors.redAccent),
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
                                                                                  _nome6 = "";
                                                                                });} else{
                                                                                setState(() {
                                                                                  _nome6 = text;
                                                                                  _nomealterado6 = true;
                                                                                  if ((_nomealterado) &&
                                                                                      (_dataalterada) &&
                                                                                      (_nomealterado2) &&
                                                                                      (_dataalterada2) &&
                                                                                      (_nomealterado3) &&
                                                                                      (_dataalterada3) &&
                                                                                      (_nomealterado4) &&
                                                                                      (_dataalterada4) &&
                                                                                      (_nomealterado5) &&
                                                                                      (_dataalterada5) &&
                                                                                      (_nomealterado6) &&
                                                                                      (_dataalterada6) &&
                                                                                      (_nomefamiliaalterado))
                                                                                  {_mostrabotaoimagem = true;} else
                                                                                  {_mostrabotaoimagem = false;}
                                                                                });}
                                                                            },
                                                                            decoration: InputDecoration(
                                                                              //  labelText: "Nome Completo",
                                                                              border: InputBorder.none,
                                                                              hintText: 'Nome Completo - 6',
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
                                                            )),
                                                        SizedBox(height: hspace1),
                                                        //texto data nascimento
                                                        SizedBox(
                                                          width: widthlua* 0.7,
                                                          height: hspace2,
                                                          child: Text(
                                                              "Data Nascimento - 6", textAlign: TextAlign.center,
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
                                                                      color: (_dataalterada6 ? Colors.white : Colors.redAccent),
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
                                                                                    color: (_dataalterada6 ? Colors.white : Colors.redAccent),
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    child:
                                                                                    DropdownButton(
                                                                                      value: _selecteddianasc6,
                                                                                      items: _dropdownMenuItemsdia6,
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      onChanged: onChangeDropdownItemdia6,
                                                                                    )),
                                                                                SizedBox(
                                                                                  height: 20.0,
                                                                                ),
                                                                              ]),
                                                                          Row(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    color: (_dataalterada6 ? Colors.white : Colors.redAccent),
                                                                                    child:
                                                                                    DropdownButton(
                                                                                      value: _selectedmesnasc6,
                                                                                      items: _dropdownMenuItemsmes6,
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      onChanged: onChangeDropdownItemmes6,
                                                                                      dropdownColor: Colors.white,
                                                                                    )),
                                                                                SizedBox(
                                                                                  height: 10.0,
                                                                                ),
                                                                              ]),
                                                                          Row(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                    color: (_dataalterada6 ? Colors.white : Colors.redAccent),
                                                                                    padding: EdgeInsets.only(left: 5, right: 5),
                                                                                    child:  DropdownButton(
                                                                                      value: _selectedanonasc6,
                                                                                      items: _dropdownMenuItemsano6,
                                                                                      onTap: () {
                                                                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                                                                        if (!currentFocus.hasPrimaryFocus) {
                                                                                          currentFocus.unfocus();
                                                                                        }
                                                                                      },
                                                                                      style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                                                      onChanged: onChangeDropdownItemano6,
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
                                                        Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                  height: (_mostrabotaoimagem ? heightlua*0.06 : 0),
                                                                  child: MaterialButton(
                                                                    color: Colors.deepOrange,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(
                                                                            Radius.circular(20.0))),
                                                                    onPressed: () {
                                                                      setState(() {
                                                                        _mostrabotaoimagem = false;
                                                                        _mostraImagem = true;
                                                                        _page1 = false;
                                                                        _page2 = true;
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                      "Gerar Imagen",
                                                                      style: TextStyle(color: Colors.white),
                                                                    ),
                                                                  )),
                                                              SizedBox(width: 80),
                                                              SizedBox(
                                                                  height: (_mostrabotaoimagem ? heightlua*0.06 : 0),
                                                                  child: MaterialButton(
                                                                    color: Colors.deepOrange,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(
                                                                            Radius.circular(20.0))),
                                                                    onPressed: () {
                                                                      setState(() {
                                                                        _mostraImagem = false;
                                                                        _mostraLayout = true;
                                                                        _mostrabotaoimagem = false;
                                                                        _dataPicket = "";
                                                                        _nome = "";
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                                builder: (context) => SimuleDesktop("","@ANONIMO")));
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                      "Voltar",
                                                                      style: TextStyle(color: Colors.white),
                                                                    ),
                                                                  )),
                                                            ])
                                                      ]
                                                  )
                                              )
                                          )
                                        ])
                                )
                              ]
                          ))
                  ),
                  //
                  // pagina Mostra imagem
                  //
                  //
                  Container(
                      width: _page2? widthlua: 0,
                      height: _page2?heightlua:0,
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
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[

                                                // TELA-01
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
                                                                        fit: BoxFit.fitWidth)),
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


                                                              Text( _distanciaDb1.toString() == null ?  "Distância :  +00.00" : "Distância :  " + _distanciaDb1.toString()+ " Kms",
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
                                                //TELA-02
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
                                                                        fit: BoxFit.fitWidth)),
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


                                                              Text( _distanciaDb2.toString() == null ?  "Distância :  +00.00" : "Distância :  " + _distanciaDb2.toString()+ " Kms",
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
                                              ]),
                                          Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      //TELA-03
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
                                                                    maxWidth: _mostraImagem ? luasize2 : 0,
                                                                    maxHeight: _mostraImagem ? luasize2 : 0,
                                                                    child: Container(
                                                                      width: _mostraImagem ? luasize2 : 0,
                                                                      height: _mostraImagem ? luasize2 : 0,

                                                                      alignment: Alignment.topCenter,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          color: Colors.black,
                                                                          image: DecorationImage(
                                                                              image: new AssetImage(_luadiaDb3 == null
                                                                                  ? _geraimage(00)
                                                                                  : _geraimage(_luadiaDb3)),
                                                                              fit: BoxFit.fitWidth)),
                                                                    )
                                                                )

                                                            ),
                                                            Container(
                                                                height: _mostraImagem ? boxnomesize2 : 0,
                                                                child: Column(
                                                                  children: <Widget>[
                                                                    //
                                                                    // NOME
                                                                    //

                                                                    Text(_nome3 == null ? "" : _nome3,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: nomesize2,
                                                                      ),),
                                                                    SizedBox(height: 6),
                                                                    //
                                                                    // DATA
                                                                    //
                                                                    Text(_dataDb3 == null ? "**********" : _geradatas(_dataDb3),
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: datasize2,
                                                                      ),),
                                                                    //
                                                                    // DISTANCIA
                                                                    //


                                                                    Text( _distanciaDb3.toString() == null ?  "Distância :  +00.00" : "Distância :  " + _distanciaDb3.toString()+ " Kms",
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: distanciasize2,
                                                                      ),),
                                                                    SizedBox(height: 5),
                                                                    //
                                                                    // SIGNO
                                                                    //
                                                                    SizedBox(
                                                                        width: signowsize2,
                                                                        height: signohsize2,
                                                                        child: Image(image: AssetImage(_gerasigno(_signoDb3, _proximoDb3)))),
                                                                    //
                                                                    // TIPO DE LUA
                                                                    //
                                                                    Text( _luadiaDb3 == null ? _geratipolua(00) : _geratipolua(_luadiaDb3), textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: tipoluasize2,
                                                                      ),),
                                                                    //
                                                                    // TIPO DE iluminação
                                                                    //
                                                                    Text( _luadiaDb3 == null ? _geratipoluz(00) : _geratipoluz(_luadiaDb3), textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: tipoluzsize2,
                                                                      ),)
                                                                  ],
                                                                  //
                                                                )
                                                            )
                                                          ]),
                                                      //TELA-04
                                                      Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: <Widget>[
                                                            SizedBox(height:10),
                                                            //
                                                            //tela 4
                                                            //
                                                            Container(
                                                                alignment: Alignment.topCenter,
                                                                child: LimitedBox(
                                                                    maxWidth: _mostraImagem ? luasize2 : 0,
                                                                    maxHeight: _mostraImagem ? luasize2 : 0,
                                                                    child: Container(
                                                                      width: _mostraImagem ? luasize2 : 0,
                                                                      height: _mostraImagem ? luasize2 : 0,

                                                                      alignment: Alignment.topCenter,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          color: Colors.black,
                                                                          image: DecorationImage(
                                                                              image: new AssetImage(_luadiaDb4 == null
                                                                                  ? _geraimage(00)
                                                                                  : _geraimage(_luadiaDb4)),
                                                                              fit: BoxFit.fitWidth)),
                                                                    )
                                                                )

                                                            ),
                                                            Container(
                                                                height: _mostraImagem ? boxnomesize2 : 0,
                                                                child: Column(
                                                                  children: <Widget>[
                                                                    //
                                                                    // NOME
                                                                    //

                                                                    Text(_nome4 == null ? "" : _nome4,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: nomesize2,
                                                                      ),),
                                                                    SizedBox(height: 6),
                                                                    //
                                                                    // DATA
                                                                    //
                                                                    Text(_dataDb4 == null ? "**********" : _geradatas(_dataDb4),
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: datasize2,
                                                                      ),),
                                                                    //
                                                                    // DISTANCIA
                                                                    //


                                                                    Text( _distanciaDb4.toString() == null ?  "Distância :  +00.00" : "Distância :  " + _distanciaDb4.toString()+ " Kms",
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: distanciasize2,
                                                                      ),),
                                                                    SizedBox(height: 5),
                                                                    //
                                                                    // SIGNO
                                                                    //
                                                                    SizedBox(
                                                                        width: signowsize2,
                                                                        height: signohsize2,
                                                                        child: Image(image: AssetImage(_gerasigno(_signoDb4, _proximoDb4)))),
                                                                    //
                                                                    // TIPO DE LUA
                                                                    //
                                                                    Text( _luadiaDb4 == null ? _geratipolua(00) : _geratipolua(_luadiaDb4), textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: tipoluasize2,
                                                                      ),),
                                                                    //
                                                                    // TIPO DE iluminação
                                                                    //
                                                                    Text( _luadiaDb4 == null ? _geratipoluz(00) : _geratipoluz(_luadiaDb4), textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: tipoluzsize2,
                                                                      ),)
                                                                  ],
                                                                  //
                                                                )
                                                            )
                                                          ]),
                                                    ]),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      //TELA-05
                                                      Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: <Widget>[
                                                            SizedBox(height:10),
                                                            //
                                                            //tela 5
                                                            //
                                                            Container(
                                                                alignment: Alignment.topCenter,
                                                                child: LimitedBox(
                                                                    maxWidth: _mostraImagem ? luasize2 : 0,
                                                                    maxHeight: _mostraImagem ? luasize2 : 0,
                                                                    child: Container(
                                                                      width: _mostraImagem ? luasize2 : 0,
                                                                      height: _mostraImagem ? luasize2 : 0,

                                                                      alignment: Alignment.topCenter,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          color: Colors.black,
                                                                          image: DecorationImage(
                                                                              image: new AssetImage(_luadiaDb5 == null
                                                                                  ? _geraimage(00)
                                                                                  : _geraimage(_luadiaDb5)),
                                                                              fit: BoxFit.fitWidth)),
                                                                    )
                                                                )

                                                            ),
                                                            Container(
                                                                height: _mostraImagem ? boxnomesize2 : 0,
                                                                child: Column(
                                                                  children: <Widget>[
                                                                    //
                                                                    // NOME
                                                                    //

                                                                    Text(_nome5 == null ? "" : _nome5,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: nomesize2,
                                                                      ),),
                                                                    SizedBox(height: 6),
                                                                    //
                                                                    // DATA
                                                                    //
                                                                    Text(_dataDb5 == null ? "**********" : _geradatas(_dataDb5),
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: datasize2,
                                                                      ),),
                                                                    //
                                                                    // DISTANCIA
                                                                    //


                                                                    Text( _distanciaDb5.toString() == null ?  "Distância :  +00.00" : "Distância :  " + _distanciaDb5.toString()+ " Kms",
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: distanciasize2,
                                                                      ),),
                                                                    SizedBox(height: 5),
                                                                    //
                                                                    // SIGNO
                                                                    //
                                                                    SizedBox(
                                                                        width: signowsize2,
                                                                        height: signohsize2,
                                                                        child: Image(image: AssetImage(_gerasigno(_signoDb5, _proximoDb5)))),
                                                                    //
                                                                    // TIPO DE LUA
                                                                    //
                                                                    Text( _luadiaDb5 == null ? _geratipolua(00) : _geratipolua(_luadiaDb5), textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: tipoluasize2,
                                                                      ),),
                                                                    //
                                                                    // TIPO DE iluminação
                                                                    //
                                                                    Text( _luadiaDb5 == null ? _geratipoluz(00) : _geratipoluz(_luadiaDb5), textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: tipoluzsize2,
                                                                      ),)
                                                                  ],
                                                                  //
                                                                )
                                                            )
                                                          ]),
                                                      //TELA-06
                                                      Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: <Widget>[
                                                            SizedBox(height:10),
                                                            //
                                                            //tela 6
                                                            //
                                                            Container(
                                                                alignment: Alignment.topCenter,
                                                                child: LimitedBox(
                                                                    maxWidth: _mostraImagem ? luasize2 : 0,
                                                                    maxHeight: _mostraImagem ? luasize2 : 0,
                                                                    child: Container(
                                                                      width: _mostraImagem ? luasize2 : 0,
                                                                      height: _mostraImagem ? luasize2 : 0,

                                                                      alignment: Alignment.topCenter,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          color: Colors.black,
                                                                          image: DecorationImage(
                                                                              image: new AssetImage(_luadiaDb6 == null
                                                                                  ? _geraimage(00)
                                                                                  : _geraimage(_luadiaDb6)),
                                                                              fit: BoxFit.fitWidth)),
                                                                    )
                                                                )

                                                            ),
                                                            Container(
                                                                height: _mostraImagem ? boxnomesize2 : 0,
                                                                child: Column(
                                                                  children: <Widget>[
                                                                    //
                                                                    // NOME
                                                                    //

                                                                    Text(_nome6 == null ? "" : _nome5,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: nomesize2,
                                                                      ),),
                                                                    SizedBox(height: 6),
                                                                    //
                                                                    // DATA
                                                                    //
                                                                    Text(_dataDb6 == null ? "**********" : _geradatas(_dataDb6),
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: datasize2,
                                                                      ),),
                                                                    //
                                                                    // DISTANCIA
                                                                    //


                                                                    Text( _distanciaDb6.toString() == null ?  "Distância :  +00.00" : "Distância :  " + _distanciaDb6.toString()+ " Kms",
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: distanciasize,
                                                                      ),),
                                                                    SizedBox(height: 5),
                                                                    //
                                                                    // SIGNO
                                                                    //
                                                                    SizedBox(
                                                                        width: signowsize2,
                                                                        height: signohsize2,
                                                                        child: Image(image: AssetImage(_gerasigno(_signoDb6, _proximoDb6)))),
                                                                    //
                                                                    // TIPO DE LUA
                                                                    //
                                                                    Text( _luadiaDb6 == null ? _geratipolua(00) : _geratipolua(_luadiaDb6), textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: tipoluasize2,
                                                                      ),),
                                                                    //
                                                                    // TIPO DE iluminação
                                                                    //
                                                                    Text( _luadiaDb5 == null ? _geratipoluz(00) : _geratipoluz(_luadiaDb6), textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: tipoluzsize2,
                                                                      ),)
                                                                  ],
                                                                  //
                                                                )
                                                            )
                                                          ]),
                                                    ])
                                              ])

                                        ])
                                ),
                                //    SizedBox(height: 10),
                                //
                                //botoes tela magem
                                //
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                          height: (_mostraImagem ? (h10p/2) : 0),
                                          child: MaterialButton(
                                            color: Colors.deepOrange,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            onPressed: () {
                                              setState(() {
                                                _mostraImagem = false;
                                                _mostrabotaoimagem = true;
                                                setState(() {
                                                  _page1 = true;
                                                  _page2 = false;
                                                });
                                              });
                                            },
                                            child: Text(
                                              "Voltar",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          )),
                                      SizedBox(width: boxnomeh),
                                      SizedBox(
                                          height: (_mostraImagem ? (h10p / 2) : 0),
                                          child: MaterialButton(
                                            color: Colors.deepOrange,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            onPressed: () => setState(()  {
                                              print("email ================================"+widget.email);
                                              if (widget.email == "@ANONIMO") {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Login(
                                                                widget.nome,widget.email,
                                                                6,
                                                                _nomefamilia,
                                                                _dataDb1,
                                                                _dataDb2,
                                                                _dataDb3,
                                                                _dataDb4,
                                                                _dataDb5,
                                                                _dataDb6,
                                                                _nome,
                                                                _nome2,
                                                                _nome3,
                                                                _nome4,
                                                                _nome5,
                                                                _nome6,
                                                                _distanciaDb1,
                                                                _distanciaDb2,
                                                                _distanciaDb3,
                                                                _distanciaDb4,
                                                                _distanciaDb5,
                                                                _distanciaDb6,
                                                                _luadiaDb1,
                                                                _luadiaDb2,
                                                                _luadiaDb3,
                                                                _luadiaDb4,
                                                                _luadiaDb5,
                                                                _luadiaDb6,
                                                                _proximoDb1,
                                                                _proximoDb2,
                                                                _proximoDb3,
                                                                _proximoDb4,
                                                                _proximoDb5,
                                                                _proximoDb6,
                                                                _signoDb1,
                                                                _signoDb2,
                                                                _signoDb3,
                                                                _signoDb4,
                                                                _signoDb5,
                                                                _signoDb6,
                                                                _timeDb1,
                                                                _timeDb2,
                                                                _timeDb3,
                                                                _timeDb4,
                                                                _timeDb5,
                                                                _timeDb6
                                                            )
                                                    ));
                                              }
                                              else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Comprar(
                                                                widget.nome,widget.email,
                                                                6,
                                                                _nomefamilia,
                                                                _dataDb1,
                                                                _dataDb2,
                                                                _dataDb3,
                                                                _dataDb4,
                                                                _dataDb5,
                                                                _dataDb6,
                                                                _nome,
                                                                _nome2,
                                                                _nome3,
                                                                _nome4,
                                                                _nome5,
                                                                _nome6,
                                                                _distanciaDb1,
                                                                _distanciaDb2,
                                                                _distanciaDb3,
                                                                _distanciaDb4,
                                                                _distanciaDb5,
                                                                _distanciaDb6,
                                                                _luadiaDb1,
                                                                _luadiaDb2,
                                                                _luadiaDb3,
                                                                _luadiaDb4,
                                                                _luadiaDb5,
                                                                _luadiaDb6,
                                                                _proximoDb1,
                                                                _proximoDb2,
                                                                _proximoDb3,
                                                                _proximoDb4,
                                                                _proximoDb5,
                                                                _proximoDb6,
                                                                _signoDb1,
                                                                _signoDb2,
                                                                _signoDb3,
                                                                _signoDb4,
                                                                _signoDb5,
                                                                _signoDb6,
                                                                _timeDb1,
                                                                _timeDb2,
                                                                _timeDb3,
                                                                _timeDb4,
                                                                _timeDb5,
                                                                _timeDb6
                                                            )
                                                    ));
                                              }
                                            }

                                            ),
                                            child: const Text('Opções de Fotos',style: TextStyle(color: Colors.white),
                                            ),
                                          ))
                                    ]),

                              ]))),
                  Container(
                    width: _page3 ? widthlua: 0,
                    height: _page3 ? heightlua:0,
                  ),
                  Container(
                    width: _page4 ? widthlua: 0,
                    height: _page4 ? heightlua:0,
                  )
                ]
            )));
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
      anonasc(0,0000),
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
      anonasc2(0,0000),
      anonasc2(1,2020),
      anonasc2(2,2019),
      anonasc2(3,2018),
      anonasc2(4,2017),
      anonasc2(5,2016),
      anonasc2(6,2015),
      anonasc2(7,2014),
      anonasc2(8,2013),
      anonasc2(9,2012),
      anonasc2(10,2011),
      anonasc2(11,2010),
      anonasc2(12,2009),
      anonasc2(13,2008),
      anonasc2(14,2007),
      anonasc2(15,2006),
      anonasc2(16,2005),
      anonasc2(17,2004),
      anonasc2(18,2003),
      anonasc2(19,2002),
      anonasc2(20,2001),
      anonasc2(21,2000),
      anonasc2(22,1999),
      anonasc2(23,1998),
      anonasc2(24,1997),
      anonasc2(25,1996),
      anonasc2(26,1995),
      anonasc2(27,1994),
      anonasc2(28,1993),
      anonasc2(29,1992),
      anonasc2(30,1991),
      anonasc2(31,1990),
      anonasc2(32,1989),
      anonasc2(33,1988),
      anonasc2(34,1987),
      anonasc2(35,1986),
      anonasc2(36,1985),
      anonasc2(37,1984),
      anonasc2(38,1983),
      anonasc2(39,1982),
      anonasc2(40,1981),
      anonasc2(41,1980),
      anonasc2(42,1979),
      anonasc2(43,1978),
      anonasc2(44,1977),
      anonasc2(45,1976),
      anonasc2(46,1975),
      anonasc2(47,1974),
      anonasc2(48,1973),
      anonasc2(49,1972),
      anonasc2(50,1971),
      anonasc2(51,1970),
      anonasc2(52,1969),
      anonasc2(53,1968),
      anonasc2(54,1967),
      anonasc2(55,1966),
      anonasc2(56,1965),
      anonasc2(57,1964),
      anonasc2(58,1963),
      anonasc2(59,1962),
      anonasc2(60,1961),
      anonasc2(61,1960),
      anonasc2(62,1959),
      anonasc2(63,1958),
      anonasc2(64,1957),
      anonasc2(65,1956),
      anonasc2(66,1955),
      anonasc2(67,1954),
      anonasc2(68,1953),
      anonasc2(69,1952),
      anonasc2(70,1951),
      anonasc2(71,1950),
      anonasc2(72,1949),
      anonasc2(73,1948),
      anonasc2(74,1947),
      anonasc2(75,1946),
      anonasc2(76,1945),
      anonasc2(77,1944),
      anonasc2(78,1943),
      anonasc2(79,1942),
      anonasc2(80,1941),
      anonasc2(81,1940),
      anonasc2(82,1939),
      anonasc2(83,1938),
      anonasc2(84,1937),
      anonasc2(85,1936),
      anonasc2(86,1935),
      anonasc2(87,1934),
      anonasc2(88,1933),
      anonasc2(89,1932),
      anonasc2(90,1931),
      anonasc2(91,1930),
      anonasc2(92,1929),
      anonasc2(93,1928),
      anonasc2(94,1927),
      anonasc2(95,1926),
      anonasc2(96,1925),
      anonasc2(97,1924),
      anonasc2(98,1923),
      anonasc2(99,1922),
      anonasc2(100,1921),
      anonasc2(101,1920),
      anonasc2(102,1919),
      anonasc2(103,1918),
      anonasc2(104,1917),
      anonasc2(105,1916),
      anonasc2(106,1915),
      anonasc2(107,1914),
      anonasc2(108,1913),
      anonasc2(109,1912),
      anonasc2(110,1911),
      anonasc2(111,1910),
      anonasc2(112,1909),
      anonasc2(113,1908),
      anonasc2(114,1907),
      anonasc2(115,1906),
      anonasc2(116,1905),
      anonasc2(117,1904),
      anonasc2(118,1903),
      anonasc2(119,1902),
      anonasc2(120,1901),
      anonasc2(121,1900),

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
      mesnasc2(0, 'Mes','00'),
      mesnasc2(1, 'Janeiro','01'),
      mesnasc2(2, 'Fevereiro','02'),
      mesnasc2(3, 'Março','03'),
      mesnasc2(4, 'Abril','04'),
      mesnasc2(5, 'Maio','05'),
      mesnasc2(6, 'Junho','06'),
      mesnasc2(7, 'Julho','07'),
      mesnasc2(8, 'Agosto','08'),
      mesnasc2(9, 'Setembro','09'),
      mesnasc2(10, 'Outubro', '10'),
      mesnasc2(11, 'Novembro', '11'),
      mesnasc2(12, 'Dezembro', '12')


    ];
  }
}
class dianasc3 {
  int id3;
  String dia3;

  dianasc3(this.id3, this.dia3);

  static List<dianasc3> getDia3() {
    return <dianasc3>[
      dianasc3(0, 'Dia'),
      dianasc3(1, '01'),
      dianasc3(2, '02'),
      dianasc3(3, '03'),
      dianasc3(4, '04'),
      dianasc3(5, '05'),
      dianasc3(6, '06'),
      dianasc3(7, '07'),
      dianasc3(8, '08'),
      dianasc3(9, '09'),
      dianasc3(10, '10'),
      dianasc3(11, '11'),
      dianasc3(12, '12'),
      dianasc3(13, '13'),
      dianasc3(14, '14'),
      dianasc3(15, '15'),
      dianasc3(16, '16'),
      dianasc3(17, '17'),
      dianasc3(18, '18'),
      dianasc3(19, '19'),
      dianasc3(20, '20'),
      dianasc3(21, '21'),
      dianasc3(22, '22'),
      dianasc3(23, '23'),
      dianasc3(24, '24'),
      dianasc3(25, '25'),
      dianasc3(26, '26'),
      dianasc3(27, '27'),
      dianasc3(28, '28'),
      dianasc3(29, '29'),
      dianasc3(30, '30'),
      dianasc3(31, '31')

    ];
  }
}
class anonasc3 {
  int id3;
  int ano3;

  anonasc3(this.id3, this.ano3);

  static List<anonasc3> getAno3() {
    return <anonasc3>[
      anonasc3(0,0000),
      anonasc3(1,2020),
      anonasc3(2,2019),
      anonasc3(3,2018),
      anonasc3(4,2017),
      anonasc3(5,2016),
      anonasc3(6,2015),
      anonasc3(7,2014),
      anonasc3(8,2013),
      anonasc3(9,2012),
      anonasc3(10,2011),
      anonasc3(11,2010),
      anonasc3(12,2009),
      anonasc3(13,2008),
      anonasc3(14,2007),
      anonasc3(15,2006),
      anonasc3(16,2005),
      anonasc3(17,2004),
      anonasc3(18,2003),
      anonasc3(19,2002),
      anonasc3(20,2001),
      anonasc3(21,2000),
      anonasc3(22,1999),
      anonasc3(23,1998),
      anonasc3(24,1997),
      anonasc3(25,1996),
      anonasc3(26,1995),
      anonasc3(27,1994),
      anonasc3(28,1993),
      anonasc3(29,1992),
      anonasc3(30,1991),
      anonasc3(31,1990),
      anonasc3(32,1989),
      anonasc3(33,1988),
      anonasc3(34,1987),
      anonasc3(35,1986),
      anonasc3(36,1985),
      anonasc3(37,1984),
      anonasc3(38,1983),
      anonasc3(39,1982),
      anonasc3(40,1981),
      anonasc3(41,1980),
      anonasc3(42,1979),
      anonasc3(43,1978),
      anonasc3(44,1977),
      anonasc3(45,1976),
      anonasc3(46,1975),
      anonasc3(47,1974),
      anonasc3(48,1973),
      anonasc3(49,1972),
      anonasc3(0,1971),
      anonasc3(51,1970),
      anonasc3(52,1969),
      anonasc3(53,1968),
      anonasc3(54,1967),
      anonasc3(55,1966),
      anonasc3(56,1965),
      anonasc3(57,1964),
      anonasc3(58,1963),
      anonasc3(59,1962),
      anonasc3(60,1961),
      anonasc3(61,1960),
      anonasc3(62,1959),
      anonasc3(63,1958),
      anonasc3(64,1957),
      anonasc3(65,1956),
      anonasc3(66,1955),
      anonasc3(67,1954),
      anonasc3(68,1953),
      anonasc3(69,1952),
      anonasc3(70,1951),
      anonasc3(71,1950),
      anonasc3(72,1949),
      anonasc3(73,1948),
      anonasc3(74,1947),
      anonasc3(75,1946),
      anonasc3(76,1945),
      anonasc3(77,1944),
      anonasc3(78,1943),
      anonasc3(79,1942),
      anonasc3(80,1941),
      anonasc3(81,1940),
      anonasc3(82,1939),
      anonasc3(83,1938),
      anonasc3(84,1937),
      anonasc3(85,1936),
      anonasc3(86,1935),
      anonasc3(87,1934),
      anonasc3(88,1933),
      anonasc3(89,1932),
      anonasc3(90,1931),
      anonasc3(91,1930),
      anonasc3(92,1929),
      anonasc3(93,1928),
      anonasc3(94,1927),
      anonasc3(95,1926),
      anonasc3(96,1925),
      anonasc3(97,1924),
      anonasc3(98,1923),
      anonasc3(99,1922),
      anonasc3(100,1921),
      anonasc3(101,1920),
      anonasc3(102,1919),
      anonasc3(103,1918),
      anonasc3(104,1917),
      anonasc3(105,1916),
      anonasc3(106,1915),
      anonasc3(107,1914),
      anonasc3(108,1913),
      anonasc3(109,1912),
      anonasc3(110,1911),
      anonasc3(111,1910),
      anonasc3(112,1909),
      anonasc3(113,1908),
      anonasc3(114,1907),
      anonasc3(115,1906),
      anonasc3(116,1905),
      anonasc3(117,1904),
      anonasc3(118,1903),
      anonasc3(119,1902),
      anonasc3(120,1901),
      anonasc3(121,1900),

    ];
  }
}
class mesnasc3 {
  int id3;
  String mesTitle3;
  String mes3;

  mesnasc3(this.id3, this.mesTitle3, this.mes3);

  static List<mesnasc3> getMes3() {
    return <mesnasc3>[
      mesnasc3(0, 'Mes','00'),
      mesnasc3(1, 'Janeiro','01'),
      mesnasc3(2, 'Fevereiro','02'),
      mesnasc3(3, 'Março','03'),
      mesnasc3(4, 'Abril','04'),
      mesnasc3(5, 'Maio','05'),
      mesnasc3(6, 'Junho','06'),
      mesnasc3(7, 'Julho','07'),
      mesnasc3(8, 'Agosto','08'),
      mesnasc3(9, 'Setembro','09'),
      mesnasc3(10, 'Outubro', '10'),
      mesnasc3(11, 'Novembro', '11'),
      mesnasc3(12, 'Dezembro', '12')


    ];
  }
}
class dianasc4 {
  int id4;
  String dia4;

  dianasc4(this.id4, this.dia4);

  static List<dianasc4> getDia4() {
    return <dianasc4>[
      dianasc4(0, 'Dia'),
      dianasc4(1, '01'),
      dianasc4(2, '02'),
      dianasc4(3, '03'),
      dianasc4(4, '04'),
      dianasc4(5, '05'),
      dianasc4(6, '06'),
      dianasc4(7, '07'),
      dianasc4(8, '08'),
      dianasc4(9, '09'),
      dianasc4(10, '10'),
      dianasc4(11, '11'),
      dianasc4(12, '12'),
      dianasc4(13, '13'),
      dianasc4(14, '14'),
      dianasc4(15, '15'),
      dianasc4(16, '16'),
      dianasc4(17, '17'),
      dianasc4(18, '18'),
      dianasc4(19, '19'),
      dianasc4(20, '20'),
      dianasc4(21, '21'),
      dianasc4(22, '22'),
      dianasc4(23, '23'),
      dianasc4(24, '24'),
      dianasc4(25, '25'),
      dianasc4(26, '26'),
      dianasc4(27, '27'),
      dianasc4(28, '28'),
      dianasc4(29, '29'),
      dianasc4(30, '30'),
      dianasc4(31, '31')

    ];
  }
}
class anonasc4 {
  int id4;
  int ano4;

  anonasc4(this.id4, this.ano4);

  static List<anonasc4> getAno4() {
    return <anonasc4>[
      anonasc4(0,0000),
      anonasc4(1,2020),
      anonasc4(2,2019),
      anonasc4(3,2018),
      anonasc4(4,2017),
      anonasc4(5,2016),
      anonasc4(6,2015),
      anonasc4(7,2014),
      anonasc4(8,2013),
      anonasc4(9,2012),
      anonasc4(10,2011),
      anonasc4(11,2010),
      anonasc4(12,2009),
      anonasc4(13,2008),
      anonasc4(14,2007),
      anonasc4(15,2006),
      anonasc4(16,2005),
      anonasc4(17,2004),
      anonasc4(18,2003),
      anonasc4(19,2002),
      anonasc4(20,2001),
      anonasc4(21,2000),
      anonasc4(22,1999),
      anonasc4(23,1998),
      anonasc4(24,1997),
      anonasc4(25,1996),
      anonasc4(26,1995),
      anonasc4(27,1994),
      anonasc4(28,1993),
      anonasc4(29,1992),
      anonasc4(30,1991),
      anonasc4(31,1990),
      anonasc4(32,1989),
      anonasc4(33,1988),
      anonasc4(34,1987),
      anonasc4(35,1986),
      anonasc4(36,1985),
      anonasc4(37,1984),
      anonasc4(38,1983),
      anonasc4(39,1982),
      anonasc4(40,1981),
      anonasc4(41,1980),
      anonasc4(42,1979),
      anonasc4(43,1978),
      anonasc4(44,1977),
      anonasc4(45,1976),
      anonasc4(46,1975),
      anonasc4(47,1974),
      anonasc4(48,1973),
      anonasc4(49,1972),
      anonasc4(50,1971),
      anonasc4(51,1970),
      anonasc4(52,1969),
      anonasc4(53,1968),
      anonasc4(54,1967),
      anonasc4(55,1966),
      anonasc4(56,1965),
      anonasc4(57,1964),
      anonasc4(58,1963),
      anonasc4(59,1962),
      anonasc4(60,1961),
      anonasc4(61,1960),
      anonasc4(62,1959),
      anonasc4(63,1958),
      anonasc4(64,1957),
      anonasc4(65,1956),
      anonasc4(66,1955),
      anonasc4(67,1954),
      anonasc4(68,1953),
      anonasc4(69,1952),
      anonasc4(70,1951),
      anonasc4(71,1950),
      anonasc4(72,1949),
      anonasc4(73,1948),
      anonasc4(74,1947),
      anonasc4(75,1946),
      anonasc4(76,1945),
      anonasc4(77,1944),
      anonasc4(78,1943),
      anonasc4(79,1942),
      anonasc4(80,1941),
      anonasc4(81,1940),
      anonasc4(82,1939),
      anonasc4(83,1938),
      anonasc4(84,1937),
      anonasc4(85,1936),
      anonasc4(86,1935),
      anonasc4(87,1934),
      anonasc4(88,1933),
      anonasc4(89,1932),
      anonasc4(90,1931),
      anonasc4(91,1930),
      anonasc4(92,1929),
      anonasc4(93,1928),
      anonasc4(94,1927),
      anonasc4(95,1926),
      anonasc4(96,1925),
      anonasc4(97,1924),
      anonasc4(98,1923),
      anonasc4(99,1922),
      anonasc4(100,1921),
      anonasc4(101,1920),
      anonasc4(102,1919),
      anonasc4(103,1918),
      anonasc4(104,1917),
      anonasc4(105,1916),
      anonasc4(106,1915),
      anonasc4(107,1914),
      anonasc4(108,1913),
      anonasc4(109,1912),
      anonasc4(110,1911),
      anonasc4(111,1910),
      anonasc4(112,1909),
      anonasc4(113,1908),
      anonasc4(114,1907),
      anonasc4(115,1906),
      anonasc4(116,1905),
      anonasc4(117,1904),
      anonasc4(118,1903),
      anonasc4(119,1902),
      anonasc4(120,1901),
      anonasc4(121,1900),

    ];
  }
}
class mesnasc4 {
  int id4;
  String mesTitle4;
  String mes4;

  mesnasc4(this.id4, this.mesTitle4, this.mes4);

  static List<mesnasc4> getMes4() {
    return <mesnasc4>[
      mesnasc4(0, 'Mes','00'),
      mesnasc4(1, 'Janeiro','01'),
      mesnasc4(2, 'Fevereiro','02'),
      mesnasc4(3, 'Março','03'),
      mesnasc4(4, 'Abril','04'),
      mesnasc4(5, 'Maio','05'),
      mesnasc4(6, 'Junho','06'),
      mesnasc4(7, 'Julho','07'),
      mesnasc4(8, 'Agosto','08'),
      mesnasc4(9, 'Setembro','09'),
      mesnasc4(10, 'Outubro', '10'),
      mesnasc4(11, 'Novembro', '11'),
      mesnasc4(12, 'Dezembro', '12')
    ];
  }
}
class dianasc5 {
  int id5;
  String dia5;

  dianasc5(this.id5, this.dia5);

  static List<dianasc5> getDia5() {
    return <dianasc5>[
      dianasc5(0, 'Dia'),
      dianasc5(1, '01'),
      dianasc5(2, '02'),
      dianasc5(3, '03'),
      dianasc5(4, '04'),
      dianasc5(5, '05'),
      dianasc5(6, '06'),
      dianasc5(7, '07'),
      dianasc5(8, '08'),
      dianasc5(9, '09'),
      dianasc5(10, '10'),
      dianasc5(11, '11'),
      dianasc5(12, '12'),
      dianasc5(13, '13'),
      dianasc5(14, '14'),
      dianasc5(15, '15'),
      dianasc5(16, '16'),
      dianasc5(17, '17'),
      dianasc5(18, '18'),
      dianasc5(19, '19'),
      dianasc5(20, '20'),
      dianasc5(21, '21'),
      dianasc5(22, '22'),
      dianasc5(23, '23'),
      dianasc5(24, '24'),
      dianasc5(25, '25'),
      dianasc5(26, '26'),
      dianasc5(27, '27'),
      dianasc5(28, '28'),
      dianasc5(29, '29'),
      dianasc5(30, '30'),
      dianasc5(31, '31')

    ];
  }
}
class anonasc5 {
  int id5;
  int ano5;

  anonasc5(this.id5, this.ano5);

  static List<anonasc5> getAno5() {
    return <anonasc5>[
      anonasc5(0,0000),
      anonasc5(1,2020),
      anonasc5(2,2019),
      anonasc5(3,2018),
      anonasc5(4,2017),
      anonasc5(5,2016),
      anonasc5(6,2015),
      anonasc5(7,2014),
      anonasc5(8,2013),
      anonasc5(9,2012),
      anonasc5(10,2011),
      anonasc5(11,2010),
      anonasc5(12,2009),
      anonasc5(13,2008),
      anonasc5(14,2007),
      anonasc5(15,2006),
      anonasc5(16,2005),
      anonasc5(17,2004),
      anonasc5(18,2003),
      anonasc5(19,2002),
      anonasc5(20,2001),
      anonasc5(21,2000),
      anonasc5(22,1999),
      anonasc5(23,1998),
      anonasc5(24,1997),
      anonasc5(25,1996),
      anonasc5(26,1995),
      anonasc5(27,1994),
      anonasc5(28,1993),
      anonasc5(29,1992),
      anonasc5(30,1991),
      anonasc5(31,1990),
      anonasc5(32,1989),
      anonasc5(33,1988),
      anonasc5(34,1987),
      anonasc5(35,1986),
      anonasc5(36,1985),
      anonasc5(37,1984),
      anonasc5(38,1983),
      anonasc5(39,1982),
      anonasc5(40,1981),
      anonasc5(41,1980),
      anonasc5(42,1979),
      anonasc5(43,1978),
      anonasc5(44,1977),
      anonasc5(45,1976),
      anonasc5(46,1975),
      anonasc5(47,1974),
      anonasc5(48,1973),
      anonasc5(49,1972),
      anonasc5(50,1971),
      anonasc5(51,1970),
      anonasc5(52,1969),
      anonasc5(53,1968),
      anonasc5(54,1967),
      anonasc5(55,1966),
      anonasc5(56,1965),
      anonasc5(57,1964),
      anonasc5(58,1963),
      anonasc5(59,1962),
      anonasc5(60,1961),
      anonasc5(61,1960),
      anonasc5(62,1959),
      anonasc5(63,1958),
      anonasc5(64,1957),
      anonasc5(65,1956),
      anonasc5(66,1955),
      anonasc5(67,1954),
      anonasc5(68,1953),
      anonasc5(69,1952),
      anonasc5(70,1951),
      anonasc5(71,1950),
      anonasc5(72,1949),
      anonasc5(73,1948),
      anonasc5(74,1947),
      anonasc5(75,1946),
      anonasc5(76,1945),
      anonasc5(77,1944),
      anonasc5(78,1943),
      anonasc5(79,1942),
      anonasc5(80,1941),
      anonasc5(81,1940),
      anonasc5(82,1939),
      anonasc5(83,1938),
      anonasc5(84,1937),
      anonasc5(85,1936),
      anonasc5(86,1935),
      anonasc5(87,1934),
      anonasc5(88,1933),
      anonasc5(89,1932),
      anonasc5(90,1931),
      anonasc5(91,1930),
      anonasc5(92,1929),
      anonasc5(93,1928),
      anonasc5(94,1927),
      anonasc5(95,1926),
      anonasc5(96,1925),
      anonasc5(97,1924),
      anonasc5(98,1923),
      anonasc5(99,1922),
      anonasc5(100,1921),
      anonasc5(101,1920),
      anonasc5(102,1919),
      anonasc5(103,1918),
      anonasc5(104,1917),
      anonasc5(105,1916),
      anonasc5(106,1915),
      anonasc5(107,1914),
      anonasc5(108,1913),
      anonasc5(109,1912),
      anonasc5(110,1911),
      anonasc5(111,1910),
      anonasc5(112,1909),
      anonasc5(113,1908),
      anonasc5(114,1907),
      anonasc5(115,1906),
      anonasc5(116,1905),
      anonasc5(117,1904),
      anonasc5(118,1903),
      anonasc5(119,1902),
      anonasc5(120,1901),
      anonasc5(121,1900),

    ];
  }
}
class mesnasc5 {
  int id5;
  String mesTitle5;
  String mes5;

  mesnasc5(this.id5, this.mesTitle5, this.mes5);

  static List<mesnasc5> getMes5() {
    return <mesnasc5>[
      mesnasc5(0, 'Mes','00'),
      mesnasc5(1, 'Janeiro','01'),
      mesnasc5(2, 'Fevereiro','02'),
      mesnasc5(3, 'Março','03'),
      mesnasc5(4, 'Abril','04'),
      mesnasc5(5, 'Maio','05'),
      mesnasc5(6, 'Junho','06'),
      mesnasc5(7, 'Julho','07'),
      mesnasc5(8, 'Agosto','08'),
      mesnasc5(9, 'Setembro','09'),
      mesnasc5(10, 'Outubro', '10'),
      mesnasc5(11, 'Novembro', '11'),
      mesnasc5(12, 'Dezembro', '12')
    ];
  }
}
//
class dianasc6 {
  int id6;
  String dia6;

  dianasc6(this.id6, this.dia6);

  static List<dianasc6> getDia6() {
    return <dianasc6>[
      dianasc6(0, 'Dia'),
      dianasc6(1, '01'),
      dianasc6(2, '02'),
      dianasc6(3, '03'),
      dianasc6(4, '04'),
      dianasc6(5, '05'),
      dianasc6(6, '06'),
      dianasc6(7, '07'),
      dianasc6(8, '08'),
      dianasc6(9, '09'),
      dianasc6(10, '10'),
      dianasc6(11, '11'),
      dianasc6(12, '12'),
      dianasc6(13, '13'),
      dianasc6(14, '14'),
      dianasc6(15, '15'),
      dianasc6(16, '16'),
      dianasc6(17, '17'),
      dianasc6(18, '18'),
      dianasc6(19, '19'),
      dianasc6(20, '20'),
      dianasc6(21, '21'),
      dianasc6(22, '22'),
      dianasc6(23, '23'),
      dianasc6(24, '24'),
      dianasc6(25, '25'),
      dianasc6(26, '26'),
      dianasc6(27, '27'),
      dianasc6(28, '28'),
      dianasc6(29, '29'),
      dianasc6(30, '30'),
      dianasc6(31, '31')

    ];
  }
}
class anonasc6 {
  int id6;
  int ano6;

  anonasc6(this.id6, this.ano6);

  static List<anonasc6> getAno6() {
    return <anonasc6>[
      anonasc6(0,0000),
      anonasc6(1,2020),
      anonasc6(2,2019),
      anonasc6(3,2018),
      anonasc6(4,2017),
      anonasc6(5,2016),
      anonasc6(6,2015),
      anonasc6(7,2014),
      anonasc6(8,2013),
      anonasc6(9,2012),
      anonasc6(10,2011),
      anonasc6(11,2010),
      anonasc6(12,2009),
      anonasc6(13,2008),
      anonasc6(14,2007),
      anonasc6(15,2006),
      anonasc6(16,2005),
      anonasc6(17,2004),
      anonasc6(18,2003),
      anonasc6(19,2002),
      anonasc6(20,2001),
      anonasc6(21,2000),
      anonasc6(22,1999),
      anonasc6(23,1998),
      anonasc6(24,1997),
      anonasc6(25,1996),
      anonasc6(26,1995),
      anonasc6(27,1994),
      anonasc6(28,1993),
      anonasc6(29,1992),
      anonasc6(30,1991),
      anonasc6(31,1990),
      anonasc6(32,1989),
      anonasc6(33,1988),
      anonasc6(34,1987),
      anonasc6(35,1986),
      anonasc6(36,1985),
      anonasc6(37,1984),
      anonasc6(38,1983),
      anonasc6(39,1982),
      anonasc6(40,1981),
      anonasc6(41,1980),
      anonasc6(42,1979),
      anonasc6(43,1978),
      anonasc6(44,1977),
      anonasc6(45,1976),
      anonasc6(46,1975),
      anonasc6(47,1974),
      anonasc6(48,1973),
      anonasc6(49,1972),
      anonasc6(50,1971),
      anonasc6(51,1970),
      anonasc6(52,1969),
      anonasc6(53,1968),
      anonasc6(54,1967),
      anonasc6(55,1966),
      anonasc6(56,1965),
      anonasc6(57,1964),
      anonasc6(58,1963),
      anonasc6(59,1962),
      anonasc6(60,1961),
      anonasc6(61,1960),
      anonasc6(62,1959),
      anonasc6(63,1958),
      anonasc6(64,1957),
      anonasc6(65,1956),
      anonasc6(66,1955),
      anonasc6(67,1954),
      anonasc6(68,1953),
      anonasc6(69,1952),
      anonasc6(70,1951),
      anonasc6(71,1950),
      anonasc6(72,1949),
      anonasc6(73,1948),
      anonasc6(74,1947),
      anonasc6(75,1946),
      anonasc6(76,1945),
      anonasc6(77,1944),
      anonasc6(78,1943),
      anonasc6(79,1942),
      anonasc6(80,1941),
      anonasc6(81,1940),
      anonasc6(82,1939),
      anonasc6(83,1938),
      anonasc6(84,1937),
      anonasc6(85,1936),
      anonasc6(86,1935),
      anonasc6(87,1934),
      anonasc6(88,1933),
      anonasc6(89,1932),
      anonasc6(90,1931),
      anonasc6(91,1930),
      anonasc6(92,1929),
      anonasc6(93,1928),
      anonasc6(94,1927),
      anonasc6(95,1926),
      anonasc6(96,1925),
      anonasc6(97,1924),
      anonasc6(98,1923),
      anonasc6(99,1922),
      anonasc6(100,1921),
      anonasc6(101,1920),
      anonasc6(102,1919),
      anonasc6(103,1918),
      anonasc6(104,1917),
      anonasc6(105,1916),
      anonasc6(106,1915),
      anonasc6(107,1914),
      anonasc6(108,1913),
      anonasc6(109,1912),
      anonasc6(110,1911),
      anonasc6(111,1910),
      anonasc6(112,1909),
      anonasc6(113,1908),
      anonasc6(114,1907),
      anonasc6(115,1906),
      anonasc6(116,1905),
      anonasc6(117,1904),
      anonasc6(118,1903),
      anonasc6(119,1902),
      anonasc6(120,1901),
      anonasc6(121,1900),

    ];
  }
}
class mesnasc6 {
  int id6;
  String mesTitle6;
  String mes6;

  mesnasc6(this.id6, this.mesTitle6, this.mes6);

  static List<mesnasc6> getMes6() {
    return <mesnasc6>[
      mesnasc6(0, 'Mes','00'),
      mesnasc6(1, 'Janeiro','01'),
      mesnasc6(2, 'Fevereiro','02'),
      mesnasc6(3, 'Março','03'),
      mesnasc6(4, 'Abril','04'),
      mesnasc6(5, 'Maio','05'),
      mesnasc6(6, 'Junho','06'),
      mesnasc6(7, 'Julho','07'),
      mesnasc6(8, 'Agosto','08'),
      mesnasc6(9, 'Setembro','09'),
      mesnasc6(10, 'Outubro', '10'),
      mesnasc6(11, 'Novembro', '11'),
      mesnasc6(12, 'Dezembro', '12')
    ];
  }
}