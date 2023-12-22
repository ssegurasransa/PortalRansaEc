import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var usuarioselected;
  setUsuarioValue(value) {
    usuarioselected = value;
    notifyListeners();
  }

  var tokenselected;
  setTokenValue(value) {
    tokenselected = value;
    notifyListeners();
  }

  var cedulaselected;
  setCedulaValue(value) {
    cedulaselected = value;
    notifyListeners();
  }

  var moduloselected;
  setModuloValue(value) {
    moduloselected = value;
    notifyListeners();
  }
}











/* import 'package:flutter/material.dart';




enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }


  login( String email, String password ) {

    final data = {
      'correo': email,
      'password': password
    };

    CafeApi.post('/auth/login', data ).then(
      (json) {
        print(json);
        final authResponse = AuthResponse.fromMap(json);
        this.user = authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token );
        NavigationService.replaceTo(Flurorouter.dashboardRoute);

        CafeApi.configureDio();

        notifyListeners();

      }
      
    ).catchError( (e){
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });

  }

  register( String email, String password, String name ) {
    
    final data = {
      'nombre': name,
      'correo': email,
      'password': password
    };

    CafeApi.post('/usuarios', data ).then(
      (json) {
        print(json);
        final authResponse = AuthResponse.fromMap(json);
        this.user = authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token );
        NavigationService.replaceTo(Flurorouter.dashboardRoute);

        CafeApi.configureDio();
        notifyListeners();

      }
      
    ).catchError( (e){
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });
    
    
    

  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    
    try {
      final resp = await CafeApi.httpGet('/auth');
      final authReponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authReponse.token );
      
      this.user = authReponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;

    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

  }


  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

}
 */