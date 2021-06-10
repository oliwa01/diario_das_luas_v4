import 'package:diario_das_luas/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;


import 'DetalhesConstelacoes.dart';
import 'GeraFotos.dart';
import 'HomeDesktop.dart';
import 'SimuleDesktop.dart';
import 'constelacoes.dart';

class TransitoContelacoes extends StatefulWidget {
  String nome;
  String email;
  String s1;
  String s2;

  TransitoContelacoes(this.nome,this.email,this.s1,this.s2);

  @override
  _TransitoContelacoesState createState() => _TransitoContelacoesState();
}

class _TransitoContelacoesState extends State<TransitoContelacoes> {
  FocusNode myFocusNode;
  GlobalKey _containerKey = GlobalKey();
  bool loading = false;
  String _horaPicket = " ";
  String _dataPicket = " ";
  String _diadataPicket = "";
  String _mesdataPicket = "";
  String _anodataPicket = "";

  String _signofinal = "";
  String _nome;
  bool _mostraLayout = true;
  bool _mostraImagem = false;
  bool _nomealterado = false;
  bool _dataalterada = false;
  bool _diadataalterada = false;
  bool _mesdataalterada = false;
  bool _anodataalterada = false;
  bool _horadataalterada = false;
  bool _mindataalterada = false;
  bool _mostrabotaoimagem = false;
  //
  String _dataDb1;
  String _datasLuaFind;
  String _timeDb1 = " ";
  String _proximoDb1 = " ";
  String _signoDb1 = " ";
  double _distanciaDb1;
  int _luadiaDb1 = 0;
  //
  int _hora = 0;
  int _minuto = 0;
  //


  List<horanasc> _horaDropdown = horanasc.getHora();
  List<minnasc> _minDropdown = minnasc.getMin();

  List<dianasc> _diaDropdown = dianasc.getDia();
  List<mesnasc> _mesDropdown = mesnasc.getMes();
  List<anonasc> _anoDropdown = anonasc.getAno();


