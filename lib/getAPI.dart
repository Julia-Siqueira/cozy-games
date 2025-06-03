import 'dart:convert';
import 'package:cozy_games/detalhes.dart';
import 'package:cozy_games/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_games/favorites.dart';
import 'package:http/http.dart' as http;

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  String? conselhos;

  @override
  void initState(){
    super.initState();
    getConselhos();
  }

  void getConselhos() async {
    final response = await http.get(Uri.parse("https://api.adviceslip.com/advice"));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        conselhos = data['slip']['advice'];
      });
    } else{
      setState(() {
        conselhos = "Não foi possível buscar um conselho";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minha página de get'),),
      body: Center(
        child: conselhos == null ? CircularProgressIndicator() : Text(conselhos!),
      ),
    );
  }
}
