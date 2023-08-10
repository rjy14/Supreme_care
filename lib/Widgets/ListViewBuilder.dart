import 'package:flutter/material.dart';
import 'package:supreme_care/models/products.dart';
class ListViewBuilder extends StatefulWidget {

  List<Products> productList;
  Function removeItem;

  ListViewBuilder(this.productList, this.removeItem);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder:(ctx,i){
        return ListTile(
          title: Text(widget.productList[i].name),
          subtitle: Text(widget.productList[i].price.toString()),
          onTap: (){
            //print(productList[i].name);
          },
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => widget.removeItem(i),
          ),
        );
      },
      itemCount: widget.productList.length,
    );
  }
}

