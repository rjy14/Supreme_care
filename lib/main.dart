
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supreme_care/providers/addToCart_list.dart';
import 'package:supreme_care/providers/product_list.dart';
import 'package:supreme_care/screens/auth_screen.dart';
import 'package:supreme_care/screens/checkout_screen.dart';
//import 'package:supreme_care/main.dart';
//import 'package:supreme_care/Models/products.dart';
import 'package:supreme_care/screens/hair_screen.dart';
import 'package:supreme_care/screens/home_screen.dart';
import 'package:supreme_care/screens/register_screen.dart';
import 'package:supreme_care/screens/reset_password_screen.dart';
import 'package:supreme_care/screens/search_screen.dart';
import 'package:supreme_care/services/auth_service.dart';
import 'package:supreme_care/services/firestore_service.dart';
//import 'Models/products.dart';
import 'screens/cart.screen.dart';
import 'screens/face_screen.dart';
import 'screens/item_screen.dart';
import 'screens/body_screen.dart';
//import 'package:flutter_cart/flutter_cart.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting?
          Center(child: CircularProgressIndicator()):
        StreamBuilder<User?>(
        stream: authService.getAuthUser(),
        builder: (context, snapshot){
          return
     MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductList>(
          create: (ctx) => ProductList(),
        ),
        ChangeNotifierProvider<AddToCart>(
          create: (ctx) => AddToCart(),
        ),
      ],
      child: MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: snapshot.connectionState == ConnectionState.waiting?
              Center(child: CircularProgressIndicator()):
              snapshot.hasData? MainScreen() : AuthScreen(),
              routes: {
                HairScreen.routeName: (_) {return HairScreen();},
                ItemScreen.routeName: (_) {return ItemScreen();},
                FaceScreen.routeName: (_) {return FaceScreen();},
                BodyScreen.routeName: (_) {return BodyScreen();},
                CartScreen.routeName:(_) {return CartScreen();},
                SearchScreen.routeName:(_) {return SearchScreen();},
                HomeScreen.routeName:(_){return HomeScreen(snapshot.data as User);},
                ResetPasswordScreen.routeName:(_){return ResetPasswordScreen();},
                RegisterScreen.routeName:(_){return RegisterScreen();},
                AuthScreen.routeName:(_){return AuthScreen();},
                CheckoutScreen.routeName:(_){return CheckoutScreen(snapshot.data as User);},
                MainScreen.routeName:(_){return MainScreen();},
              }
            ),
          );
        }
      ),
    );
  }
}
class MainScreen extends StatefulWidget {
  static String routeName= '/main';
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {


  void showItem(int i, ProductList productList) {
  }
  @override
  Widget build(BuildContext context) {
    logOut() {
      AuthService authService = AuthService();
      return authService.logOut().then((value) {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Logout successfully!'),));
      }).catchError((error) {
        FocusScope.of(context).unfocus();
        String message = error.toString as String;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
        Text(message),));
      });
    }
    ProductList productList = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        centerTitle: true,
        title: Text('SUPREMECARE'),
        backgroundColor: Colors.red,
      ),
      body:
      Column(
          children: [
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //ElevatedButton(
                //child: Text('Login'),
                //onPressed: () =>
                //Navigator.of(context).pushNamed(RegisterScreen.routeName),
                //style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                //),
                ElevatedButton(onPressed: () => logOut(),
                  child: Text('Log out'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Hair'),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(HairScreen.routeName),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder()),
                ),
                ElevatedButton(
                  child: Text('Body'),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(BodyScreen.routeName),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder()),
                ),
                ElevatedButton(
                  child: Text('Face'),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(FaceScreen.routeName),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder()),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(SearchScreen.routeName),
                  icon: const Icon(Icons.search),
                  iconSize: 30,
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_basket),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(CartScreen.routeName),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('MOST POPULAR!', style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold, fontFamily: "Quicksand")),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[0].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[0]),
                  ),
                  //IconButton(
                  //icon: Image.network(productList.getMyProducts()[0].image),
                  //iconSize: 100,
                  //onPressed: ()=>
                  //Navigator.of(context).pushNamed(ItemScreen.routeName, arguments: productList.getMyProducts()[0]),
                  //)
                  //),
                  //here
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[1].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[1]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[2].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[2]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[3].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[3]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[4].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[4]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('SALE!', style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold, fontFamily: "Quicksand")),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[5].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[5]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[6].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[6]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[2].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[2]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[3].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[3]),
                  ),
                  IconButton(
                    icon: Image.network(productList.getMyProducts()[4].image),
                    iconSize: 100,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ItemScreen.routeName,
                            arguments: productList.getMyProducts()[4]),
                  ),
                ],
              ),
            )
          ]
      ),

    );
    //SizedBox(height: 20),

  }
}
