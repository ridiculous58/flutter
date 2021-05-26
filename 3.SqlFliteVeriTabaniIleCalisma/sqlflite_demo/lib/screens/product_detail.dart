import 'package:flutter/material.dart';
import 'package:sqlflite_demo/data/dbHelper.dart';
import 'package:sqlflite_demo/models/product.dart';

class ProductDetail extends StatefulWidget{
  Product product;
  ProductDetail(this.product);

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailState(product);
  }

}
enum Options{
  delete,
  update
}
class _ProductDetailState  extends State{
  Product product;
  _ProductDetailState(this.product);
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();

  @override
  void initState() {
    txtName.text = product.name;
    txtDescription.text = product.description;
    txtUnitPrice.text = product.unitPrice.toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Detayı : ${product.name}"),
        actions:<Widget> [
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context)=><PopupMenuEntry<Options>>[
              PopupMenuItem<Options>(
                value: Options.delete,
                child: Text("Sil"),
              ),
              PopupMenuItem<Options>(
                value: Options.update,
                child: Text("Güncelle"),
              ),
            ],
          )
        ],
      ),
      body: buildProductDetail(),
    );
  }

  buildProductDetail() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          buildNameField(),buildDescriptionField(),buildUnitPriceField()
        ],
      ),
    );
  }

  void selectProcess(Options value) async{
    switch(value){
      case Options.delete:
        await dbHelper.delete(product.id);
        Navigator.pop(context,true);
        break;
      case Options.update:
        await dbHelper.update(Product.withId(id:product.id,name: txtName.text,description: txtDescription.text,unitPrice: double.tryParse(txtUnitPrice.text)));
        Navigator.pop(context,true);
        break;
      default:
    }
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

}

