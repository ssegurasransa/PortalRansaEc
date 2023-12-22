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

class Seg_menu extends StatelessWidget {
  const Seg_menu({super.key});

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
                locator<NavigationService>().navigateTo('/seg_home');
              }),
          MenuItem(
              text: 'Solicitudes EPP',
              icon: Icons.person,
              onPressed: () {
                locator<NavigationService>().navigateTo('/seg_Solicitud');
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
