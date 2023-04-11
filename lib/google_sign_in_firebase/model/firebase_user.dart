import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser{
  /// Estas son variables de instancia de la clase `FirebaseUser` en Dart, cada una de las cuales se
  /// declara como una cadena anulable usando la sintaxis `String?`. Se utilizan para almacenar la ID,
  /// el nombre, el correo electrónico y la URL de la imagen de perfil únicos del usuario,
  /// respectivamente. El `?` indica que las variables pueden ser nulas, lo cual es útil cuando se
  /// trabaja con datos que pueden no estar siempre disponibles o inicializados.
  String? _uid;
  String? _name;
  String? _email;
  String? _imageUrl;

  /// El método `set user(User? user)` es un método setter que toma un objeto `User` como parámetro y
  /// establece los valores de las variables `_uid`, `_name`, `_email` y `_imageUrl` según las
  /// propiedades del objeto `Usuario`. Si el objeto `Usuario` no es nulo, el método establece la
  /// variable correspondiente al valor de la propiedad correspondiente del objeto `Usuario`. Si el
  /// objeto `Usuario` es nulo, el método establece la variable correspondiente en nulo. Este método se
  /// usa para actualizar los valores de las variables de instancia de la clase `FirebaseUser` cuando se
  /// obtiene un nuevo objeto `Usuario` de Firebase Authentication.
  set user(User? user){
    _uid = user != null ? user.uid : null;
    _name = user != null ? user.displayName : null;
    _email = user != null ? user.email : null;
    _imageUrl = user != null ? user.photoURL : null;
  }

  /// Estos son métodos getter en la clase `FirebaseUser` en Dart. Permiten el acceso a las variables de
  /// instancia privada `_uid`, `_name`, `_email` y `_imageUrl` respectivamente, devolviendo sus valores
  /// como cadenas anulables. El `?` indica que el valor devuelto puede ser nulo, lo cual es útil cuando
  /// se trabaja con datos que pueden no estar siempre disponibles o inicializados. Estos métodos getter
  /// se pueden usar para recuperar los valores de las variables de instancia desde fuera de la clase.
  String? get uid => _uid;
  String? get name => _name;
  String? get email => _email;
  String? get imageUrl => _imageUrl;

}