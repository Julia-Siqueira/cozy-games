import 'package:cozy_games/post.dart';
import 'package:cozy_games/delete.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9c7a64),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image.asset('assets/images/cozy_logo.png', height: 45),
          )
        ],
      ),
      backgroundColor: Color(0xFFd7cec8),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/Admin.png', height: 150),
            Text('Escolha uma opção', style: TextStyle(fontSize: 25, color: Colors.brown),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()),);
            }, child: Text('Adicionar jogo')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DeletePage()),);
            }, child: Text('Remover jogo')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child: Text('Editar jogo')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child: Text('Ver jogos'))
          ],
        ),
      ),
    );
  }
}
