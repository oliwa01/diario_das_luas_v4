import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diario_das_luas/model/Usuario1.dart';
import 'package:diario_das_luas/model/Usuario2.dart';
import 'package:diario_das_luas/model/Usuario3.dart';
import 'package:diario_das_luas/model/Usuario4.dart';
import 'package:diario_das_luas/model/Usuario5.dart';
import 'package:diario_das_luas/model/Usuario6.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'HomeDesktop.dart';
import 'SimuleDesktop.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Comprar extends StatefulWidget {
  String nome;
  String email;
  int numberPictures;
  String dataPicket1;
  String dataPicket2;
  String dataPicket3;
  String dataPicket4;
  String dataPicket5;
  String dataPicket6;
  String nomefamilia;
  String nome1;
  String nome2;
  String nome3;
  String nome4;
  String nome5;
  String nome6;
  double distancia1;
  double distancia2;
  double distancia3;
  double distancia4;
  double distancia5;
  double distancia6;
  int luadiadb1;
  int luadiadb2;
  int luadiadb3;
  int luadiadb4;
  int luadiadb5;
  int luadiadb6;
  String proximodb1;
  String proximodb2;
  String proximodb3;
  String proximodb4;
  String proximodb5;
  String proximodb6;
  String signosdb1;
  String signosdb2;
  String signosdb3;
  String signosdb4;
  String signosdb5;
  String signosdb6;
  String timedb1;
  String timedb2;
  String timedb3;
  String timedb4;
  String timedb5;
  String timedb6;

  Comprar(
      this.nome,
      this.email,
      this.numberPictures,
      this.nomefamilia,
      this.dataPicket1,
      this.dataPicket2,
      this.dataPicket3,
      this.dataPicket4,
      this.dataPicket5,
      this.dataPicket6,
      this.nome1,
      this.nome2,
      this.nome3,
      this.nome4,
      this.nome5,
      this.nome6,
      this.distancia1,
      this.distancia2,
      this.distancia3,
      this.distancia4,
      this.distancia5,
      this.distancia6,
      this.luadiadb1,
      this.luadiadb2,
      this.luadiadb3,
      this.luadiadb4,
      this.luadiadb5,
      this.luadiadb6,
      this.proximodb1,
      this.proximodb2,
      this.proximodb3,
      this.proximodb4,
      this.proximodb5,
      this.proximodb6,
      this.signosdb1,
      this.signosdb2,
      this.signosdb3,
      this.signosdb4,
      this.signosdb5,
      this.signosdb6,
      this.timedb1,
      this.timedb2,
      this.timedb3,
      this.timedb4,
      this.timedb5,
      this.timedb6,
      );
  @override
  _ComprarState createState() => _ComprarState();
}

class _ComprarState extends State<Comprar> {

  GlobalKey<ConvexAppBarState> _appBarKey3 = GlobalKey<ConvexAppBarState>();
  String _dataTimeDb;
  String _codVenda;
  String _nomeUsuario;

  TextEditingController _controllerEmail = TextEditingController(text: "");
  TextEditingController _controllerSenha = TextEditingController(text: "");
  String _mensagemErro = "";

  //
  _cadastrarUsuario1( Usuario1 usuario1 ){

    //Salvar dados do usuário
    Firestore db = Firestore.instance;

    db.collection("usuarios")
        .document(usuario1.email)
        .collection("fotos")
        .document(_codVenda)
        .setData( usuario1.toMap() );
  }

  _cadastrarUsuario2( Usuario2 usuario2 ){



    //Salvar dados do usuário
    Firestore db = Firestore.instance;

    db.collection("usuarios")
        .document(usuario2.email)
        .collection("fotos")
        .document(_codVenda)
        .setData( usuario2.toMap() );
  }

  _cadastrarUsuario3( Usuario3 usuario3 ){


    //Salvar dados do usuário
    Firestore db = Firestore.instance;

    db.collection("usuarios")
        .document(usuario3.email)
        .collection("fotos")
        .document(_codVenda)
        .setData( usuario3.toMap() );
  }

