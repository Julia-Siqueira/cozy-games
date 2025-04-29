import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFd7cec8),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50), child:  Image.asset("assets/images/title.png", width: 350)),
            Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.brown)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder()
              ),
            ),


            ]

        ),
      )
    );
  }
}