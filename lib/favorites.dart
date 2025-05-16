import 'package:cozy_games/detalhes.dart';
import 'package:cozy_games/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesPage extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteGames;
  const FavoritesPage({super.key, required this.favoriteGames});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool favorite = false;

  List<Map<String, dynamic>> gameList = [];

  void handleFavorite() {
    setState(() {
      favorite = !favorite;
    });
  }

  void _handleEdit() {
    print("Editou o jogo!");
  }

  void _handleDelete(String id) {
    FirebaseFirestore.instance.collection('games').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd7cec8),
      body: widget.favoriteGames.isEmpty
          ? const Center(
        child: Text('Nenhum jogo favoritado.', style: TextStyle(fontSize: 23, color: Colors.brown),),
      )
          : ListView.builder(
        itemCount: widget.favoriteGames.length + 1,
        itemBuilder: (context, index) {
          if(index == 0){
            return Center(
              child: Image.asset('assets/images/favorites.png'),
            );
          }

          final game = widget.favoriteGames[index - 1];

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 290,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFbe9f86),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          game['imagem'],
                          width: 200,
                          height: 270,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        game['nome'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Data de lançamento: ${(game['data_lancamento'] as Timestamp).toDate().toString().split(' ')[0]}',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        'Preço: R\$ ${game['preco']}',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              handleFavorite();
                            },
                            child: Image.asset(
                              favorite ? 'assets/images/favorite.png' : 'assets/images/star.png',
                              width: 30,
                            ),
                          ),
                          GestureDetector(
                            onTap: _handleEdit,
                            child: Image.asset('assets/images/pencil.png', width: 30),
                          ),
                          GestureDetector(
                            onTap: () {
                              _handleDelete(game['id']);
                            },
                            child: Image.asset('assets/images/trash.png', width: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