  _cadastrarUsuario4( Usuario4 usuario4 ){

    //Salvar dados do usuário
    Firestore db = Firestore.instance;

    db.collection("usuarios")
        .document(usuario4.email)
        .collection("fotos")
        .document(_codVenda)
        .setData( usuario4.toMap() );
  }

  _cadastrarUsuario5( Usuario5 usuario5 ){

    //Salvar dados do usuário
    Firestore db = Firestore.instance;

    db.collection("usuarios")
        .document(usuario5.email)
        .collection("fotos")
        .document(_codVenda)
        .setData( usuario5.toMap() );
  }

  _cadastrarUsuario6( Usuario6 usuario6 ){

    //Salvar dados do usuário
    Firestore db = Firestore.instance;

    db.collection("usuarios")
        .document(usuario6.email)
        .collection("fotos")
        .document(_codVenda)
        .setData( usuario6.toMap() );
  }
  //




  void  _gerarCompra (String email) {

    setState(() {_mensagemErro = " ";});

    DateTime now = DateTime.now();
    String _formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    String _formattedDate2 = DateFormat('MMddkkmmss').format(now);
    _dataTimeDb = _formattedDate;
    _codVenda = _formattedDate2;

    if (widget.numberPictures == 1) {
      Usuario1 usuario1 = Usuario1();
      usuario1.email = email;
      usuario1.numberPicture = widget.numberPictures;
      usuario1.dataPicket1 = widget.dataPicket1;
      usuario1.nome1 = widget.nome1;
      usuario1.distanciaDb1 = widget.distancia1;
      usuario1.luadiadb1 = widget.luadiadb1;
      usuario1.proximodb1 = widget.proximodb1;
      usuario1.signosdb1 = widget.signosdb1;
      usuario1.timedb1 = widget.timedb1;
      usuario1.codVenda = _codVenda;
      _cadastrarUsuario1( usuario1 );}
    else
    if (widget.numberPictures == 2) {
      Usuario2 usuario2 = Usuario2();
      usuario2.email = email;
      usuario2.numberPicture = widget.numberPictures;
      usuario2.nomefamilia = widget.nomefamilia;


      usuario2.dataPicket1 = widget.dataPicket1;
      usuario2.dataPicket2 = widget.dataPicket2;

      usuario2.nome1 = widget.nome1;
      usuario2.nome2 = widget.nome2;

      usuario2.distanciaDb1 = widget.distancia1;
      usuario2.distanciaDb2 = widget.distancia2;

      usuario2.luadiadb1 = widget.luadiadb1;
      usuario2.luadiadb2 = widget.luadiadb2;

      usuario2.proximodb1 = widget.proximodb1;
      usuario2.proximodb2 = widget.proximodb2;

      usuario2.signosdb1 = widget.signosdb1;
      usuario2.signosdb2 = widget.signosdb2;

      usuario2.timedb1 = widget.timedb1;
      usuario2.timedb2 = widget.timedb2;

      usuario2.codVenda = _codVenda;
      _cadastrarUsuario2( usuario2 );}
    else
    if (widget.numberPictures == 3) {
      Usuario3 usuario3 = Usuario3();
      usuario3.email = email;
      usuario3.numberPicture = widget.numberPictures;
      usuario3.nomefamilia = widget.nomefamilia;

      usuario3.dataPicket1 = widget.dataPicket1;
      usuario3.dataPicket2 = widget.dataPicket2;
      usuario3.dataPicket3 = widget.dataPicket3;

      usuario3.nome1 = widget.nome1;
      usuario3.nome2 = widget.nome2;
      usuario3.nome3 = widget.nome3;

      usuario3.distanciaDb1 = widget.distancia1;
      usuario3.distanciaDb2 = widget.distancia2;
      usuario3.distanciaDb3 = widget.distancia3;

      usuario3.luadiadb1 = widget.luadiadb1;
      usuario3.luadiadb2 = widget.luadiadb2;
      usuario3.luadiadb3 = widget.luadiadb3;

      usuario3.proximodb1 = widget.proximodb1;
      usuario3.proximodb2 = widget.proximodb2;
      usuario3.proximodb3 = widget.proximodb3;

      usuario3.signosdb1 = widget.signosdb1;
      usuario3.signosdb2 = widget.signosdb2;
      usuario3.signosdb3 = widget.signosdb3;

      usuario3.timedb1 = widget.timedb1;
      usuario3.timedb2 = widget.timedb2;
      usuario3.timedb3 = widget.timedb3;

      usuario3.codVenda = _codVenda;

      _cadastrarUsuario3( usuario3 );}
    else
    if (widget.numberPictures == 4) {
      Usuario4 usuario4 = Usuario4();
      usuario4.email = email;
      usuario4.numberPicture = widget.numberPictures;
      usuario4.nomefamilia = widget.nomefamilia;

      usuario4.dataPicket1 = widget.dataPicket1;
      usuario4.dataPicket2 = widget.dataPicket2;
      usuario4.dataPicket3 = widget.dataPicket3;
      usuario4.dataPicket4= widget.dataPicket4;


      usuario4.nome1 = widget.nome1;
      usuario4.nome2 = widget.nome2;
      usuario4.nome3 = widget.nome3;
      usuario4.nome4 = widget.nome4;


      usuario4.distanciaDb1 = widget.distancia1;
      usuario4.distanciaDb2 = widget.distancia2;
      usuario4.distanciaDb3 = widget.distancia3;
      usuario4.distanciaDb4 = widget.distancia4;


      usuario4.luadiadb1 = widget.luadiadb1;
      usuario4.luadiadb2 = widget.luadiadb2;
      usuario4.luadiadb3 = widget.luadiadb3;
      usuario4.luadiadb4 = widget.luadiadb4;


      usuario4.proximodb1 = widget.proximodb1;
      usuario4.proximodb2 = widget.proximodb2;
      usuario4.proximodb3 = widget.proximodb3;
      usuario4.proximodb4 = widget.proximodb4;

      usuario4.signosdb1 = widget.signosdb1;
      usuario4.signosdb2 = widget.signosdb2;
      usuario4.signosdb3 = widget.signosdb3;
      usuario4.signosdb4 = widget.signosdb4;

      usuario4.timedb1 = widget.timedb1;
      usuario4.timedb2 = widget.timedb2;
      usuario4.timedb3 = widget.timedb3;
      usuario4.timedb4 = widget.timedb4;


      usuario4.codVenda = _codVenda;
      _cadastrarUsuario4( usuario4 );}
    else
    if (widget.numberPictures == 5) {
      Usuario5 usuario5 = Usuario5();
      usuario5.email = email;
      usuario5.numberPicture = widget.numberPictures;
      usuario5.nomefamilia = widget.nomefamilia;

      usuario5.dataPicket1 = widget.dataPicket1;
      usuario5.dataPicket2 = widget.dataPicket2;
      usuario5.dataPicket3 = widget.dataPicket3;
      usuario5.dataPicket4= widget.dataPicket4;
      usuario5.dataPicket5 = widget.dataPicket5;

      usuario5.nome1 = widget.nome1;
      usuario5.nome2 = widget.nome2;
      usuario5.nome3 = widget.nome3;
      usuario5.nome4 = widget.nome4;
      usuario5.nome5 = widget.nome5;

      usuario5.distanciaDb1 = widget.distancia1;
      usuario5.distanciaDb2 = widget.distancia2;
      usuario5.distanciaDb3 = widget.distancia3;
      usuario5.distanciaDb4 = widget.distancia4;
      usuario5.distanciaDb5 = widget.distancia5;

      usuario5.luadiadb1 = widget.luadiadb1;
      usuario5.luadiadb2 = widget.luadiadb2;
      usuario5.luadiadb3 = widget.luadiadb3;
      usuario5.luadiadb4 = widget.luadiadb4;
      usuario5.luadiadb5 = widget.luadiadb5;

      usuario5.proximodb1 = widget.proximodb1;
      usuario5.proximodb2 = widget.proximodb2;
      usuario5.proximodb3 = widget.proximodb3;
      usuario5.proximodb4 = widget.proximodb4;
      usuario5.proximodb5 = widget.proximodb5;

      usuario5.signosdb1 = widget.signosdb1;
      usuario5.signosdb2 = widget.signosdb2;
      usuario5.signosdb3 = widget.signosdb3;
      usuario5.signosdb4 = widget.signosdb4;
      usuario5.signosdb5 = widget.signosdb5;

      usuario5.timedb1 = widget.timedb1;
      usuario5.timedb2 = widget.timedb2;
      usuario5.timedb3 = widget.timedb3;
      usuario5.timedb4 = widget.timedb4;
      usuario5.timedb5 = widget.timedb5;

      usuario5.codVenda = _codVenda;
      _cadastrarUsuario5( usuario5 );}
    else
    if (widget.numberPictures == 6) {
      Usuario6 usuario6 = Usuario6();
      usuario6.email = email;
      usuario6.numberPicture = widget.numberPictures;
      usuario6.nomefamilia = widget.nomefamilia;

      usuario6.dataPicket1 = widget.dataPicket1;
      usuario6.dataPicket2 = widget.dataPicket2;
      usuario6.dataPicket3 = widget.dataPicket3;
      usuario6.dataPicket4 = widget.dataPicket4;
      usuario6.dataPicket5 = widget.dataPicket5;
      usuario6.dataPicket6 = widget.dataPicket6;

      usuario6.nome1 = widget.nome1;
      usuario6.nome2 = widget.nome2;
      usuario6.nome3 = widget.nome3;
      usuario6.nome4 = widget.nome4;
      usuario6.nome5 = widget.nome5;
      usuario6.nome6 = widget.nome6;

      usuario6.distanciaDb1 = widget.distancia1;
      usuario6.distanciaDb2 = widget.distancia2;
      usuario6.distanciaDb3 = widget.distancia3;
      usuario6.distanciaDb4 = widget.distancia4;
      usuario6.distanciaDb5 = widget.distancia5;
      usuario6.distanciaDb6 = widget.distancia6;

      usuario6.luadiadb1 = widget.luadiadb1;
      usuario6.luadiadb2 = widget.luadiadb2;
      usuario6.luadiadb3 = widget.luadiadb3;
      usuario6.luadiadb4 = widget.luadiadb4;
      usuario6.luadiadb5 = widget.luadiadb5;
      usuario6.luadiadb6 = widget.luadiadb6;

      usuario6.proximodb1 = widget.proximodb1;
      usuario6.proximodb2 = widget.proximodb2;
      usuario6.proximodb3 = widget.proximodb3;
      usuario6.proximodb4 = widget.proximodb4;
      usuario6.proximodb5 = widget.proximodb5;
      usuario6.proximodb6 = widget.proximodb6;

      usuario6.signosdb1 = widget.signosdb1;
      usuario6.signosdb2 = widget.signosdb2;
      usuario6.signosdb3 = widget.signosdb3;
      usuario6.signosdb4 = widget.signosdb4;
      usuario6.signosdb5 = widget.signosdb5;
      usuario6.signosdb6 = widget.signosdb6;

      usuario6.timedb1 = widget.timedb1;
      usuario6.timedb2 = widget.timedb2;
      usuario6.timedb3 = widget.timedb3;
      usuario6.timedb4 = widget.timedb4;
      usuario6.timedb5 = widget.timedb5;
      usuario6.timedb6 = widget.timedb6;

      usuario6.codVenda = _codVenda;

      _cadastrarUsuario6( usuario6 );}

  }
    _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  void initState() {
    _gerarCompra(widget.email);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _launched = " ";
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    double  w80p = widthlua * 0.80;
    double  w90p = widthlua * 0.90;
    double  w100p = widthlua;
    double  font_adj = (widthlua > 1600) ? 44:
    (widthlua > 1500)  ?  43 :
    (widthlua > 1400)  ?  42 :
    (widthlua > 1300)  ?  41 :
    (widthlua > 1200)  ?  40 :
    (widthlua > 1100)  ?  41 :
    (widthlua > 1000)  ?  41 :
    (widthlua > 900)  ?   40:
    (widthlua > 800)  ?   39 :
    (widthlua > 700)  ?   36 :
    (widthlua > 600)  ?   30 :
    (widthlua > 500)  ?   22 :
    (widthlua > 400)  ?   20 :
    (widthlua > 300)  ?   18 :
    (widthlua > 200)  ?   17 :  16 ;
    double  h10p = heightlua * 0.10;
    double  h60p = heightlua * 0.60;
    double  h30p = heightlua * 0.30;
    bool portrait = (widthlua > heightlua ? false: true);

    String c1 = "Sua foto foi salva, você pode ser encaminhado para o site de vendas, onde podera ver as opções de tipo de papel da foto\n\nCodigo de venda: $_codVenda.\n\n Informe este codigo no site de vendas , para sua foto ser localizada.";
 //
    String c11 ="\n\n PREÇOS:"+
        "\nSomente a Foto:"+
    "\n\nTam 20x25cm R\u002460,00 + frete"+
    "\nTam 30x40cm R\u002480,00 + frete"+
    "\nTam 50x60cm R\u0024100,00 + frete"+

    "\n\nFoto na moldura preta com Borda de 3x3cm"+
    "\nTam 20x25cm R\u0024160,00 + frete"+
    "\nTam 30x40cm R\u0024220,00 + frete"+
    "\nTam 50x60cm R\u0024400,00 + frete"+
    "\n\n "+
    "\nArquivo Digital - Alta Definição - R\u002470,00 + frete";
    //
    String c12 ="\n\n PREÇOS:"+
        "\nSomente a Foto:"+
        "\n\nTam 20x60cm R\u0024135,00 + frete"+
        "\nTam 30x90cm R\u0024160,00 + frete"+
        "\nTam 40x120cm R\u0024240,00 + frete"+

        "\n\nNa moldura preta com Borda de 3x3cm"+
        "\nTam 20x60cm R\u0024220,00 + frete"+
        "\nTam 30x90cm R\u0024360,00 + frete"+
        "\nTam 40x120cm R\u0024450,00 + frete"+
        "\n\n "+
        "\nArquivo Digital - Alta Definição - R\u002480,00 + frete";
    //
    String c13 ="\n\n PREÇOS:"+
        "\nSomente a Foto:"+
        "\n\nTam 20x60cm R\u0024170,00 + frete"+
        "\nTam 30x90cm R\u0024190,00 + frete"+
        "\nTam 40x120cm R\u0024230,00 + frete"+

        "\n\nNa moldura preta com Borda de 3x3cm"+
        "\nTam 20x60cm R\u0024260,00 + frete"+
        "\nTam 30x90cm R\u0024400,00 + frete"+
        "\nTam 40x120cm R\u0024550,00 + frete"+
        "\n\n "+
        "\nArquivo Digital - Alta Definição - R\u002490,00 + frete";
    //
    String c14 ="\n\n PREÇOS:"+
        "\nSomente a Foto:"+
        "\n\nTam 20x60cm R\u0024180,00 + frete"+
        "\nTam 30x90cm R\u0024220,00 + frete"+
        "\nTam 40x120cm R\u0024250,00 + frete"+

        "\n\nNa moldura preta com Borda de 3x3cm"+
        "\nTam 20x60cm R\u0024260,00 + frete"+
        "\nTam 30x90cm R\u0024400,00 + frete"+
        "\nTam 40x120cm R\u0024550,00 + frete"+
        "\n\n "+
        "\nArquivo Digital - Alta Definição - R\u0024100,00 + frete";
    //
    String c15 ="\n\n PREÇOS:"+
        "\n\nSomente a Foto:"+
        "\nTam 20x60cm R\u0024190,00 + frete"+
        "\nTam 30x90cm R\u0024230,00 + frete"+
        "\nTam 40x120cm R\u0024260,00 + frete"+

        "\n\nNa moldura preta com Borda de 3x3cm"+
        "\nTam 20x60cm R\u0024260,00 + frete"+
        "\nTam 30x90cm R\u0024400,00 + frete"+
        "\nTam 40x120cm R\u0024550,00 + frete"+
        "\n\n "+
        "\nArquivo Digital - Alta Definição - R\u0024120,00 + frete";
    //
    String c16 ="\n\n PREÇOS:"+
        "\nSomente a Foto:"+
        "\n\nTam 20x60cm R\u0024200,00 + frete"+
        "\nTam 30x90cm R\u0024240,00 + frete"+
        "\nTam 40x120cm R\u0024270,00 + frete"+

        "\n\nNa moldura preta com Borda de 3x3cm"+
        "\nTam 20x60cm R\u0024270,00 + frete"+
        "\nTam 30x90cm R\u0024420,00 + frete"+
        "\nTam 40x120cm R\u0024570,00 + frete"+
        "\n\n "+
        "\nArquivo Digital - Alta Definição - R\u0024150,00 + frete";
    //
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar:
        ConvexAppBar(key: _appBarKey3,
            items: [
              TabItem(icon: Image.asset('assets/images/logo2.png'), ),
              TabItem(icon: Image.asset('assets/images/foto.png'), title: 'Comprar foto em\nPapel Fotográfico'),
              TabItem(icon: Image.asset('assets/images/foto.png'), title: 'Comprar foto em \nArquivo Digital'),
              TabItem(icon: Image.asset('assets/images/menu.png'), title: 'Menu Anterior'),
            ],
            initialActiveIndex: 0,//optional, default as 0
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
                {
                  if (widget.numberPictures == 1) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/mapa-lunar-1-lua-papel-fotografico-");

                  } else
                  if (widget.numberPictures == 2) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/3b4hksotm-mapa-lunar-1-lua-papel-fotografico-2020-06-30-12-45-06");
                  } else
                  if (widget.numberPictures == 3) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/mapa-lunar-3-luas-papel-fotografico");
                  } else
                  if (widget.numberPictures == 4) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/mapa-lunar-4-luas-papel-fotografico");
                  } else
                  if (widget.numberPictures == 5) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/mapa-lunar-5-luas-papel-fotografico");
                  } else
                  if (widget.numberPictures == 6) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/mapa-lunar-6-luas-papel-fotografico");
                  } else {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/");
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDesktop()));
                }

              } else
              if (i == 2) {

                  if (widget.numberPictures == 1) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/mapa-lunar-individual-aquivo-digital");
                  } else
                  if (widget.numberPictures == 2) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/o9c29y2rk-mapa-lunar-individual-aquivo-digital");
                  } else
                  if (widget.numberPictures == 3) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/hdlgje02v-mapa-lunar-2-luas-aquivo-digital");
                  } else
                  if (widget.numberPictures == 4) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/qq0zhlhdl-mapa-lunar-3-luas-aquivo-digital");
                  } else
                  if (widget.numberPictures == 5) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/abri5rvt3-mapa-lunar-4-luas-aquivo-digital");
                  } else
                  if (widget.numberPictures == 6) {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/eoor9wmiu-mapa-lunar-5-luas-aquivo-digital");
                  } else {
                    _launchInBrowser("https://loja.nomundodasluas.com.br/");
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDesktop()));
                } else
                  if(i == 3) {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SimuleDesktop(widget.nome,widget.email)));
                   }
        }
        ),
        body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
            Container(
              width: widthlua * 0.97,
              height: heightlua * 0.90,
        child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView( // horizontal scroll widget
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView( // vertical scroll widget
        scrollDirection: Axis.vertical,
        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            width: w90p,
                            child: Text(c1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: font_adj* 1.1),
                            )
                        ),
                        SizedBox(
                            width: w90p,
                            child: Text(
                              widget.numberPictures == 1 ?   c11 :
                              widget.numberPictures == 2 ?   c12 :
                              widget.numberPictures == 3 ?   c13 :
                              widget.numberPictures == 4 ?   c14 :
                              widget.numberPictures == 5 ?   c15 :
                              widget.numberPictures == 6 ?   c16 : c16,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: font_adj* 1.1),
                            )
                        ),
                      ]))))),
            Container(
              width: widthlua * 0.03,
              height: heightlua * 0.90,
              color: Colors.grey[800],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("\u02C4",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: font_adj* 1.1),),
                  Text("\u02C5",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: font_adj* 1.1),),
                ],
              ),
            )
            ]),
      ])
);
}
}
