import 'package:flutter/material.dart';
import 'package:fluttermovie/google_sign_in_firebase/auth_with_google.dart';
import 'package:fluttermovie/google_sign_in_firebase/model/firebase_user.dart';
import 'package:fluttermovie/widgets/background.dart';

class HomeGoogleSingIn extends StatefulWidget {
  const HomeGoogleSingIn({super.key});

  @override
  State<HomeGoogleSingIn> createState() => _HomeGoogleSingInState();
}

class _HomeGoogleSingInState extends State<HomeGoogleSingIn> {
  final FirebaseUser _user = FirebaseUser();
  final AuthServiceGoogle _auth = AuthServiceGoogle();

  @override
  void initState() {
    super.initState();
    _user.user = _auth.user;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: backgroundColorWidget(),
        child: Center(
          child: _user.uid != null ? _pageHome() : _pageLogin(),
        )
      ),
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
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
        ) ,
        );   
  }

  Scaffold _pageHome(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Holi'),
        leading: Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(_user.imageUrl!),
          ),
        ),
      ),
      body: _logged(),
    );
  }

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

  Column _pageLogin() {
    return Column(
      children: [
        const Text('Logo'),
        Image.asset(
          'assets/logomoviekaiser.png',
          width: 350,
          height: 400,
        ),
        _login()
      ],
    );
  }
}
