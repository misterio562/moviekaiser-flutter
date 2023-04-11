import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServiceGoogle {
  /// Estas líneas de código crean instancias de las clases `FirebaseAuth` y `GoogleSignIn`
  /// respectivamente. La instancia `FirebaseAuth` se usa para autenticar a los usuarios con Firebase
  /// Authentication, mientras que la instancia `GoogleSignIn` se usa para iniciar sesión en los
  /// usuarios con sus cuentas de Google. La palabra clave `final` se usa para asegurarse de que estas
  /// instancias no se puedan reasignar a un valor diferente una vez que se hayan inicializado.
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Este código define un método getter llamado `user` que devuelve el usuario actual autenticado con
  /// Firebase Authentication. La propiedad `currentUser` de la instancia `_auth` de `FirebaseAuth` se
  /// utiliza para obtener el usuario actual. El tipo de retorno `Usuario?` indica que el método puede
  /// devolver un objeto `Usuario` o `nulo`.
  User? get user {
    return _auth.currentUser;
  }

  /// Esta función inicia la sesión de un usuario mediante la autenticación de Google y devuelve la
  /// información del usuario.
  /// 
  /// Returns:
  ///   un objeto `Futuro<Usuario?>`. Si el proceso de inicio de sesión es exitoso, devuelve un objeto
  /// `Usuario` no nulo. Si hay un error, devuelve nulo.
  Future<User?> signInGoogle() async {
    try {
      final GoogleSignInAccount googleUser = (await _googleSignIn.signIn())!;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user!.uid == _auth.currentUser!.uid) return user;
    } catch (e) {
      print('Error In signInGoogle Method: ${e.toString()}');
    }
    return null;
  }

  /// Esta función cierra la sesión del usuario de su cuenta de Google y de la autenticación de
  /// Firebase.
  Future<void> signOutGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
