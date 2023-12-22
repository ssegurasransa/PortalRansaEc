import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/provider/auth_provider.dart';
import 'package:portaltransportistas/PortalEpp/provider/gh_registerNew.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import '../../locator.dart';
import '../../services/navigation_service.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/text_widget.dart';
import '../widgets/wsixed.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool mostrarMensaje = false;
  bool mostrarMensajeCedula = false;
  bool mostrarMensajeClave = false;
  List cedula = [];
  List clave = [];
  List nivelAcceso = [];
  String token = '1241241241243124';
  String nivelAccesoStr = '';
  late int indice;
  final usuario = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    GlobalKey<FormState> formKeyUsuario = new GlobalKey<FormState>();
    final auth = Provider.of<AuthService>(context, listen: true);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 40, 42, 57),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Container(
                    height: 0,
                    width: 0,
                    child: FutureBuilder(
                      future: obtenerNivelDeAcceso(),
                      builder: (context,
                          AsyncSnapshot<List<SelectNivelDeAcceso>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Muestra un indicador de carga mientras espera el resultado
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          // Muestra un mensaje de error si hay un error
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          List<SelectNivelDeAcceso> datos =
                              snapshot.requireData;
                          datos.forEach((valor) {
                            cedula.add(valor.cedula);
                            clave.add(valor.claveAcceso);
                            nivelAcceso.add(valor.nivelAcceso);
                          });

                          return Container();
                        }
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: const Image(
                            image: AssetImage('assets/LogoIcono.png'),
                            height: 30),
                      ),
                      TextWidget(
                        text: '  Ransa',
                        textcolor: Colors.white,
                        textsize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  WSizedBox(wval: 0, hval: 0.2),
                  Row(
                    children: [
                      WSizedBox(wval: 0.05, hval: 0),
                      Form(
                        key: formKeyUsuario,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WSizedBox(wval: 0, hval: 0.02),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextWidget(
                                  text: 'Portal de EPP',
                                  textcolor: Colors.white,
                                  textsize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  height: 10,
                                  width: 10,
                                ),
                              ],
                            ),
                            WSizedBox(wval: 0, hval: 0.03),
                            Row(
                              children: [
                                TextWidget(
                                  text: '¿Olvidó su contraseña?',
                                  textcolor: Colors.grey,
                                  textsize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                            WSizedBox(wval: 0, hval: 0.03),
                            Container(
                                height: altura * 0.07,
                                width: ancho * 0.32,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Colors.transparent ?? Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 50, 54, 69),
                                  ),
                                  width: ancho * 0.32,
                                  height: altura * 0.05,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value != null || value!.isNotEmpty) {
                                        if (cedula.contains(value)) {
                                          return null;
                                        } else {
                                          setState(() {
                                            mostrarMensajeCedula = true;
                                          });
                                          return "null";
                                        }
                                      } else {
                                        setState(() {
                                          mostrarMensaje = true;
                                        });
                                        return "null";
                                      }
                                    },
                                    controller: usuario,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(15),
                                        suffixIcon: Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                        hintText: "Usuario",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                        border: InputBorder.none),
                                    obscureText: false,
                                    style: TextStyle(
                                      color: Colors.grey ?? Colors.white,
                                    ),
                                  ),
                                )),
                            WSizedBox(wval: 0, hval: 0.02),
                            Container(
                                height: altura * 0.07,
                                width: ancho * 0.32,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Colors.transparent ?? Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 50, 54, 69),
                                  ),
                                  width: ancho * 0.32,
                                  height: altura * 0.05,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value != null || value!.isNotEmpty) {
                                        if (value ==
                                            clave[
                                                cedula.indexOf(usuario.text)]) {
                                          indice = cedula.indexOf(usuario.text);
                                          return null;
                                        } else {
                                          setState(() {
                                            mostrarMensajeClave = true;
                                          });
                                          return "null";
                                        }
                                      } else {
                                        setState(() {
                                          mostrarMensaje = true;
                                        });
                                        return "null";
                                      }
                                    },
                                    controller: password,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(15),
                                        suffixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                        ),
                                        hintText: "Contraseña",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                        border: InputBorder.none),
                                    obscureText: true,
                                    style: TextStyle(
                                      color: Colors.grey ?? Colors.white,
                                    ),
                                  ),
                                )),
                            WSizedBox(wval: 0, hval: 0.04),
                            if (mostrarMensaje == true)
                              Text(
                                "Ingrese el Usuario y contraseña",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            if (mostrarMensajeCedula == true)
                              Text(
                                "Usuario no registrado",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            if (mostrarMensajeClave == true)
                              Text(
                                "Clave incorrecta",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            Container(
                              height: 10,
                            ),
                            CustomButton(
                              buttontext: 'Ingresar',
                              width: 0.32,
                              height: 0.05,
                              bordercolor: Color.fromARGB(255, 29, 144, 244),
                              borderradius: 25,
                              fontsize: 12,
                              fontweight: FontWeight.bold,
                              fontcolor: Colors.white,
                              onPressed: () {
                                if (formKeyUsuario.currentState!.validate()) {
                                  auth.setUsuarioValue(usuario.text);
                                  auth.setCedulaValue(usuario.text);
                                  auth.setModuloValue(
                                      cedula.indexOf(usuario.text));

                                  if (nivelAcceso[
                                          cedula.indexOf(usuario.text)] ==
                                      "Administrador") {
                                    auth.setTokenValue(nivelAcceso[indice]);

                                    locator<NavigationService>()
                                        .navigateTo('/ghhome');
                                  } else if (nivelAcceso[
                                          cedula.indexOf(usuario.text)] ==
                                      "Seguridad") {
                                    locator<NavigationService>()
                                        .navigateTo('/seg_home');
                                  } else {
                                    locator<NavigationService>()
                                        .navigateTo('/col_Home');
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(width: ancho * 0.4),
              ClipPath(
                child: Container(
                  width: ancho * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/imagenhome.jpg'),
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
                clipper: CustomClipPath(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    Path path = Path();
    //LineaArriba
    //lineaverticalIzq
    path.lineTo(size.width / 3, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


/* 
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<String> usuariosRegistrados = ['usuario1', 'usuario2', 'usuario3'];

  String mensajeError = '';

  void _validarUsuario() {
    String usuario = _usernameController.text;
    String contrasena = _passwordController.text;

    if (usuariosRegistrados.contains(usuario)) {
      // Usuario registrado, validar la contraseña
      if (contrasena == 'contrasena_secreta') {
        // Contraseña válida, realizar la acción deseada (por ejemplo, navegar a la siguiente pantalla)
        // Aquí puedes agregar tu lógica adicional
        print('Inicio de sesión exitoso');
      } else {
        setState(() {
          mensajeError = 'Contraseña incorrecta';
        });
      }
    } else {
      setState(() {
        mensajeError = 'Usuario no registrado';
      });
    }
  } */