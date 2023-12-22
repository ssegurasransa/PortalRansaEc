import 'package:flutter/material.dart';
import 'package:portaltransportistas/screens/Seguridad_Capacitacion.dart';

class GraciasPantalla extends StatefulWidget {
  const GraciasPantalla({
    super.key,
    required this.resultado,
    required this.puntuacion,
    required this.cedula, 
    required this.cd,
  });
  final String resultado;
  final String puntuacion;
  final String cedula;
  final String cd;
  @override
  State<GraciasPantalla> createState() => _GraciasPantallaState();
}

class _GraciasPantallaState extends State<GraciasPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Inducción de seguridad Ransa'),
          actions: [
            IconButton(
              icon: Image.asset('assets/Logo_Ransa_Blanco.png'),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.resultado == "Aprobado")
                Container(
                    child: Column(
                  children: [
                    Image.asset(
                      'assets/Logo_Ransa.png',
                      height: 150,
                    ),
                    Text(
                      "Gracias por ayudarnos a ser un RANSA SEGURO",
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 0, 155, 8)),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                        "Su puntuacion fue ${widget.puntuacion}/10 lo que le permite ingresar a las instalacioneas.",
                        style: TextStyle(
                          fontSize: 18,
                        ))
                  ],
                )),
              if (widget.resultado == "denegado")
                Container(
                    child: Column(
                  children: [
                    Image.asset('assets/Logo_Ransa.png'),
                    Text(
                        "La puntuación total es ${widget.puntuacion}/10, haga click en el icono de abajo para volver a intentarlo",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 155, 8))),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_return,
                        size: 50,
                      ),
                      color: Color.fromARGB(255, 0, 155, 8),
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new CapacitacionSeguridad(
                              cedula: widget.cedula, cd: widget.cd,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ))
            ],
          )),
        ));
  }
}


/* GraciasPantalla */