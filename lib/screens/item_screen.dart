import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supreme_care/Widgets/cart_list.dart';
import 'package:supreme_care/models/products.dart';
import 'package:supreme_care/providers/addToCart_list.dart';
import 'package:supreme_care/providers/product_list.dart';
import 'package:supreme_care/screens/cart.screen.dart';
import 'package:supreme_care/services/firestore_service.dart';

class ItemScreen extends StatefulWidget {
  static String routeName = '/item';
  @override
  State<ItemScreen> createState() => _ItemScreenState();
}
class _ItemScreenState extends State<ItemScreen> {
  late Products product = ModalRoute.of(context)!.settings.arguments as Products;
  var form = GlobalKey<FormState>();

  String? name;
  double? price;
  String? image;

  void saveForm(){

    FirestoreService fsService = FirestoreService();
    fsService.addItemToCart(product.name, product.price, product.image);
  }
  @override
  Widget build(BuildContext context) {
    //ProductList productList = Provider.of<ProductList>(context);
    //AddToCart addToCartList = Provider.of<AddToCart>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        centerTitle: true,
        title: Text('Products'),
      ),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.network(product.image),
      Text('Name:' + product.name),
      Text("\$"+ product.price.toString()),
      ElevatedButton(
      child: Text('Add to cart'),
    onPressed: () {
        saveForm();
         }
          )
        ]
      )
    );
  }
}
