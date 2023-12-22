import 'package:flutter/material.dart';
import 'package:portaltransportistas/locator.dart';
import 'package:portaltransportistas/services/navigation_service.dart';

import '../../routes/router.dart';
import '../pages/gh_actasEntrega.dart';
import '../pages/gh_activo.dart';
import '../pages/gh_registrarEPP.dart';
import '../pages/gh_renovar.dart';
import '../pages/gh_solicitudEPP.dart';
import '../widgets/menu_item.dart';
import '../widgets/text_separator.dart';

class Gh_menu extends StatelessWidget {
  const Gh_menu({super.key});

/*   void navigateTo( String routeName ) {
    NavigationService.navigateTo( routeName );
    SideMenuProvider.closeMenu();
  } */

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;

    //final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: ancho * 0.2,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(height: 10),
          MenuItem(
              text: 'Home',
              icon: Icons.account_box,
              onPressed: () {
                locator<NavigationService>().navigateTo('/ghhome');
              }),
          MenuItem(
              text: 'Agregar colaborar',
              icon: Icons.person,
              onPressed: () {
                locator<NavigationService>().navigateTo('/gh_AgregarCol');
              }),
          MenuItem(
              text: 'Registrar EPP',
              icon: Icons.file_upload,
              onPressed: () {
                locator<NavigationService>().navigateTo('/gh_RegistrarEpp');
              }),
          MenuItem(
              text: 'Renovar equipos',
              icon: Icons.autorenew,
              onPressed: () {
                locator<NavigationService>().navigateTo('/ghRenovar');
              }),
          MenuItem(
              text: 'Equipos activos',
              icon: Icons.dashboard_outlined,
              onPressed: () {
                locator<NavigationService>().navigateTo('/ghActivo');
              }),
          MenuItem(
              text: 'Almacenar en inventario',
              icon: Icons.pageview,
              onPressed: () {
                locator<NavigationService>()
                    .navigateTo('/gh_AlmacenarInventario');
              }),
          MenuItem(
              text: 'Actas de entrega',
              icon: Icons.picture_as_pdf,
              onPressed: () {
                locator<NavigationService>().navigateTo('/ghActasEntrega');
              }),
          MenuItem(
              text: 'Solicitud EPP',
              icon: Icons.priority_high,
              onPressed: () {
                locator<NavigationService>().navigateTo('/ghSolicitudEpp');
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xff009B3A),
        Color(0xff009B3A),
      ]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
