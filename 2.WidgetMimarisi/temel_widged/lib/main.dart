//cupertion => for ios
//material => for android
import 'package:flutter/material.dart';

void main(){
  String mesaj = "Merhaba Ilk Uygulamam !";
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Center(
        child: Text("Govde Kisim"),
      ),
    ),
  ));
}