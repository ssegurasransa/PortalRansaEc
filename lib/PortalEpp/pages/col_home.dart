import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/provider/auth_provider.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import 'package:portaltransportistas/PortalEpp/widgets/custom_buttomMenu.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_col.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tablaCol.dart';
import 'package:portaltransportistas/locator.dart';
import 'package:portaltransportistas/services/navigation_service.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';
import 'package:provider/provider.dart';

class ColHome extends StatefulWidget {
  const ColHome({super.key});

  @override
  State<ColHome> createState() => _ColHomeState();
}

Future<List<TablasColFaltaFirmaSel>> dataLista =
    obtenerTablasColFaltaFirmaSel();

class _ColHomeState extends State<ColHome> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    final auth = Provider.of<AuthService>(context, listen: true);

    return Scaffold(
      body: Row(
        children: [
          const Col_menu(),
          SingleChildScrollView(
            child: Column(
              children: [
                Text(auth.cedulaselected),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: ancho * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonMenu(
                        icon: Icons.account_box,
                        onPressed: () {
                          locator<NavigationService>()
                              .navigateTo('/col_EppActivo');
                          // Handle button press action
                        },
                        buttonText: 'Mis EPP',
                      ),
                      CustomButtonMenu(
                        icon: Icons.mode_edit,
                        onPressed: () {
                          locator<NavigationService>().navigateTo('/col_Firma');

                          // Handle button press action
                        },
                        buttonText: 'Firmas pendientes',
                      ),
                      CustomButtonMenu(
                        icon: Icons.new_releases,
                        onPressed: () {
                          locator<NavigationService>()
                              .navigateTo('/col_Solicitud');
                          // Handle button press action
                        },
                        buttonText: 'Solicitar EPP',
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
