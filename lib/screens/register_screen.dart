import 'package:flutter/material.dart';
import 'package:supreme_care/Widgets/register_form.dart';
import 'package:supreme_care/screens/reset_password_screen.dart';
import 'package:supreme_care/Widgets/login_form.dart';



class RegisterScreen extends StatefulWidget {
  static String routeName= '/register';


  @override
  State<RegisterScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<RegisterScreen> {

  bool loginScreen= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Supremecare'),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              loginScreen ? LoginForm() : RegisterForm(),
              SizedBox(height: 5),
              loginScreen ? TextButton(onPressed: () {
                setState(() {
                  loginScreen = false;
                });
              }, child: Text('No account? Sign up here!')) :
              TextButton(onPressed: () {
                setState(() {
                  loginScreen = true;
                });
              }, child: Text('Exisiting user? Login in here!')),
              loginScreen ? TextButton(onPressed: () {
                Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
              }, child: Text('Forgotten Password')) : Center()
            ],
          )
      ),
    );
  }
}
