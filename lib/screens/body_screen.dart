import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supreme_care/providers/product_list.dart';
import 'package:supreme_care/screens/item_screen.dart';

class BodyScreen extends StatelessWidget {
  static String routeName= '/body';

  @override
  Widget build(BuildContext context) {
    ProductList productList = Provider.of<ProductList>(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          centerTitle : true,
          title: Text('Body'),
        ),
        body: ListView(
            children: [
              SizedBox(height: 33), //make an image button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[6].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[6]),
                  ),

                  IconButton(
                    icon: Image.network(productList.getMyProducts()[8].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[8]),
                  ),
                ],
              ),

              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[12].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[12]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[17].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[17]),

                  )
                ],
              ),
              SizedBox(height: 33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[18].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[18]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[19].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[19]),
                  ),
                ],
              ),
            ]
        )
    );
  }
}