  List<DropdownMenuItem<dianasc>> _dropdownMenuItemsdia;
  dianasc _selecteddianasc;
  List<DropdownMenuItem<mesnasc>> _dropdownMenuItemsmes;
  mesnasc _selectedmesnasc;
  List<DropdownMenuItem<anonasc>> _dropdownMenuItemsano;
  anonasc _selectedanonasc;
  List<DropdownMenuItem<horanasc>> _dropdownMenuItemshora;
  horanasc _selectedhoranasc;
  List<DropdownMenuItem<minnasc>> _dropdownMenuItemsmin;
  minnasc _selectedminnasc;
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
  List<DropdownMenuItem<horanasc>> buildDropdownMenuItemshora(List hora) {
    List<DropdownMenuItem<horanasc>> items = List();
    for (horanasc horanascimento in hora) {
      items.add(
        DropdownMenuItem(
          value: horanascimento,
          child: Text(horanascimento.hora),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<minnasc>> buildDropdownMenuItemsmin(List min) {
    List<DropdownMenuItem<minnasc>> items = List();
    for (minnasc minnascimento in min) {
      items.add(
        DropdownMenuItem(
          value: minnascimento,
          child: Text(minnascimento.min),
        ),
      );
    }
    return items;
  }
//
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
  //
  onChangeDropdownItemhora(horanasc selectedhoranasc) {

    setState(() {
      _selectedhoranasc = selectedhoranasc;
      _horadataalterada = true;
    });
    _verificaBotaoGeraImage();
  }

  onChangeDropdownItemmin(minnasc selectedminnasc) {
    setState(() {
      _selectedminnasc = selectedminnasc;
      _mindataalterada = true;
    });
    _verificaBotaoGeraImage();
  }

  _verificaBotaoGeraImage() {
    if((_diadataalterada == true) && (_mesdataalterada == true) && (_anodataalterada == true) && (_horadataalterada == true) && (_mindataalterada == true))
    {
      setState(() {
        _dataalterada = true;
      });
      _dataPicket = (_selectedanonasc.ano.toString()+_selectedmesnasc.mes.toString()+_selecteddianasc.dia.toString());
      _horaPicket = (_selectedhoranasc.hora.toString()+_selectedminnasc.min.toString());
      _geraDados(_dataPicket);
    }
  }
  //
  Future<void>_geraDados (String datalua) async {



    fs.Firestore luas = fb.firestore();
    fs.DocumentSnapshot documentSnapshot = await luas.collection("DiarioLuas").doc(datalua).get();
    var dadosdb = documentSnapshot.data();

    _salvaDados(dadosdb['ProximoDb'].toString(), dadosdb['SignosDb'], dadosdb['TimeDb']);
  }

  _salvaDados( String proximodb, String signodb, String timedb) {
    setState(() {
      _signoDb1 = signodb;
      _timeDb1 = timedb;
      _proximoDb1 = proximodb;

      if(_timeDb1.length == 4){
        _hora = int.parse(_timeDb1.substring(0,1));
        _minuto = int.parse(_timeDb1.substring(2,4));
      }else if (_timeDb1.length == 5) {
        _hora = int.parse(_timeDb1.substring(0,2));
        _minuto = int.parse(_timeDb1.substring(3,5));
      }
      if((_proximoDb1 == "D") && (int.parse(_horaPicket.substring(0,2)) < _hora)){ print ("signo1");} else
      if((_proximoDb1 == "D") && ((int.parse(_horaPicket.substring(0,2)) > _hora)) && ((int.parse(_horaPicket.substring(2,4)) > _minuto)) )
        { setState(() {
          _signofinal = _proximoDb1;
        });
      } else
      if((_proximoDb1 == "D") && ((int.parse(_horaPicket.substring(0,2)) > _hora)) && ((int.parse(_horaPicket.substring(2,4)) < _minuto)) )
      { setState(() {
        if (_signoDb1 == "ar"){_signofinal = "ta";} else
        if (_signoDb1 == "ta"){_signofinal = "ge";} else
        if (_signoDb1 == "ge"){_signofinal = "cn";} else
        if (_signoDb1 == "cn"){_signofinal = "le";} else
        if (_signoDb1 == "le"){_signofinal = "vi";} else
        if (_signoDb1 == "vi"){_signofinal = "li";} else
        if (_signoDb1 == "li"){_signofinal = "sc";} else
        if (_signoDb1 == "sc"){_signofinal = "sa";} else
        if (_signoDb1 == "sa"){_signofinal = "cp";} else
        if (_signoDb1 == "cp"){_signofinal = "aq";} else
        if (_signoDb1 == "aq"){_signofinal = "pi";} else
        if (_signoDb1 == "pi"){_signofinal = "ar";}

      });
      } else
      if((_proximoDb1 == "D") && ((int.parse(_horaPicket.substring(0,2)) == _hora)) && ((int.parse(_horaPicket.substring(2,4)) < _minuto)) )
      { setState(() {
        _signofinal = _proximoDb1;
        });
      } else
      if((_proximoDb1 == "D") && ((int.parse(_horaPicket.substring(0,2)) == _hora)) && ((int.parse(_horaPicket.substring(2,4)) >= _minuto)) )
      { setState(() {
        if (_signoDb1 == "ar"){_signofinal = "ta";} else
        if (_signoDb1 == "ta"){_signofinal = "ge";} else
        if (_signoDb1 == "ge"){_signofinal = "cn";} else
        if (_signoDb1 == "cn"){_signofinal = "le";} else
        if (_signoDb1 == "le"){_signofinal = "vi";} else
        if (_signoDb1 == "vi"){_signofinal = "li";} else
        if (_signoDb1 == "li"){_signofinal = "sc";} else
        if (_signoDb1 == "sc"){_signofinal = "sa";} else
        if (_signoDb1 == "sa"){_signofinal = "cp";} else
        if (_signoDb1 == "cp"){_signofinal = "aq";} else
        if (_signoDb1 == "aq"){_signofinal = "pi";} else
        if (_signoDb1 == "pi"){_signofinal = "ar";}
      })
      ;}
      else
      if((_proximoDb1 == "I") ){
        setState(() {
          _signofinal = _proximoDb1;
        });
      }

//
    });
  }

  _gerasigno(signo)  {

    if (signo == "cp")  {return ("assets/images/cap.png");} else
    if (signo == "aq")  {return ("assets/images/aq.png");} else
    if (signo == "pi")  {return ("assets/images/pe.png");} else
    if (signo == "ar")  {return ("assets/images/ar.png");} else
    if (signo == "ta")  {return ("assets/images/to.png");} else
    if (signo == "ge")  {return ("assets/images/ge.png");} else
    if (signo == "cn")  {return ("assets/images/ca.png");} else
    if (signo == "le")  {return ("assets/images/le.png");} else
    if (signo == "vi")  {return ("assets/images/vi.png");} else
    if (signo == "li")  {return ("assets/images/li.png");} else
    if (signo == "sc")  {return ("assets/images/es.png");} else
    if (signo == "sa")  {return ("assets/images/sa.png");} else
    {return("images/ca.png");}
  }

  //
  bool _page1 = true;
  bool _page2 = false;
  bool _page3 = false;
  bool _page4 = false;
  //
  void initState() {
    _signofinal = widget.s1;
    _dropdownMenuItemshora = buildDropdownMenuItemshora(_horaDropdown);
    _selectedhoranasc = _dropdownMenuItemshora[0].value;
    _dropdownMenuItemsmin = buildDropdownMenuItemsmin(_minDropdown);
    _selectedminnasc = _dropdownMenuItemsmin[0].value;
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

  String _descricao =
      "\n\n	Você nasceu em um dia que a Lua estava em transição de contelações, isto significa que para saber em qual contelação a Lua estava no seu nascimento é necessario informar qual o horario do seu nascimento.\n\n\v";


  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    bool portrait = (widthlua > 600 ? false: true);
    double  boxnomec       = (widthlua * 0.60);
    double  boxnomehc      = (heightlua * 0.06);
    double hbox = heightlua*0.08; // box nome e data
    double  font_adj = (widthlua > 1600) ? 25 :
    (widthlua > 1500)  ?  24 :
    (widthlua > 1400)  ?  24 :
    (widthlua > 1300)  ?  24 :
    (widthlua > 1200)  ?  24 :
    (widthlua > 1100)  ?  23 :
    (widthlua > 1000)  ?  23 :
    (widthlua > 900)  ?   22:
    (widthlua > 800)  ?   22 :
    (widthlua > 700)  ?   21 :
    (widthlua > 600)  ?   18 :
    (widthlua > 500)  ?   17 :
    (widthlua > 400)  ?   16 :
    (widthlua > 300)  ?   15:
    (widthlua > 200)  ?   12 :  11 ;


    //
    double nomesize = portrait ?
    (widthlua > 800 ? 35 : widthlua > 700 ? 30 : widthlua > 600 ? 26 : widthlua > 500 ? 25 : widthlua > 400 ? 16 : widthlua > 300 ? 16 : widthlua > 200 ? 16 : 16 )
        :
    (widthlua > 2100 ? widthlua /45 : widthlua > 2000 ? widthlua /44 : widthlua > 1900 ? widthlua /43 : widthlua > 1800 ? widthlua /41 : widthlua > 1700 ? widthlua /40 :
    widthlua > 1600 ? widthlua /38 :  widthlua > 1500 ? widthlua /35 : widthlua > 1400 ? widthlua /33 :  widthlua > 1300 ? widthlua /32 : widthlua > 1200 ? widthlua /31 :
    widthlua > 1100 ? widthlua /30 :  widthlua > 1000 ? widthlua /29 :  widthlua > 900 ? widthlua /26 : widthlua > 800 ? widthlua /25 : widthlua > 700 ? widthlua /18 : widthlua /16 );
    //
    double  titlesize = (widthlua > 1600) ? 30 :
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

    _dataalterada =  ((_diadataalterada == true) && (_mesdataalterada == true) && (_anodataalterada == true) && (_horadataalterada == true) && (_mindataalterada == true)) ? true : false;
    _dataPicket =("$_anodataPicket$_mesdataPicket$_diadataPicket");
    _mostrabotaoimagem = (_dataalterada == true) ? true : false;
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
                              Constelacoes(widget.nome, widget.email)));
                },
                child: Image.asset( "assets/images/iconseta.png",
                  width: 12, height: 12
                  , // add custom icons also
                )
            )),
        body: Container(
            padding: EdgeInsets.all(widthlua * 0.05),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fundodatas.png"),
                    fit: BoxFit.cover)),
            width: widthlua,
            height: heightlua,
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                  SizedBox(width: widthlua,
                      height: heightlua * 0.16,
                      child: Text(_descricao, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize:font_adj))),


                      SizedBox(height: heightlua * 0.01),
                      //texto data nascimento
                      SizedBox(
                        width: widthlua* 0.5,
                        height: heightlua * 0.04,
                        child: Text(
                            "Data Nascimento", textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: titlesize)
                        ),
                      ),
                      SizedBox(height: heightlua * 0.05),
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
                      SizedBox(height:heightlua * 0.03),
                           //texto data nascimento
                      SizedBox(
                        width: widthlua* 0.7,
                        height: heightlua * 0.04,
                        child: Text(
                            "Horário do  Nascimento", textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: titlesize)
                        ),
                      ),
                      SizedBox(height:heightlua * 0.04),
                      SizedBox(
                          width: widthlua*0.7+45,
                          height : hbox,
                          child: Material(
                            elevation: 10.0,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.blue,
                            //
                            //   Horário de Nascimento
                            //
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width: 45,
                                    child: Image.asset( "assets/images/clock.png",
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
                                                    value: _selectedhoranasc,
                                                    items: _dropdownMenuItemshora,
                                                    style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                    onTap: () {
                                                      FocusScopeNode currentFocus = FocusScope.of(context);
                                                      if (!currentFocus.hasPrimaryFocus) {
                                                        currentFocus.unfocus();
                                                      }
                                                    },
                                                    onChanged: onChangeDropdownItemhora,
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
                                                    value: _selectedminnasc,
                                                    items: _dropdownMenuItemsmin,
                                                    style: TextStyle(fontSize: nomesize,color: Colors.black),
                                                    onTap: () {
                                                      FocusScopeNode currentFocus = FocusScope.of(context);
                                                      if (!currentFocus.hasPrimaryFocus) {
                                                        currentFocus.unfocus();
                                                      }
                                                    },
                                                    onChanged: onChangeDropdownItemmin,
                                                    dropdownColor: Colors.white,
                                                  )),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                                )

                              ],
                            ),

                          )
                      ),
                      SizedBox(height:heightlua * 0.04),
                      SizedBox(
                        width: widthlua* 0.7,
                        height: (_mostrabotaoimagem ? heightlua*0.05 : 0),
                        child: Text(
                            "Sua Lua estava na Contelação de :", textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: titlesize)
                        ),
                      ),
                      SizedBox(height:heightlua * 0.04),
                      //
                      // botoes
                      //
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: widthlua*0.5,
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,_signofinal)));
                                    });
                                  },
                                  child: Image(image: AssetImage(_gerasigno(_signofinal)))),
                                ),
                            SizedBox(width: widthlua*0.04),
                            SizedBox(
                                width: widthlua*0.25,
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
                                              builder: (context) =>
                                                  Constelacoes(widget.nome, widget.email)));


                                    });
                                  },
                                  child: Text(
                                    "Voltar",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ])
                ])
            )
        )
    )
    );
  }}
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
      anonasc(1,2022),
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
class horanasc {
  int id;
  String hora;

