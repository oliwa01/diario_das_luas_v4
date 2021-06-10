import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class geraemail extends StatefulWidget {
  @override
  _geraemailState createState() => _geraemailState();
}

class _geraemailState extends State<geraemail> {

  @override
  void initState() {
    // TODO: implement initState
    getPosts();
  }

  @override

  Future getPosts() async {

    Firestore db = Firestore.instance;
     await db.collection("usuarios")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
          snapshot.documents.forEach((f) => geradadod(f.documentID,f.data.toString()));});

    }


  geradadod(String nome, String nome1)  async{
    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection("usuarios")
        .document(nome)
        .collection("fotos")
        .getDocuments();
    for( DocumentSnapshot item in querySnapshot.documents ) {
      var dados2 = item.data;
      print("email : ${nome}  #  ${nome1} #  ${dados2["numberPicture"].toString()} #  ${dados2["codVenda"].toString()} #  ${dados2["email"].toString()} ");
    }
  }


  Widget build(BuildContext context) {
    return Container(
              child: Text("aaaaa"),
    );
  }
}
