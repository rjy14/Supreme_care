import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supreme_care/providers/product_list.dart';
import 'package:supreme_care/screens/item_screen.dart';

class FaceScreen extends StatelessWidget {
  static String routeName= '/face';

  @override
  Widget build(BuildContext context) {
    ProductList productList = Provider.of<ProductList>(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          centerTitle : true,
          title: Text('Face'),
        ),
        body: ListView(
            children: [
              SizedBox(height: 33), //make an image button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[15].image),
                    iconSize: 110,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[15]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[16].image),
                    iconSize: 110,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[16]),
                  ),
                ],
              ),

              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                  icon: Image.network(productList.getMyProducts()[3].image),
                  iconSize: 110,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[3]),
    ),
    IconButton(
    icon: Image.network(productList.getMyProducts()[2].image),
    iconSize: 110,
    onPressed: () =>
    Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[2]),
           ),
          ],
         ),
        ]
      )
    );
  }
}