// ignore_for_file: unnecessary_new, duplicate_import, prefer_const_constructors, use_key_in_widget_constructors, annotate_overrides, deprecated_member_use

import 'package:bookstore_app/home.dart';
import 'package:flutter/material.dart';
import 'package:bookstore_app/home.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage>{
String username = "santiaerianjani";
String password = "123456";
String alert = "";

final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
TextEditingController usernameInput = new TextEditingController();
TextEditingController passwordInput = new TextEditingController();


void prosesLogin(){
  if(_formKey.currentState.validate()){
    if(usernameInput.text == username && passwordInput.text == password){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder:  (context) => Home()    
      ));
    }
    
    else {
      setState(() {
        alert = "Username atau Password anda salah";
      });
    }
  }
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Login Page"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          50.0
          ),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(alert,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                    ),
                    SizedBox(height: 20,
                    ),
                    TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return "Username harus di isi";
                        }
                        return null;
                      },
                      controller: usernameInput,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(

                      ),
                      labelText: "Username"
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty){
                          return "Password harus di isi";
                        }else if(value.length < 6){
                          return "Password tidak boleh kurang dari 6 digit";
                        }
                        return null;
                        },
                        obscureText: true,
                        controller: passwordInput,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(

                          ),
                          labelText: "Password",
                        ),
                      ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: RaisedButton(
                          color: Colors.pink,
                          onPressed: ()=> prosesLogin(),
                          child: Text("Login"),
                          ),
                        ),
                  ],
              ),             
            ),
          ), 
        ),
    );
  }
}