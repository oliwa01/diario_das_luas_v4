import 'package:diario_das_luas/model/Usuario.dart';
import 'package:diario_das_luas/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;

import 'Comprar.dart';
import 'HomeDesktop.dart';



class Cadastrar extends StatefulWidget {
  String nome;
  String email;


  Cadastrar(
      this.nome,
      this.email,

      );

  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();


  //Controladores
  TextEditingController _controllerNome = TextEditingController(text: "");
  TextEditingController _controllerEmail = TextEditingController(text: "");
  TextEditingController _controllerSenha = TextEditingController(text: "");
  String _mensagemErro = "";

  _validarCampos(){
    //Recupera dados dos campos
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if( nome.isNotEmpty ){

      if( email.isNotEmpty && email.contains("@") ){


        setState(() {
          _mensagemErro = "";
        });

        Usuario usuario = Usuario();
        usuario.nome = nome;
        usuario.email = email;
        usuario.senha = "";

        _cadastrarUsuario( usuario );

      }else{
        setState(() {
          _mensagemErro = "Preencha o E-mail utilizando @";
        });
      }

    }else{
      setState(() {
        _mensagemErro = "Preencha o Nome";
      });
    }

  }


  _cadastrarUsuario( Usuario usuario ) async{

    String erro1 = "FirebaseError: There is no user record corresponding to this identifier. The user may have been deleted. (auth/user-not-found)";
    String erro2 = "FirebaseError: The password is invalid or the user does not have a password. (auth/wrong-password)";
    String erro3 = "FirebaseError: Too many unsuccessful login attempts. Please try again later. (auth/too-many-requests)";
    String erro4 = "FirebaseError: The email address is already in use by another account. (auth/email-already-in-use)";
    String _nomeUsuario;
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(
      email: usuario.email,
      password: "1234567",

    ).then((firebaseUser){
      Firestore db = Firestore.instance;

      db.collection("usuarios")
          .document(usuario.email)
          .setData( {"name" : usuario.nome} );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Principal(usuario.nome,usuario.email)));

    }).catchError((error){
      Firestore db = Firestore.instance;
      db.collection("usuarios")
          .document(usuario.email)
          .setData( {"name" : usuario.nome} );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Principal(usuario.nome,usuario.email)));

    });

  }
  void initState() {

  }



  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    double  font_adj = (widthlua > 1600) ? 34:
    (widthlua > 1500)  ?  33 :
    (widthlua > 1400)  ?  32 :
    (widthlua > 1300)  ?  31 :
    (widthlua > 1200)  ?  30 :
    (widthlua > 1100)  ?  31 :
    (widthlua > 1000)  ?  31 :
    (widthlua > 900)  ?   30:
    (widthlua > 800)  ?   29 :
    (widthlua > 700)  ?   26 :
    (widthlua > 600)  ?   23 :
    (widthlua > 500)  ?   22 :
    (widthlua > 400)  ?   20 :
    (widthlua > 300)  ?   18 :
    (widthlua > 200)  ?   17 :  16 ;

    double  w80p = widthlua * 0.80;
    double  w90p = widthlua * 0.90;
    return Scaffold(
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
              child: Icon(
                Icons.arrow_back, size: 30, // add custom icons also
              ))),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/luas.gif"),
            fit: BoxFit.fitHeight,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: heightlua*0.5),
                Container(
                    width: widthlua * w90p,
                    height: heightlua * 0.10,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Informar NOME e EMAIL, para Acesso ao Sistema. ",
                      textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: font_adj),)
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left : widthlua > 1200 ? 300: widthlua > 1000 ? 150: widthlua > 800 ? 100: 0,
                      right: widthlua > 1200 ? 300: widthlua > 1000 ? 150: widthlua > 800 ? 100: 0,
                      bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left : widthlua > 1200 ? 300: widthlua > 1000 ? 150: widthlua > 800 ? 100: 0,
                      right: widthlua > 1200 ? 300: widthlua > 1000 ? 150: widthlua > 800 ? 100: 0,
                      bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left : widthlua > 1200 ? 300: widthlua > 1000 ? 150: widthlua > 800 ? 100: 0,
                      right: widthlua > 1200 ? 300: widthlua > 1000 ? 150: widthlua > 800 ? 100: 0,
                      top: 16,
                      bottom: 10),
                  child: RaisedButton(
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.deepOrange,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      onPressed: () {
                        _validarCampos();
                      }
                  ),
                ),
                Center(
                  child: Text(
                    _mensagemErro,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
