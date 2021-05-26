import 'package:bloc_demo/models/product.dart';

class ProductService{

  static List<Product> products = new List<Product>();

  static ProductService _singleton = ProductService._internal();

  factory ProductService(){
    return _singleton;
  }

  ProductService._internal();

  static List<Product> getAll(){
    products.add(Product(1,"Acer Laptop",6000));
    products.add(Product(1,"Acer Laptop",6000));
    products.add(Product(1,"Acer Laptop",6000));
    return products;
  }


}