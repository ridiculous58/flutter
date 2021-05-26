import 'dart:async';

import 'package:bloc_demo/data/cart_service.dart';
import 'package:bloc_demo/models/cart.dart';

class CartBloc{
  final cartStreamController = StreamController.broadcast();
  
  Stream get getStream => cartStreamController.stream;
  
  void addToCart(Cart item){
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
    /*
    stream bir yayın ve aralıklı zamanlarla çalışıyor bu
    aralıkları belirlediğimiz yer sink tir cart bir cok yerde oldugu içi stream e diyoruz cart ı içeren her yeri git bi guncelle
    sink streame uyandırır event fırlatır
    */
  }

  void removeFromCart(Cart item){
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart(){
    return CartService.getCart();
  }
}

final cartBloc = CartBloc();