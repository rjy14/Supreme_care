import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supreme_care/models/products.dart';
class ProductList with ChangeNotifier {
  List <Products> productList = [
    Products(id: 'one', name: 'Suavecito', price: 29, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/f2.JPG?alt=media&token=38293749-e9b6-4e72-a08b-77d08f88d288')),
    Products(id: 'one',name: 'uppercut deluxe', price:19, image:('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/pomade%202.JPG?alt=media&token=e27e3a67-9537-4c4f-b576-2cc9279538ad')),
    Products(id: 'one',name: 'layrite', price: 29, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/pomade%203.JPG?alt=media&token=d97229a8-8d0f-46cd-af0e-5198aba692d3')) ,
    Products(id: 'one',name: 'hanz de fuko', price: 19, image:('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/f2.JPG?alt=media&token=38293749-e9b6-4e72-a08b-77d08f88d288')),
    Products(id: 'one',name: 'shear revival', price: 29, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/H9.JPG?alt=media&token=ce0bc0af-3e87-454b-aff5-4df45009a459')),
    Products(id: 'one',name: 'lockhart', price: 19, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/hart.JPG?alt=media&token=35339379-e044-462e-9cbd-b904bdea7c7f')),
    Products(id: 'one',name: 'soap bar', price: 29, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/soap%20bar.JPG?alt=media&token=0ed1daf3-ccc1-44fd-9093-24fd14d82a81')),
    Products(id: 'one',name: 'brickwell', price: 19, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/f1.JPG?alt=media&token=d3f3de5d-9efb-40e1-99cf-eacd2f43f86f')),
    Products(id: 'one',name: 'body soap', price: 29, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/f2.JPG?alt=media&token=38293749-e9b6-4e72-a08b-77d08f88d288')),
    Products(id: 'one',name: 'moon', price: 19, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/f3.JPG?alt=media&token=c1be82e6-012d-44c8-a96e-3b82525e4cd3')),
    Products(id: 'one',name: 'imperial', price: 29, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/face1.JPG?alt=media&token=eae4bc37-ce19-4661-9e47-292c84122963')),
    Products(id: 'one',name: 'rock and roll', price: 19, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/rock.JPG?alt=media&token=bad2722c-af0f-430b-be33-f8d9e21cadb0')),
    Products(id: 'one',name: 'A R soap', price: 29, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/ar%20soap.JPG?alt=media&token=12f6bc7f-eecc-4b20-b111-85e139e452db')),
    Products(id: 'one',name: 'brooklyn grooming', price: 19, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/Brooklyn%20groom.JPG?alt=media&token=809f9f4b-6795-4466-9a6e-5b5be6e24168')),
    Products(id: 'one',name: 'bona fide', price: 29, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/fide.JPG?alt=media&token=4db35f5f-7f09-41f1-9241-53af8694b02e')),
    Products(id: 'one',name: 'toner', price: 19, image:('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/fl.JPG?alt=media&token=b9294db1-04dc-47f1-befc-73a5b86218f9')),
    Products(id: 'one',name: 'hydration cream', price: 19, image:('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/ko.JPG?alt=media&token=40c30716-fd7c-4567-b606-8ec5008592da')),
    Products(id: 'one',name: 'scrubber', price: 19, image: ('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/scrubber.JPG?alt=media&token=c0b602dc-60d4-4490-947b-af14cf79625e')),
    Products(id: 'one',name: 'citrus soap', price: 19, image:('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/cs.JPG?alt=media&token=eadc6cd8-0349-42d5-8b03-8825a1a031d4')),
    Products(id: 'one',name: 'charcoal soap', price: 19, image:('https://firebasestorage.googleapis.com/v0/b/supremecare01-97424.appspot.com/o/bdsoap.JPG?alt=media&token=147d87f3-c321-405b-a8a1-faea9b8f35f6'))

  ];
List<Products> getMyProducts(){
  return productList;
}
List<Products> myProducts=[];

void removeItem(i){
  productList.removeAt(i);
  notifyListeners();
  }

void addProduct(id, name, price, image){
  productList.insert(0, Products(id: id, name: name, price: price, image: image));
  notifyListeners();
}
}
