import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supreme_care/main.dart';
import 'package:supreme_care/screens/home_screen.dart';

class CheckoutScreen extends StatefulWidget {
  static String routeName= '/checkout';
  User currentUser;
  CheckoutScreen(this.currentUser);

  @override
  State<CheckoutScreen> createState() => _CheckoutState();
}

class _CheckoutState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Checkout page'),
      ),
      body : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Thanks for Shopping_'+ widget.currentUser.email! + '!', textAlign: TextAlign.center,),
          SizedBox(height: 20),
          ElevatedButton( onPressed: ()=> Navigator.of(context).pushNamed(MainScreen.routeName),
            child: Text('checkout'),
          )
        ],
      )
    );
  }
}
