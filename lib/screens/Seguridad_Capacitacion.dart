import 'package:flutter/material.dart';

import '../widget/diapostivas_seguridad.dart';

class CapacitacionSeguridad extends StatelessWidget {
  const CapacitacionSeguridad({super.key, required this.cedula, required this.cd});
  final String cedula;
  final String cd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inducción de seguridad Ransa $cedula'),
        actions: [
          IconButton(
            icon: Image.asset('assets/Logo_Ransa_Blanco.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(children: [
        DiapositivasSeguridad(
          cedula: cedula, cd: cd,
        )
      ]),
    );
  }
}
