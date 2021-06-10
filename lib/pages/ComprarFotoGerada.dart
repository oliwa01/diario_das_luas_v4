import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diario_das_luas/model/Usuario1.dart';
import 'package:diario_das_luas/model/Usuario2.dart';
import 'package:diario_das_luas/model/Usuario3.dart';
import 'package:diario_das_luas/model/Usuario4.dart';
import 'package:diario_das_luas/model/Usuario5.dart';
import 'package:diario_das_luas/model/Usuario6.dart';
import 'package:diario_das_luas/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'HomeDesktop.dart';
import 'SimuleDesktop.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;


class ComprarFotoGerada extends StatefulWidget {
  String nome;
  String email;
  String codvenda;
  int numberPictures;

  ComprarFotoGerada(
      this.codvenda,
      this.nome,
      this.email,
      this.numberPictures,
         );
  @override
  _ComprarFotoGeradaState createState() => _ComprarFotoGeradaState();
}

class _ComprarFotoGeradaState extends State<ComprarFotoGerada> {
  String _launched = " ";

  String _dataTimeDb;
  String _codVenda;
  String _nomeUsuario;


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



  @override
  Widget build(BuildContext context) {

    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    double  w80p = widthlua * 0.80;
    double  w90p = widthlua * 0.90;
    double  w100p = widthlua;
  String _codvenda = widget.codvenda.toString();
    double  h10p = heightlua * 0.10;
    double  h60p = heightlua * 0.60;
    double  h30p = heightlua * 0.30;
    bool portrait = (widthlua > heightlua ? false: true);
    return Scaffold(
        body: Container(
          color: Colors.black,
          alignment: Alignment.topCenter,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 00),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            width: w80p,
                            height: h60p,
                            child: Text(
                              "\n\n\nCodigo de venda: $_codvenda .\n\n Informe este codigo no site de vendas , para sua foto ser localizada",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: portrait ? (heightlua  / 20) : (heightlua  / 20)),
                            )
                        ),
                        SizedBox(height: 40),
                        MaterialButton(
                          color: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0))),
                          onPressed: () {
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
                          },
                          child: Text(
                            "Comprar sua foto - Papel Fotográfico",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          color: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0))),
                          onPressed: () {
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
                          },
                          child: Text(
                            "Comprar sua foto - Arquivo Digital.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          color: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0))),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Principal(widget.nome,widget.email)));
                          },
                          child: Text(
                            "Voltar",
                            style: TextStyle(color: Colors.white),
                          ),
                        )

                      ])
              )

          ),
        )
    );
  }
}
