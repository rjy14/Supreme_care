import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supreme_care/models/products.dart';
import 'package:supreme_care/providers/addToCart_list.dart';
import 'package:supreme_care/providers/product_list.dart';
import 'package:supreme_care/services/firestore_service.dart';

class CartList extends StatefulWidget {
  //List<Products> cartList;

  //CartList(this.cartList);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  FirestoreService fsService = FirestoreService();

  void removeItem(String id) {
    showDialog<Null>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Are you sure you want to delete?'),
            actions: [
              TextButton(onPressed: (){
                setState(() {
                  fsService.removeProduct(id);
                });
                Navigator.of(context).pop();
              }, child: Text('Yes')),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('No')),
            ],
          );
        });
  }
  @override
  Widget build (BuildContext context) {
    //CartList cartList = Provider.of<CartList>(context);
    //AddToCart addToCartList = Provider.of<AddToCart>(context);

    return StreamBuilder<List<Products>>(
      stream: fsService.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else {
          double sum = 0;
          snapshot.data!.forEach((doc){
            sum += doc.price;
          });
          return ListView.separated(
            itemBuilder: (ctx, i) {
              return ListTile(
                title: Text(
                  snapshot.data![i].name ,
                  style: TextStyle(letterSpacing: 2.0),),
                subtitle: Text("\$" + snapshot.data![i].price.toStringAsFixed(2),
                  style: TextStyle(letterSpacing: 2.0),),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    removeItem(snapshot.data![i].id);
                  },
                ),
              );
            },
            itemCount: snapshot.data!.length,
            separatorBuilder: (ctx, i) {
              return Divider(height: 3, color: Colors.blueGrey);
            },

          );

        }
      }
    );
  }
}
//int i, AddToCart addToCartList remove item()
//addToCartList.removeProduct(i); set state
//addToCartList.getMyProducts()[i]