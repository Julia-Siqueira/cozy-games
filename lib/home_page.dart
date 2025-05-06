import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFd7cec8),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50), child:  Image.asset("assets/images/title.png", width: 350)),
            Padding(padding: EdgeInsets.all(20), child:
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Username',
                        filled: true,
                        fillColor: Color(0xFFb69889),
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.brown,
                                width: 3
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.brown,
                                width: 3
                            )
                        ),

                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.brown,
                                width: 3
                            )
                        ),



                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Color(0xFFb69889),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3
                          )
                      ),

                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: (){print('object');} ,
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(10),
                        textStyle: TextStyle(fontSize: 23),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        minimumSize: Size(375, 60)
                      ),

                  ),

                ],
              ),)



            ]

        ),
      )
    );
  }
}