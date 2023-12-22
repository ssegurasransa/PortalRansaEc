import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/widgets/custom_buttomMenu.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_seg.dart';
import 'package:portaltransportistas/locator.dart';
import 'package:portaltransportistas/services/navigation_service.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';

class Seg_home extends StatefulWidget {
  const Seg_home({super.key});

  @override
  State<Seg_home> createState() => _Seg_homeState();
}

class _Seg_homeState extends State<Seg_home> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Seg_menu(),
          Container(
            width: ancho * 0.8,
            child: SingleChildScrollView(
              child: Column(children: [
                ImagenRansaTop(ancho: ancho),
                SeparadorTitulo(titulo: "Menu"),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtonMenu(
                      icon: Icons.person,
                      onPressed: () {
                        locator<NavigationService>()
                            .navigateTo('/gh_AgregarCol');
                      },
                      buttonText: 'Solicitudes',
                    ),
                  ],
                ),
                Container(
                  height: alto * 0.25,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
