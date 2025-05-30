import 'package:cozy_games/detalhes.dart';
import 'package:cozy_games/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_games/favorites.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  int _currentIndex = 0;
  bool favorite = false;

  List<Map<String, dynamic>> gameList = [];
  List<Map<String, dynamic>> favoriteGames = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    FirebaseFirestore.instance.collection('games').snapshots().listen((snapshot) {
      List<Map<String, dynamic>> newGameList = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();

      setState(() {
        gameList = newGameList;
      });
    });
  }

  void _handleDelete(String id) {
    FirebaseFirestore.instance.collection('games').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image.asset('assets/images/cozy_logo.png', height: 45),
          ),
        ],
      ),
      backgroundColor: Color(0xFFd7cec8),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16),
          itemCount: gameList.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Center(
                child: Image.asset('assets/images/Delete.png', height: 300),
              );
            }

            final game = gameList[index - 1];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(game: game),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 290,
                    height: 520,
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
                              height: 290,
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
              ),
            );
          },
        ),
      )
    );
  }


  }

