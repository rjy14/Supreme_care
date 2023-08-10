import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:supreme_care/Widgets/ListViewBuilder.dart';
import 'package:supreme_care/Widgets/cart_list.dart';
import 'package:supreme_care/models/products.dart';
import 'package:supreme_care/providers/addToCart_list.dart';
import 'package:supreme_care/screens/checkout_screen.dart';
import 'package:supreme_care/screens/hair_screen.dart';
import 'package:supreme_care/services/firestore_service.dart';

import '../providers/product_list.dart';

class CartScreen extends StatefulWidget {
  static String routeName= '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //var inputText = "";
    @override
    Widget build (BuildContext context) {
      //CartList cartList = Provider.of<CartList>(context);
      //AddToCart addToCartList = Provider.of<AddToCart>(context);
      FirestoreService fsService = FirestoreService();
      return StreamBuilder<List<Products>>(
        stream: fsService.getProducts(),
        builder: (context, snapshot){
          return
            snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator()):

          Scaffold(
              appBar: AppBar(
                toolbarHeight: 110,
                centerTitle: true,
                title: Text('cart'),
                actions: [
                  ElevatedButton(child: Text('Checkout'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)
                      ),
                      onPressed: ()=>
                  Navigator.of(context).pushNamed(CheckoutScreen.routeName)),
                ],

              ),
            body: Container(
                height: 500,
                  width: 400,
                  alignment: Alignment.center,
                  child: snapshot.data!.isNotEmpty? CartList() :
                     Column(
                       children: [
                         SizedBox(height: 30),
                         Text('Cart is empty!'),
                       ],
                     )
              ),
          );
       }
      );
    }
}
// child: snapshot.data!.isNotEmpty? CartList() :
