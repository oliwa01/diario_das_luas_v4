import 'package:diario_das_luas/pages/SimuleDesktop.dart';
import 'package:diario_das_luas/pages/cadastrar.dart';
import 'package:diario_das_luas/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Entrada.dart';


class HomeDesktop extends StatefulWidget {

  HomeDesktop();
  @override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  bool  _botao = true;
  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;

    double  font_adj = (widthlua > 1600) ? 14:
    (widthlua > 1500)  ?  13 :
    (widthlua > 1400)  ?  12 :
    (widthlua > 1300)  ?  11 :
    (widthlua > 1200)  ?  10 :
    (widthlua > 1100)  ?  9 :
    (widthlua > 1000)  ?  9 :
    (widthlua > 900)  ?   9:
    (widthlua > 800)  ?   8 :
    (widthlua > 700)  ?   8 :
    (widthlua > 600)  ?   8 :
    (widthlua > 500)  ?   8 :
    (widthlua > 400)  ?   8 :
    (widthlua > 300)  ?   8 :
    (widthlua > 200)  ?   7 :  6 ;

    double  w80p = widthlua * 0.80;
    double  w90p = widthlua * 0.90;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/luas.gif"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _botao ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: widthlua * 0.4,
                        height: heightlua * 0.08,
                        child: RaisedButton(
                            child: Text(
                              "ENTRAR",
                              style: TextStyle(color: Colors.white, fontSize:font_adj),
                            ),
                            color: Colors.deepOrange,

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            onPressed: () {
                            setState(() {
                              _botao = !_botao;
                            });
                            }
                        )),
                  ],
                )
                    :
              Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: widthlua * 0.4,
                          height: heightlua * 0.08,
                          child: RaisedButton(
                              child: Text(
                                "Já tenho Cadastro",
                                style: TextStyle(color: Colors.white, fontSize:font_adj),
                              ),
                              color: Colors.deepOrange,

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Entrada("user","@ANONIMO")));
                              }
                          )),
                      SizedBox(height : heightlua * 0.02),
                      SizedBox(
                          width: widthlua * 0.4,
                          height: heightlua * 0.08,
                          child: RaisedButton(
                              child: Text(
                                "Cadastro",
                                style: TextStyle(color: Colors.white, fontSize:font_adj * 1.2),
                              ),
                              color: Colors.deepOrange,

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cadastrar("user","@ANONIMO")));
                              }
                          )),
                    ])]),
                SizedBox(
                  width: heightlua * 0.2,
                  height: heightlua * 0.2,
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(height: heightlua * 0.2),

                Container(
                  width: w90p,
                  height: heightlua * 0.23,
                  padding: EdgeInsets.all(10),
                  child: Text(
                  "Criada por uma explosão planetária há cerca de 4 bilhões de anos, a Lua intriga o homem desde o início da humanidade. "+
                      "Esse satélite já foi considerado desde um deus a uma bússola celeste, além de ser o único corpo cósmico que os seres humanos já visitaram. "+
                      "A movimentação gravitacional desse astro influencia em muito a vida em nosso planeta.\n\n" +
                      "Descubra neste App a Lua do dia do seu nascimento,  e as informações do satélite neste dia , além de uma foto em alta definição deste satélite maravilhoso. É possível também montar uma foto com as luas de sua família. \n\nDivirta-se.",
                      textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: font_adj * 1.5),)
                  ),

                Container(
                    width: w90p,
                    height: heightlua * 0.03,
                    child: Text("V4.06",
                      textAlign: TextAlign.end,style: TextStyle(color: Colors.white, fontSize: 15),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
