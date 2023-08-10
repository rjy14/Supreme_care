import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supreme_care/providers/product_list.dart';
import 'package:supreme_care/screens/item_screen.dart';

class HairScreen extends StatelessWidget {
  static String routeName= '/hair';

  @override
  Widget build(BuildContext context) {
    ProductList productList = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        centerTitle : true,
        title: Text('Hair'),
    ),
      body: ListView(
        children: [
          SizedBox(height: 33), //make an image button
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            IconButton(
              icon: Image.network(productList.getMyProducts()[2].image),
              iconSize: 110,
              onPressed: () =>
              Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[2]),
              ),
            IconButton( icon: Image.network(productList.getMyProducts()[1].image),
              iconSize: 110,
              onPressed: () =>
                  Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[1]),
            ),
]
    ),
          SizedBox(height: 33),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                IconButton(
                  icon: Image.network(productList.getMyProducts()[4].image),
                  iconSize: 110,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[4]),
          ),
                IconButton(
                  icon: Image.network(productList.getMyProducts()[14].image),
                  iconSize: 110,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[14]),
          ),
    ],
      ),
          SizedBox(height: 33),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              IconButton(
                icon: Image.network(productList.getMyProducts()[7].image),
                iconSize: 110,
                onPressed: () =>
                    Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[7]),
              ),
              IconButton(
                icon: Image.network(productList.getMyProducts()[8].image),
                iconSize: 110,
                onPressed: () =>
                    Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[8]),
              ),
            ],
          ),
          SizedBox(height: 33),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              IconButton(
                icon: Image.network(productList.getMyProducts()[6].image),
                iconSize: 110,
                onPressed: () =>
                    Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[6]),
              ),
              IconButton(
                icon: Image.network(productList.getMyProducts()[11].image),
                iconSize: 110,
                onPressed: () =>
                    Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[11]),
              ),
            ],
          ),
          SizedBox(height: 33),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              IconButton(
                icon: Image.network(productList.getMyProducts()[12].image),
                iconSize: 110,
                onPressed: () =>
                    Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[12]),
              ),
              IconButton(
                icon: Image.network(productList.getMyProducts()[10].image),
                iconSize: 110,
                onPressed: () =>
                    Navigator.of(context).pushNamed(ItemScreen.routeName,arguments: productList.getMyProducts()[10]),
              ),
            ],
          ),



      ]
      )
    );
  }
}
