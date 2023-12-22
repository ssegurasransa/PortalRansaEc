/* import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:portaltransportistas/PortalEpp/pages/col_eppActivo.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_firma.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_home.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_AlmacenarInventario.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_MostrarPdf.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_agregarCol.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_crearUsuario.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_home.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoQuito.dart';
import '../PortalEpp/pages/dropdownprovider.dart';
import '../PortalEpp/pages/gh_actasEntrega.dart';
import '../PortalEpp/pages/gh_registrarEPP.dart';
import '../PortalEpp/pages/gh_activo.dart';
import '../PortalEpp/pages/gh_renovar.dart';
import '../PortalEpp/pages/gh_solicitudEPP.dart';
import '../PortalEpp/pages/home_portalEpp.dart';
import '../Screens/portal_estado.dart';
import '../api/provider.dart';
import '../screens/Seguridad_Capacitacion.dart';
import '../screens/Seguridad_ingresoPersonal.dart';
import '../screens/view_404.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return _fadeRoute(MyApp(asegurados: obtenerSegurosTotales()), '/home');
      case '/homePortalEPP':
        return _fadeRoute(SignInScreen(), '/homePortalEPP');

      case '/prueba':
        return _fadeRoute(
            DropdowntextArea(
              titulo: '',
            ),
            '/prueba');

      case '/capacitacion':
        return _fadeRoute(IngresoDataPersonal(), '/capacitacion');
      case '/ghhome':
        return _fadeRoute(Gh_home(), '/ghhome');
      case '/GhRegistrarEpp':
        return _fadeRoute(GhRegistrarEpp(), '/GhRegistrarEpp');
      case '/ghRenovar':
        return _fadeRoute(GhRenovarequipo(), '/ghRenovar');
      case '/ghActivo':
        return _fadeRoute(GhActivoequipo(), '/ghActivo');
      case '/gh_AlmacenarInventario':
        return _fadeRoute(
            GH_AlmacenarInventario(''), '/gh_AlmacenarInventario');

      case '/ghSolicitudEpp':
        return _fadeRoute(GhSolicitudEPPState(), '/ghSolicitudEpp');

      case '/ghActasEntrega':
        return _fadeRoute(GHActasEntrega(), '/ghActasEntrega');

      case '/CapacitacionSeguridad':
        return _fadeRoute(
            CapacitacionSeguridad(
              cedula: '',
              cd: '',
            ),
            '/CapacitacionSeguridad');
      case '/portalEpp':
        return _fadeRoute(SignInScreen(), '/portalEpp');
      case '/gh_CrearUsuario':
        return _fadeRoute(Gh_CrearUsuario(), '/gh_CrearUsuario');
      case '/Gh_AgregarCol':
        return _fadeRoute(Gh_AgregarCol(), '/Gh_AgregarCol');
      case '/gh_RegistrarEpp':
        return _fadeRoute(GhRegistrarEpp(), '/gh_RegistrarEpp');
      case '/gh_MostrarPDF':
        return _fadeRoute(Gh_MostrarPDF(), '/gh_MostrarPDF');
      case '/portalEstadoQuito':
        return _fadeRoute(PortalEstadoQuito(), '/portalEstadoQuito');
      case '/col_Solicitud':
        return _fadeRoute(ColSolicitudes(), '/col_Solicitud');
      case '/col_Home':
        return _fadeRoute(ColHome(), '/col_Home');
      case '/col_Firma':
        return _fadeRoute(ColFirma(), '/col_Firma');

      case '/col_EppActivo':
        return _fadeRoute(ColEppActivo(), '/col_EppActivo');

      default:
        return _fadeRoute(View404(), '/404');
    }
  }
s
  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => child,
        transitionDuration: Duration(milliseconds: 10000),
        transitionsBuilder: (_, animation, __, ___) => (kIsWeb)
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: __,
                child: child,
                linearTransition: true));
  }
}
 */