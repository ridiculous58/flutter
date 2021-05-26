import 'package:flutter/material.dart';
import 'package:sqlflite_demo/data/dbHelper.dart';
import 'package:sqlflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }

}

class ProductAddState extends State {
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),buildDescriptionField(),buildUnitPriceField(),buildSaveButton()
          ],
        ),
      ),
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Description"),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Birim Fiyatı"),
      controller: txtUnitPrice,
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı"),
      controller: txtName,
    );
  }

  buildSaveButton() {
    return FlatButton(onPressed: (){
      addProduct();
    }, child: Text("Ekle"));
  }

  void addProduct() async {
    var result = await dbHelper.insert(Product(name:txtName.text,description : txtDescription.text,unitPrice:double.tryParse(txtUnitPrice.text)));
    Navigator.pop(context,true);
  }

}