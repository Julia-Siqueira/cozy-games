import 'package:cozy_games/favorites.dart';
import 'package:cozy_games/home.dart';
import 'package:flutter/material.dart';
import 'package:cozy_games/getAPI.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 24,
            color: Colors.white
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 25),
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            minimumSize: Size(375, 65)
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: TelaGet(),

    );
  }
}