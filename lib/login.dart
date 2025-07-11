import 'package:cozy_games/admin.dart';
import 'package:cozy_games/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_games/admin.dart';
import 'auth.dart';
import 'package:cozy_games/cadastro.dart';
import 'package:cozy_games/loginAdmin.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFd7cec8),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50), child:  Image.asset("assets/images/title.png", width: 300)),
                Padding(padding: EdgeInsets.all(20), child:
                Column(
                  children: [
                    TextField(

                      decoration: InputDecoration(
                        hintText: 'E-mail',
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
                      controller: _email,
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
                          final message = await AuthService().login(email: _email.text, password: _password.text);

                          if(message!.contains('Success')){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message))
                          );
                        } ,
                        child: Text('Login')
                    ),
                    SizedBox(height: 30,),
                    Text('Ainda não é cadastrado?', style: TextStyle(color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFc07fbb),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        minimumSize: Size(200, 50),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Remove o espaço extra
                        textStyle: const TextStyle(fontSize: 12), // Tamanho da fonte
                      ),
                      child: const Text('Faça seu cadastro', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    SizedBox(height: 25,),
                    Text('É administrador?', style: TextStyle(color: Colors.brown, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAdmin()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFc07fbb),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        minimumSize: Size(200, 50),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Remove o espaço extra
                        textStyle: const TextStyle(fontSize: 12), // Tamanho da fonte
                      ),
                      child: const Text('Faça seu login', style: TextStyle(color: Colors.white, fontSize: 18)),
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