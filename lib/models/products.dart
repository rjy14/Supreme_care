
import 'package:flutter/cupertino.dart';

class Products {
  String id;
  String name;
  double price;
  String image;

  Products({ required this.id,  required this.name, required this.price, required this.image});

  Products.fromMap(Map <String, dynamic> snapshot,String id) :
        id = id,
        name = snapshot['name'] ?? '' ,
        price = snapshot['price'] ?? '' ,
        image = snapshot['image'] ?? ''
  ;}

