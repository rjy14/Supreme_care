
import 'package:flutter/cupertino.dart';
import 'package:supreme_care/Widgets/cart_list.dart';
import 'package:supreme_care/models/products.dart';

class AddToCart with ChangeNotifier{
  List <Products> addToCartList=[

  ];


      List<Products> getProducts(){
    return addToCartList;
      }

      void removeProduct(i){
        addToCartList.removeAt(i);
        notifyListeners();
      }

      void addItemToCart(id,name, price, image){
        addToCartList.insert(0, Products(id:id, name: name, price: price, image:image));
        notifyListeners();
      }

}


  /*void addProduct(name, price, image){
    //cartList.insert(0, Products(name: name, price: price, image: image));
    //notifyListeners();
  }*/

