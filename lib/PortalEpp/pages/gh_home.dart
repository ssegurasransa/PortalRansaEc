import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/provider/auth_provider.dart';
import 'package:portaltransportistas/PortalEpp/widgets/custom_buttomMenu.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_gh.dart';
import 'package:portaltransportistas/locator.dart';
import 'package:portaltransportistas/services/navigation_service.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';
import 'package:provider/provider.dart';

class Gh_home extends StatefulWidget {
  const Gh_home({super.key});

  @override
  State<Gh_home> createState() => _Gh_homeState();
}

class _Gh_homeState extends State<Gh_home> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    final auth = Provider.of<AuthService>(context, listen: true);

    return Scaffold(
      body: Row(
        children: [
          Gh_menu(),
          Container(
            width: ancho * 0.8,
            child: SingleChildScrollView(
              child: Column(children: [
                Text(auth.cedulaselected),
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
                      buttonText: 'Agregar',
                    ),
                    CustomButtonMenu(
                      icon: Icons.file_upload,
                      onPressed: () {
                        locator<NavigationService>()
                            .navigateTo('/gh_RegistrarEpp');
                      },
                      buttonText: 'Registrar EPP Colaborador',
                    ),
                    CustomButtonMenu(
                      icon: Icons.autorenew,
                      onPressed: () {
                        locator<NavigationService>().navigateTo('/ghRenovar');
                      },
                      buttonText: 'Renovar equipos',
                    ),
                  ],
                ),
                Container(
                  height: alto * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtonMenu(
                      icon: Icons.dashboard_outlined,
                      onPressed: () {
                        locator<NavigationService>().navigateTo('/ghActivo');
                      },
                      buttonText: 'Equipos activos',
                    ),
                    CustomButtonMenu(
                      icon: Icons.pageview,
                      onPressed: () {
                        locator<NavigationService>().navigateTo('/404');
                      },
                      buttonText: 'Almacenar en inventario',
                    ),
                    CustomButtonMenu(
                      icon: Icons.picture_as_pdf,
                      onPressed: () {
                        locator<NavigationService>()
                            .navigateTo('/gh_AlmacenarInventario');
                      },
                      buttonText: 'Actas de entrega',
                    ),
                  ],
                ),
                Container(
                  height: alto * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtonMenu(
                      icon: Icons.priority_high,
                      onPressed: () {
                        locator<NavigationService>()
                            .navigateTo('/ghSolicitudEpp');
                      },
                      buttonText: 'Solicitud EPP',
                    ),
                    Container(
                      height: alto * 0.25,
                      width: ancho * 0.15,
                    ),
                    Container(
                      height: alto * 0.25,
                      width: ancho * 0.15,
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
