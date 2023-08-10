import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supreme_care/providers/addToCart_list.dart';
import 'package:supreme_care/providers/product_list.dart';
import 'package:supreme_care/screens/body_screen.dart';
import 'package:supreme_care/screens/cart.screen.dart';
import 'package:supreme_care/screens/face_screen.dart';
import 'package:supreme_care/screens/hair_screen.dart';
import 'package:supreme_care/screens/item_screen.dart';
import 'package:supreme_care/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register_screen.dart';
import 'reset_password_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName= '/home';
  User currentUser;
  HomeScreen(this.currentUser);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  logOut(){

    AuthService authService = AuthService();
    return authService.logOut().then((value) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logout successfully!'),));
    }).catchError((error) {
      FocusScope.of(context).unfocus();
      String message = error.toString as String;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text(message),));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('supremecare'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('hi' + widget.currentUser.email! + '!'),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){logOut();},
                child: Text('log out')
            )
          ],
        ),
      ),
    );
  }
}
