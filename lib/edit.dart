import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

TextEditingController _id = TextEditingController();
TextEditingController _nome = TextEditingController();
TextEditingController _empresa = TextEditingController();
TextEditingController _imagem = TextEditingController();
TextEditingController _preco = TextEditingController();
TextEditingController _tempo = TextEditingController();
TextEditingController _lancamento = TextEditingController();

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  DateTime? _dataSelecionada;

  final firestore = FirebaseFirestore.instance;

  void update(String documentId){
    DateTime data = DateFormat('dd/MM/yyyy').parse(_lancamento.text);

    Timestamp timestamp = Timestamp.fromDate(data);

    firestore.collection('games').doc(documentId).update({
      'data_lancamento': timestamp,
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
    _id.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Jogo atualizado com sucesso!')),
    );
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
          )
        ],
      ),
      backgroundColor: Color(0xFFd7cec8),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset('assets/images/Put.png', height: 100),
              Text('Preencha as informações abaixo', style: TextStyle(fontSize: 20, color: Colors.brown),),
              SizedBox(height: 10,),
              Container(
                width: 370,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Documento',
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
                      controller: _id,
                      style: TextStyle(color: Colors.brown),
                    ),

                    SizedBox(height: 20),

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

                    ElevatedButton(onPressed: () => update(_id.text), child: Text('Postar')),
                    SizedBox(height: 40,),
                  ],
                ),
              )

            ],
          ),

        ),
      ),
    );
  }
}
