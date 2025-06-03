import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController _nome = TextEditingController();
TextEditingController _empresa = TextEditingController();
TextEditingController _imagem = TextEditingController();
TextEditingController _preco = TextEditingController();
TextEditingController _tempo = TextEditingController();
TextEditingController _lancamento = TextEditingController();

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  DateTime? _dataSelecionada;
  
  final firestore = FirebaseFirestore.instance;
  
  void post(){
    firestore.collection('games').add({
      'data_lancamento': _lancamento.text,
      'duracao': _tempo.text,
      'empresa': _empresa.text,
      'imagem': _imagem.text,
      'nome': _nome.text,
      'preco': _preco.text
    });

    _nome.clear();
    _empresa.clear();
    _imagem.clear();
    _preco.clear();
    _tempo.clear();
    _lancamento.clear();

    // (opcional) mostrar confirmação
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Jogo postado com sucesso!')),
    );
  }
  
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
            Image.asset('assets/images/Post.png', height: 150),
            Text('Preencha as informações abaixo', style: TextStyle(fontSize: 20, color: Colors.brown),),
            SizedBox(height: 10,),
            Container(
              width: 370,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.brown),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),

                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                    ),
                    controller: _nome,
                    style: TextStyle(color: Colors.brown),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Empresa',
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.brown),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),

                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                    ),
                    controller: _empresa,
                    style: TextStyle(color: Colors.brown),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Link da imagem',
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.brown),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),

                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                    ),
                    controller: _imagem,
                    style: TextStyle(color: Colors.brown),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Preço',
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.brown
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),

                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                    ),
                    controller: _preco,
                    style: TextStyle(color: Colors.brown),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Tempo de jogo',
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.brown),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),

                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                    ),
                    controller: _tempo,
                    style: TextStyle(color: Colors.brown),
                  ),

                  SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Data de lançamento',
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.brown),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),

                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                          )
                      ),
                    ),
                    controller: _lancamento,
                    style: TextStyle(color: Colors.brown),
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(onPressed: post, child: Text('Postar'))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
