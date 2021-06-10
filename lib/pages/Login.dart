import 'package:diario_das_luas/model/Usuario.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart' as fb;

import 'Comprar.dart';



class Login extends StatefulWidget {
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

  Login(
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
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
              builder: (context) => Comprar(
                usuario.nome,
                usuario.email,
                widget.numberPictures,
                widget.nomefamilia,
                widget.dataPicket1,
                widget.dataPicket2,
                widget.dataPicket3,
                widget.dataPicket4,
                widget.dataPicket5,
                widget.dataPicket6,
                widget.nome1,
                widget.nome2,
                widget.nome3,
                widget.nome4,
                widget.nome5,
                widget.nome6,
                widget.distancia1,
                widget.distancia2,
                widget.distancia3,
                widget.distancia4,
                widget.distancia5,
                widget.distancia6,
                widget.luadiadb1,
                widget.luadiadb2,
                widget.luadiadb3,
                widget.luadiadb4,
                widget.luadiadb5,
                widget.luadiadb6,
                widget.proximodb1,
                widget.proximodb2,
                widget.proximodb3,
                widget.proximodb4,
                widget.proximodb5,
                widget.proximodb6,
                widget.signosdb1,
                widget.signosdb2,
                widget.signosdb3,
                widget.signosdb4,
                widget.signosdb5,
                widget.signosdb6,
                widget.timedb1,
                widget.timedb2,
                widget.timedb3,
                widget.timedb4,
                widget.timedb5,
                widget.timedb6,
              ))

      );

    }).catchError((error){
      print("passei 1");
               Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Comprar(
                    usuario.nome,
                    usuario.email,
                    widget.numberPictures,
                    widget.nomefamilia,
                    widget.dataPicket1,
                    widget.dataPicket2,
                    widget.dataPicket3,
                    widget.dataPicket4,
                    widget.dataPicket5,
                    widget.dataPicket6,
                    widget.nome1,
                    widget.nome2,
                    widget.nome3,
                    widget.nome4,
                    widget.nome5,
                    widget.nome6,
                    widget.distancia1,
                    widget.distancia2,
                    widget.distancia3,
                    widget.distancia4,
                    widget.distancia5,
                    widget.distancia6,
                    widget.luadiadb1,
                    widget.luadiadb2,
                    widget.luadiadb3,
                    widget.luadiadb4,
                    widget.luadiadb5,
                    widget.luadiadb6,
                    widget.proximodb1,
                    widget.proximodb2,
                    widget.proximodb3,
                    widget.proximodb4,
                    widget.proximodb5,
                    widget.proximodb6,
                    widget.signosdb1,
                    widget.signosdb2,
                    widget.signosdb3,
                    widget.signosdb4,
                    widget.signosdb5,
                    widget.signosdb6,
                    widget.timedb1,
                    widget.timedb2,
                    widget.timedb3,
                    widget.timedb4,
                    widget.timedb5,
                    widget.timedb6,
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
