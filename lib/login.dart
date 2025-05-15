import 'package:cozy_games/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController _username = TextEditingController();
TextEditingController _password = TextEditingController();

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  String username = 'Julia';
  String password = 'DS11';

  bool Login(){
    if(_username.text == username && _password.text == password){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),
      );
      return true;
    }
    else{
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Usuário ou senha incorretos!'),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Fechar'))
            ],
          );
        }
      );
      return false;
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFd7cec8),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50), child:  Image.asset("assets/images/title.png", width: 350)),
            Padding(padding: EdgeInsets.all(20), child:
              Column(
                children: [
                  TextField(

                    decoration: InputDecoration(
                        hintText: 'Username',
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
                    controller: _username,
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
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: (){
                          Login();
                      } ,
                      child: Text('Login')
                  ),
                  SizedBox(height: 150),
                  Text('Developed by Julia Siqueira', style: TextStyle(color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold),)

                ],
              ),)



            ]

        ),
      )
    );
  }
}