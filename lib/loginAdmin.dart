import 'package:cozy_games/admin.dart';
import 'package:cozy_games/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_games/admin.dart';
import 'auth.dart';
import 'package:cozy_games/cadastro.dart';

class LoginAdmin extends StatefulWidget{
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdmin>{
  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();

  String login = 'admin';
  String password = 'adminpass';


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFb4967f),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image.asset('assets/images/cozy_logo.png', height: 45),
          ),
        ],
      ),
      backgroundColor: Color(0xFFd7cec8),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 0), child:  Image.asset("assets/images/title.png", width: 300)),
                Padding(padding: EdgeInsets.all(20), child:
                Column(
                  children: [
                    TextField(

                      decoration: InputDecoration(
                        hintText: 'User',
                        filled: true,
                        fillColor: Color(0xFFb69889),
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.brown,
                                width: 3
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.brown,
                                width: 3
                            )
                        ),

                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.brown,
                                width: 3
                            )
                        ),

                      ),
                      controller: _login,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Color(0xFFb69889),
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.brown,
                                width: 3
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.brown,
                                width: 3
                            )
                        ),

                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.brown,
                                width: 3
                            )
                        ),
                      ),
                      controller: _password,
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () async{

                          if(_login.text.trim() == login && _password.text.trim() == password){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()));
                          }

                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Usuário ou senha incorretos'))
                            );
                          }
                        } ,
                        child: Text('Login')
                    ),
                    SizedBox(height: 50),
                    Text('Developed by Julia Siqueira', style: TextStyle(color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold))


                  ],
                ),)



              ]
          ),


        ),
      ),

    );
  }
}