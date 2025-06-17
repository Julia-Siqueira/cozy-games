import 'package:cozy_games/login.dart';
import 'package:cozy_games/map.dart';
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
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(20),
              child: Image.network(gameData['imagem'], height: 500)),
              SizedBox(height: 10),
              Center(
                child:  Text(
                  '${(gameData['nome'])}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.brown),),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data de lançamento: ${(gameData['data_lancamento'] as Timestamp).toDate().toString().split(' ')[0]}',
                      style: TextStyle(fontSize: 18, color: Color(0xFF674a38), fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,),
                    Text(
                      'Empresa: ${(gameData['empresa'])}',
                      style: TextStyle(fontSize: 18, color: Color(0xFF674a38), fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,),
                    Text(
                      'Tempo de jogo: ${(gameData['duracao'])}h',
                      style: TextStyle(fontSize: 18, color: Color(0xFF674a38), fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,),
                    Text(
                        'Preço: R\$ ${gameData['preco']}',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF674a38))),
                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                backgroundColor: Color(0xFFb4967f),
                                title: Text('Nossas Lojas', style: TextStyle(color: Colors.white),),
                              ),
                              body: Mapa(), // <<< Mapa vira o body
                            ),
                          ),
                        );
                      },
                      child: Text('Comprar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFc07fbb),
                        minimumSize: Size(325, 50),
                      ),
                    ),


                  ],
                ),
              ),

              SizedBox(height: 50,)
              ],


          ),
        )
    );
  }
}