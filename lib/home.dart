import 'package:cozy_games/conselhos.dart';
import 'package:cozy_games/detalhes.dart';
import 'package:cozy_games/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cozy_games/favorites.dart';
import 'package:cozy_games/map.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

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

  void handleFavorite(Map<String, dynamic> game) {
    setState(() {
      final isFavorited = favoriteGames.any((fav) => fav['id'] == game['id']);

      if (isFavorited) {
        favoriteGames.removeWhere((fav) => fav['id'] == game['id']);
      } else {
        favoriteGames.add(game);
      }
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
      body: _currentIndex == 0
          ? buildHomePage()
          : _currentIndex == 1
          ? FavoritesPage(favoriteGames: favoriteGames)
          : _currentIndex == 2
          ? Mapa()
          : Conselhos(), // <-- Sua nova página
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFbe9f86),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.brown[100],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_rounded),
            label: 'Nossas Lojas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Um conselho?',
          ),
        ],
      ),
    );
  }

  @override
  Widget buildHomePage() {
      return Center(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16),
          itemCount: gameList.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Center(
                child: Image.asset('assets/images/title.png', height: 300),
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
                                onTap: (){
                                  handleFavorite(game);
                                },
                                child: Image.asset(
                                  favoriteGames.any((fav) => fav['id'] == game['id'])
                                      ? 'assets/images/favorite.png'
                                      : 'assets/images/star.png',
                                  width: 30,
                                ),
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
      );
  }
}
