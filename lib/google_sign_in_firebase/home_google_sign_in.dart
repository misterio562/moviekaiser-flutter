import 'package:flutter/material.dart';
import 'package:fluttermovie/google_sign_in_firebase/auth_with_google.dart';
import 'package:fluttermovie/google_sign_in_firebase/model/firebase_user.dart';
import 'package:fluttermovie/widgets/background.dart';
import 'package:fluttermovie/pages/page_logged.dart';

class HomeGoogleSingIn extends StatefulWidget {
  const HomeGoogleSingIn({super.key});

  @override
  State<HomeGoogleSingIn> createState() => _HomeGoogleSingInState();
}

class _HomeGoogleSingInState extends State<HomeGoogleSingIn> {
  /// Estas líneas de código crean instancias de las clases `FirebaseUser` y `AuthServiceGoogle`. La
  /// clase `FirebaseUser` es una clase de modelo personalizado que representa a un usuario en Firebase,
  /// mientras que la clase `AuthServiceGoogle` es una clase de servicio personalizado que maneja la
  /// autenticación con Google. La palabra clave `final` se usa para declarar estas variables como
  /// constantes, lo que significa que sus valores no se pueden cambiar una vez que se inicializan.
  /// Luego, estas variables se usan en todo el widget para administrar el estado de autenticación del
  /// usuario y mostrar la interfaz de usuario adecuada.
  final FirebaseUser _user = FirebaseUser();
  final AuthServiceGoogle _auth = AuthServiceGoogle();

  /// La función initState establece la propiedad de usuario del objeto _user en la propiedad de usuario
  /// del objeto _auth.
  @override
  void initState() {
    super.initState();
    _user.user = _auth.user;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: Container(
          decoration: backgroundColorWidget(),
          child: Center(
            child: _auth.user != null ? PageLogged(user: _user) : _pageLogin(),
          )
          ),
    );
  }

  Column _pageLogin() {
    return Column(
      children: [
        Image.asset(
          'assets/logomoviekaiser.png',
          width: 350,
          height: 400,
        ),
        _login()
      ],
    );
  }

  ElevatedButton _login() {
    return ElevatedButton.icon(
      onPressed: () async {
        await _auth.signInGoogle();
        setState(() {
          _user.user = _auth.user;
        });
      },
      icon: const Icon(Icons.login),
      label: const Text('Inicia con Google'),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
    );
  }

//   Scaffold _pageLogged() {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: Colors.yellow.shade600,
//       title: const Text('Holi'),
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 10.0),
//         child: CircleAvatar(
//           backgroundImage: NetworkImage(_user.imageUrl!),
//         ),
//       ),
//     ),
//     body: _logged(),
//   );
// }


  Column _logged() {
    return Column(
      children: [
        Text(_user.name!),
        Text(_user.email!),
        ElevatedButton.icon(
            onPressed: () async {
              await _auth.signOutGoogle();
              setState(() {
                _user.user = _auth.user;
              });
            },
            icon: const Icon(Icons.logout),
            label: const Text('Logout'))
      ],
    );
  }
}
