import 'package:diario_das_luas/pages/HomeDesktop.dart';
import 'package:diario_das_luas/pages/SimuleDesktop.dart';
import 'package:diario_das_luas/pages/constelacoes.dart';
import 'package:diario_das_luas/pages/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';

import 'GeraFotos.dart';
class Principal extends StatefulWidget {
  String nome;
  String email;
  Principal(this.nome,this.email);
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
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

    double  font_adj = (widthlua > 1600) ? 24:
    (widthlua > 1500)  ?  23 :
    (widthlua > 1400)  ?  22 :
    (widthlua > 1300)  ?  21 :
    (widthlua > 1200)  ?  20 :
    (widthlua > 1100)  ?  21 :
    (widthlua > 1000)  ?  21 :
    (widthlua > 900)  ?   20:
    (widthlua > 800)  ?   19 :
    (widthlua > 700)  ?   16 :
    (widthlua > 600)  ?   13 :
    (widthlua > 500)  ?   12 :
    (widthlua > 400)  ?   10 :
    (widthlua > 300)  ?   8 :
    (widthlua > 200)  ?   07 :  06 ;

    double  w90p = widthlua * 0.90;

    double boxnomeh = portrait ?
    (widthlua > 800 ? 60 : widthlua > 700 ? 50 : widthlua > 600 ? 45 : widthlua > 500 ? 45 : widthlua > 400 ? 40 : widthlua > 300 ? 38 : widthlua > 200 ? 30 : 30 )
        :
    (widthlua > 2100 ? widthlua /45 : widthlua > 2000 ? widthlua /44 : widthlua > 1900 ? widthlua /43 : widthlua > 1800 ? widthlua /42 : widthlua > 1700 ? widthlua /41 :
    widthlua > 1600 ? widthlua /40 :  widthlua > 1500 ? widthlua /39 : widthlua > 1400 ? widthlua /38 : widthlua > 1300 ? widthlua /37 : widthlua > 1200 ? widthlua /36 :
    widthlua > 1100 ? widthlua /35 :  widthlua > 1000 ? widthlua /34 : widthlua > 900 ? widthlua /32 :  widthlua > 800 ? widthlua /30 :  widthlua > 700 ? widthlua /28 : widthlua /26 );
    //
    double  w80p = widthlua * 0.80;
    double  w60p = widthlua * 0.60;
    double  w20p = widthlua * 0.20;
    double  h20p = heightlua * 0.15;
    double  h10p = heightlua * 0.07;

    double  h60p = heightlua * 0.60;
    return FocusWatcher(
        child:Scaffold(
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
                                  HomeDesktop()));
                    },
                    child:  Image.asset( "assets/images/iconseta.png",
                      width: 12, height: 12
                      , // add custom icons also
                    ))),
        body: Align(
        alignment: Alignment.topCenter,
        child:
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/fundodatas.png"),
                    fit: BoxFit.cover)),
            width: widthlua,
        height: heightlua,
        child:
        SingleChildScrollView( // horizontal scroll widget
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView( // vertical scroll widget
        scrollDirection: Axis.vertical,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,


          children: [
            SizedBox(
            width: widthlua,
            height: 15,
            child:Text(
              widget.email,textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize:9),
            )),
            Row(
              children: [
                SizedBox(width: w20p,
                  height: h20p,
                  child: Image.asset("assets/images/lua-08.png"),
                ),
                SizedBox(
                  width: w60p,
                  height: h10p,
                  child: Container(
                    width: w60p,
                    height: heightlua * 0.06,
                    child: RaisedButton(
                        child: Text(
                          "Descubra a Lua do dia do seu nascimento.",
                          style: TextStyle(color: Colors.white, fontSize:font_adj ),
                        ),
                        color: Colors.white24,
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SimuleDesktop(widget.nome,widget.email)));
                        }
                    ),
                  ),
                )
              ],
                ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: w20p,
                  height: h20p,
                  child: Image.asset("assets/images/lua-15.png"),
                ),
                SizedBox(
                  width: w60p,
                  height: h10p,
                  child: Container(
                    width: w60p,
                    height: heightlua * 0.06,
                    child: RaisedButton(
                        child: Text(
                          "Informações dos signos da constelação \nda Lua do dia do seu nascimento.", textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize:font_adj ),
                        ),
                        color: Colors.white24,
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Constelacoes(widget.nome,widget.email)));
                        }
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: w20p,
                  height: h20p,
                  child: Image.asset("assets/images/lua-22.png"),
                ),
                SizedBox(
                  width: w60p,
                  height: h10p,
                  child: Container(
                    width: w60p,
                    height: heightlua * 0.06,
                    child: RaisedButton(
                        child: Text(
                          "Galeria de quadros da Lua.",
                          style: TextStyle(color: Colors.white, fontSize:font_adj ),
                        ),
                        color: Colors.white24,
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Slideshow(widget.nome,widget.email)));
                        }
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: w20p,
                  height: h20p,
                  child: Image.asset("assets/images/lua-05.png"),
                ),
                SizedBox(
                  width: w60p,
                  height: h10p,
                  child: Container(
                    width: w60p,
                    height: heightlua * 0.06,
                    child: RaisedButton(
                        child: Text(
                          "Fotos geradas.",
                          style: TextStyle(color: Colors.white, fontSize:font_adj ),
                        ),
                        color: Colors.white24,
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GeraFotos(widget.nome,widget.email)));
                        }
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),

              ],
            ),
        )
        )
    ))));
  }
}
