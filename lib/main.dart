import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovie/google_sign_in_firebase/home_google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HomeGoogleSingIn());
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menú'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Opción 1'),
              onTap: () {
                // acción al hacer clic en la opción 1
              },
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {
                // acción al hacer clic en la opción 2
              },
            ),
          ],
        ),
      ),
    );
  }
}