  horanasc(this.id, this.hora);

  static List<horanasc> getHora() {
    return <horanasc>[
      horanasc(0, 'Hora'),
      horanasc(1, '00'),
      horanasc(2, '01'),
      horanasc(3, '02'),
      horanasc(4, '03'),
      horanasc(5, '04'),
      horanasc(6, '05'),
      horanasc(7, '06'),
      horanasc(8, '07'),
      horanasc(9, '08'),
      horanasc(10, '09'),
      horanasc(11, '10'),
      horanasc(12, '11'),
      horanasc(13, '12'),
      horanasc(14, '13'),
      horanasc(15, '14'),
      horanasc(16, '15'),
      horanasc(17, '16'),
      horanasc(18, '17'),
      horanasc(19, '18'),
      horanasc(20, '19'),
      horanasc(21, '20'),
      horanasc(22, '21'),
      horanasc(23, '22'),
      horanasc(24, '23')
     ];
  }
}
class minnasc {
  int id;
  String min;

  minnasc(this.id, this.min);

  static List<minnasc> getMin() {
    return <minnasc>[
      minnasc(00, 'Min'),
      minnasc(01, '00'),
      minnasc(02, '01'),
      minnasc(03, '02'),
      minnasc(04, '03'),
      minnasc(05, '04'),
      minnasc(06, '05'),
      minnasc(07, '06'),
      minnasc(08, '07'),
      minnasc(09, '08'),
      minnasc(10, '09'),
      minnasc(11, '10'),
      minnasc(12, '11'),
      minnasc(13, '12'),
      minnasc(14, '13'),
      minnasc(15, '14'),
      minnasc(16, '15'),
      minnasc(17, '16'),
      minnasc(18, '17'),
      minnasc(19, '18'),
      minnasc(20, '19'),
      minnasc(21, '20'),
      minnasc(22, '21'),
      minnasc(23, '22'),
      minnasc(24, '23'),
      minnasc(25, '24'),
      minnasc(26, '25'),
      minnasc(27, '26'),
      minnasc(28, '27'),
      minnasc(29, '28'),
      minnasc(30, '29'),
      minnasc(31, '30'),
      minnasc(32, '31'),
      minnasc(33, '32'),
      minnasc(34, '33'),
      minnasc(35, '34'),
      minnasc(36, '35'),
      minnasc(37, '36'),
      minnasc(38, '37'),
      minnasc(39, '38'),
      minnasc(40, '39'),
      minnasc(41, '40'),
      minnasc(42, '40'),
      minnasc(43, '41'),
      minnasc(44, '42'),
      minnasc(45, '43'),
      minnasc(46, '44'),
      minnasc(47, '45'),
      minnasc(48, '46'),
      minnasc(49, '47'),
      minnasc(50, '48'),
      minnasc(51, '49'),
      minnasc(52, '50'),
      minnasc(53, '51'),
      minnasc(54, '52'),
      minnasc(55, '53'),
      minnasc(56, '54'),
      minnasc(57, '55'),
      minnasc(58, '56'),
      minnasc(59, '57'),
      minnasc(50, '58'),
      minnasc(60, '59'),
      minnasc(61, '60')



    ];
  }
}