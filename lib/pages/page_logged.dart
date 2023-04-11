import 'package:flutter/material.dart';
import 'package:fluttermovie/google_sign_in_firebase/auth_with_google.dart';
import 'package:fluttermovie/google_sign_in_firebase/home_google_sign_in.dart';
import 'package:fluttermovie/google_sign_in_firebase/model/firebase_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttermovie/widgets/background.dart';

class PageLogged extends StatefulWidget {
  final FirebaseUser user;

  const PageLogged({required this.user, Key? key}) : super(key: key);

  @override
  State<PageLogged> createState() => _PageLoggedState();
}

class _PageLoggedState extends State<PageLogged> {
  /// Crear una instancia de la clase `FirebaseAuth`, que se usa para administrar la autenticación de
  /// usuarios en Firebase. El método `FirebaseAuth.instance` devuelve la instancia única de la clase
  /// `FirebaseAuth`, que se puede usar para realizar operaciones de autenticación, como iniciar sesión,
  /// cerrar sesión y crear cuentas de usuario. La palabra clave `final` se usa para hacer que la variable
  /// `_auth` sea inmutable, lo que significa que no se puede reasignar a una instancia diferente de
  /// `FirebaseAuth`.
  final AuthServiceGoogle _auth = AuthServiceGoogle();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _signOut() async {
    await _auth.signOutGoogle();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeGoogleSingIn()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.user.imageUrl!),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(Icons.menu, size: 35),
              color: Colors.amber.shade300,
            )
          ],
        ),
        endDrawer: Drawer(
          width: 200,
          child: Container(
            child: ListView(
              children: [
                Container(
                  height: 150,
                  child: Center(
                      child: Image.asset(
                    'assets/logomoviekaiser.png',
                    fit: BoxFit.cover,
                  )),
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.black),
                  title: const Text(
                    'Cerrar Sesión',
                  ),
                  onTap: _signOut,
                )
              ],
            ),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 214, 244, 248),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Bienvenido ${widget.user.name}, ¿Que quieres ver hoy?',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        )
        );
  }
}
