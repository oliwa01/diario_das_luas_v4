import 'package:diario_das_luas/model/Usuario.dart';
import 'package:diario_das_luas/pages/GeraFotos.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;

import 'Comprar.dart';



class LoginFotos extends StatefulWidget {
  String nome;
  String email;

  LoginFotos(
      this.nome,
      this.email,
      );

  @override
  _LoginFotosState createState() => _LoginFotosState();
}

class _LoginFotosState extends State<LoginFotos> {

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
              builder: (context) => GeraFotos(
                usuario.nome,
                usuario.email,
              ))

      );

    }).catchError((error){

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => GeraFotos(
                usuario.nome,
                usuario.email,

              )));
    });

  }
  void initState() {

  }



  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;

    return Scaffold(
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
                SizedBox(height: heightlua*0.6),
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
