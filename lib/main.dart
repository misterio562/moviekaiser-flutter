import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovie/google_sign_in_firebase/home_google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieKaiser',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: HomeGoogleSingIn(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moviekaiser'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Google Sing In'),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const HomeGoogleSingIn()
                  ));
            },
          )
        ],
      ),
    );
  }
}