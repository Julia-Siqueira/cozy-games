import 'package:cozy_games/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Qual a diferença dessa classe pra classe de baixo?
// Por que tem coisas que eu declaro aqui?
class DetailPage extends StatefulWidget{
  final Map<String, dynamic> game; // O QUE É DYNAMIC??
  const DetailPage({super.key, required this.game});
  
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Map<String, dynamic> gameData;
  bool favorite = false;

  void _handleFavorite(){
    setState(() {
      favorite = !favorite;
    });
  }
  
  @override
  void initState(){ // O que é essa função? Ela pode ter outro nome?
    super.initState();
    gameData = widget.game;
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFbe9f86),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image.asset('assets/images/cozy_logo.png', height: 45),
          ),
        ],
      ),
      backgroundColor: Color(0xFFd7cec8),
      body:
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(20),
              child: Image.network(gameData['imagem'], height: 500)),
              SizedBox(height: 10),
              Text('Data de lançamento: ${(gameData['data_lancamento'] as Timestamp).toDate().toString().split(' ')}'),
              Text('Preço: R\$ ${gameData['preco']}'),
              SizedBox(height: 20),

              GestureDetector(
                onTap: _handleFavorite,
                child: Image.asset(
                  favorite ? 'assets/images/favorite.png' : 'assets/images/star.png',
                  width: 30,
                ),
              ),
            ],
          ),
        )
    );
  }
}