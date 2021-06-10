import 'package:diario_das_luas/pages/DetalhesConstelacoes.dart';
import 'package:diario_das_luas/pages/LoginFotos.dart';
import 'package:diario_das_luas/pages/TransitoConstelacao.dart';
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

class Constelacoes extends StatefulWidget {
  String nome;
  String email;
  Constelacoes(this.nome,this.email);

  @override
  _ConstelacoesState createState() => _ConstelacoesState();
}

class _ConstelacoesState extends State<Constelacoes> {
String _descricao =
    "	O signo do Zodíaco sob o qual você nasceu e chamado seu signo do Sol. A maioria das pessoas sabe qual é o seu signo do Sol e provavelmente tem alguma idéia das características abrangidas por esse signo. Quando um astrólogo levanta um mapa natal leva em conta muito mais do que o Sol isoladamente. Por exemplo, ele examina a casa1 em que estão colocados o Sol e a Lua e também examina os dez planetas do nosso sistema solar em termos de casa e de signo. Examina o Ascendente, o Meio-do-Céu, os nodos da Lua e os aspectos (ângulos geométricos) formados por todos esses fatores entre si. Dependendo de sua abordagem ele pode examinar o immum-coeli; o Descendente, os pontos médios, as partes arábicas, as estrelas fixas, as vibrações harmônicas, os vértices e tudo mais em que possa pensar. " +
        "\n\n	Tudo isso o fará mergulhar na personalidade do nativo, mas não na passagem do tempo, configurada nos acontecimentos diários, mensais e anuais de sua vida. Para isso ele precisará examinar as progressões um-dia-por-um-ano (também chamadas direções secundárias), os trânsitos e as fases da Lua. Mas, por favor, não deixe que isso tudo o desanime – não é necessário examinar todos esses efeitos; muitas vezes é possível obter informação suficiente com uma astrologia mais simples. De qualquer forma, pense nisso - se eu consigo, você também consegue dominar o assunto." +
        "\n\n	Logo Abaixo você podera fazer um estudo em profundidade da Lua e de seus efeitos sobre a natureza de todos nós." +
        "\n\n\nFonte: A Influência da Lua na Nossa Vida Diária – Signos Lunares Sasha Fenton\n\n\n\n";


@override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;

    double  boxnomec       = (widthlua * 0.60);
    double  boxnomehc      = (heightlua * 0.06);
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

    double  font_tit = (widthlua > 1600) ? 40 :
    (widthlua > 1500)  ?  39 :
    (widthlua > 1400)  ?  38 :
    (widthlua > 1300)  ?  37 :
    (widthlua > 1200)  ?  36 :
    (widthlua > 1100)  ?  35 :
    (widthlua > 1000)  ?  34 :
    (widthlua > 900)  ?   33:
    (widthlua > 800)  ?   32 :
    (widthlua > 700)  ?   31 :
    (widthlua > 600)  ?   28 :
    (widthlua > 500)  ?   27 :
    (widthlua > 400)  ?   26 :
    (widthlua > 300)  ?   25:
    (widthlua > 200)  ?   22 :  21 ;

    return Scaffold(
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
                              Principal(widget.nome,widget.email)));
                },
                child: Image.asset( "assets/images/iconseta.png",
                  width: 12, height: 12
                  , // add custom icons also
                ))),
        body: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fundodatas.png"),
                    fit: BoxFit.cover)),
            width: widthlua,
            height: heightlua,
            child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
              SizedBox(width: widthlua,child: Text(_descricao, textAlign: TextAlign.justify, style: TextStyle(color: Colors.white, fontSize:font_adj))),
              //aries
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
              child: RaisedButton( child: Image.asset("assets/images/ar.png"),
                color: Colors.deepOrange,
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"ar")));
                },
              )
              ),
              //aries-touro
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/ar-to.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"ar","ta")));
                    },
                  )
              ),
              //touro
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/to.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"ta")));
                    },
                  )
              ),
              //touro-gemeos
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/to-ge.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"ta","ge")));
                    },
                  )
              ),
              //gemeos
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/ge.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"ge")));
                    },
                  )
              ),
              //gemeos
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/ge-ca.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"ge","cn")));
                    },
                  )
              ),
              //cancer
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/ca.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"cn")));
                    },
                  )
              ),
              //cancer-leao
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/ca-le.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"cn","le")));
                    },
                  )
              ),
              //leao
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/le.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"le")));
                    },
                  )
              ),
              //leao-virgem
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/le-vi.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"le","vi")));
                    },
                  )
              ),
              //virgem
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/vi.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"vi")));
                    },
                  )
              ),
              //virgem-libra
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/vi-li.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"vi","li")));
                    },
                  )
              ),
              //libra
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/li.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"li")));
                    },
                  )
              ),
              //libra-escorpiao
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/li-es.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"li","sc")));
                    },
                  )
              ),
              //escorpiao
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/es.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"sc")));
                    },
                  )
              ),
              //escorpiao-sagitario
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/es-sa.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"sc","sa")));
                    },
                  )
              ),
              //saqgitario
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/sa.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"sa")));
                    },
                  )
              ),
              //saqgitario-caricornio
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/sa-ca.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"sa","cp")));
                    },
                  )
              ),
              //capricornio
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/cap.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"cp")));
                    },
                  )
              ),
              //capricornio-aquario
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/cap-aq.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"cp","aq")));
                    },
                  )
              ),
              //aquario
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/aq.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"aq")));
                    },
                  )
              ),
              //aquario-peixes
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/aq-pe.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"aq","pi")));
                    },
                  )
              ),
              //peixes
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/pe.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalhesConstelacao(widget.nome,widget.email,"pi")));
                    },
                  )
              ),
              //peixes-aries
              SizedBox(height: heightlua * 0.03),
              SizedBox(
                  width:boxnomec ,
                  height: boxnomehc,
                  child: RaisedButton( child: Image.asset("assets/images/pe-ar.png"),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransitoContelacoes(widget.nome,widget.email,"pi","ar")));
                    },
                  )
              ),
            ]
            )
            )
            )
        );
}}
