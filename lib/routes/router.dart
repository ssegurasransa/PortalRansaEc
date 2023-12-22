import 'package:fluro/fluro.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_eppActivo.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_firma.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_home.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_AlmacenarInventario.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_MostrarPdf.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_agregarCol.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_crearUsuario.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_home.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_mostrarActaEntrega.dart';
import 'package:portaltransportistas/PortalEpp/pages/seg_home.dart';
import 'package:portaltransportistas/PortalEpp/pages/seg_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/provider/auth_provider.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoBabahoyo.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoMachala.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoManta.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoMilagro.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_estadoQuito.dart';
import '../PortalEpp/pages/dropdownprovider.dart';
import '../PortalEpp/pages/gh_actasEntrega.dart';
import '../PortalEpp/pages/gh_registrarEPP.dart';
import '../PortalEpp/pages/gh_activo.dart';
import '../PortalEpp/pages/gh_renovar.dart';
import '../PortalEpp/pages/gh_solicitudEPP.dart';
import '../PortalEpp/pages/home_portalEpp.dart';
import '../PortalEpp/provider/providerEPP.dart';
import 'package:provider/provider.dart';
import '../screens/portal_estado.dart';
import '../api/provider.dart';
import '../screens/Seguridad_Capacitacion.dart';
import '../screens/Seguridad_ingresoPersonal.dart';
import '../screens/view_404.dart';

//Comentario: Esta funcion esta conectada con el Main, es la que define las rutas y los url dentro de los dos portales
class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define("home",
        handler: _counterHandler, transitionType: TransitionType.fadeIn);
    router.define('/capacitacion',
        handler: _counterHandlerCapacitacion,
        transitionType: TransitionType.fadeIn);
    router.define('/homePortalEPP',
        handler: _counterhomePortalEPP, transitionType: TransitionType.fadeIn);
    router.define('/ghhome',
        handler: _counterHandlerGh_home, transitionType: TransitionType.fadeIn);

    router.define('/ghRenovar',
        handler: _counterHandlerGhRenovarequipo,
        transitionType: TransitionType.fadeIn);
    router.define('/ghActivo',
        handler: _counterHandlerGhActivoequipo,
        transitionType: TransitionType.fadeIn);
    router.define('/capacitacionSeguridad',
        handler: _counterHandlerCapacitacionSeguridad,
        transitionType: TransitionType.fadeIn);

    router.define('/portalEpp',
        handler: _counterHandlerSignInScreen,
        transitionType: TransitionType.fadeIn);
    router.define('/ghSolicitudEpp',
        handler: _counterHandlerGhSolicitudEPPState,
        transitionType: TransitionType.fadeIn);
    router.define('/ghActasEntrega',
        handler: _counterHandlerGHActasEntrega,
        transitionType: TransitionType.fadeIn);
    router.define('/gh_CrearUsuario',
        handler: _counterHandlerGh_CrearUsuario,
        transitionType: TransitionType.fadeIn);
    router.define('/gh_AgregarCol',
        handler: _counterHandlerGh_AgregarCol,
        transitionType: TransitionType.fadeIn);
    router.define('/gh_RegistrarEpp',
        handler: _counterHandlerGhRegistrarEpp,
        transitionType: TransitionType.fadeIn);
    router.define('/gh_AlmacenarInventario',
        handler: _counterHandlerGH_AlmacenarInventario,
        transitionType: TransitionType.fadeIn);

    router.define('/col_Solicitud',
        handler: _counterHandlerColSolicitudes,
        transitionType: TransitionType.fadeIn);
    router.define('/col_Home',
        handler: _counterHandlerColHome, transitionType: TransitionType.fadeIn);
    router.define('/col_Firma',
        handler: _counterHandlerColFirma,
        transitionType: TransitionType.fadeIn);
    router.define('/col_EppActivo',
        handler: _counterHandlerColEppActivo,
        transitionType: TransitionType.fadeIn);

    router.define('/seg_home',
        handler: _counterHandlerSeg_home,
        transitionType: TransitionType.fadeIn);
    router.define('/seg_Solicitud',
        handler: _counterHandlerSegSolicitud,
        transitionType: TransitionType.fadeIn);

    router.define('/portalEstadoQuito',
        handler: _counterHandlerportalEstadoQuito,
        transitionType: TransitionType.fadeIn);
    router.define('/portalEstadoMilagro',
        handler: _counterHandlerEstadoMilagro,
        transitionType: TransitionType.fadeIn);
    router.define('/portalEstadoMachala',
        handler: _counterHandlerEstadoMachala,
        transitionType: TransitionType.fadeIn);
    router.define('/portalEstadoBabahoyo',
        handler: _counterHandlerEstadoBabahoyo,
        transitionType: TransitionType.fadeIn);
    router.define('/portalEstadoManta',
        handler: _counterHandlerEstadoManta,
        transitionType: TransitionType.fadeIn);

    router.notFoundHandler = pageNotFound;
  }

  static final Handler _counterhomePortalEPP = Handler(
    handlerFunc: (context, parameters) => const SignInScreen(),
  );

  //-------------PortalEpp_GH-------------------------------

  static final Handler _counterHandlerGh_home = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Administrador') {
        return Gh_home();
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerGhActivoequipo = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Administrador') {
        return GhActivoequipo();
      } else {
        return SignInScreen();
      }
    },
  );
  static final Handler _counterHandlerGHActasEntrega = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Administrador') {
        return GHActasEntrega();
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerGh_CrearUsuario = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Administrador') {
        return Gh_CrearUsuario();
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerGH_AlmacenarInventario = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Administrador') {
        return GH_AlmacenarInventario('');
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerGhRenovarequipo = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Administrador') {
        return GhRenovarequipo();
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerGh_MostrarPDF = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Administrador') {
        return Gh_MostrarPDF();
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerGhRegistrarEpp = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Administrador') {
        return GhRegistrarEpp();
      } else {
        return SignInScreen();
      }
    },
  );
  static final Handler _counterHandlerGhSolicitudEPPState = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Administrador') {
        return GhSolicitudEPPState();
      } else {
        return SignInScreen();
      }
    },
  );

  //-------------PortalEpp_Col--------------------------------

  static final Handler _counterHandlerColHome = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Participante') {
        return ColHome();
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerColFirma = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Participante') {
        return ColFirma();
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerColEppActivo = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Participante') {
        return ColEppActivo();
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerGh_AgregarCol = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Participante') {
        return Gh_AgregarCol();
      } else {
        return SignInScreen();
      }
    },
  );

  //-------------PortalEpp_Seg--------------------------------

  static final Handler _counterHandlerSeg_home = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Seguridad') {
        return Seg_home();
      } else {
        return SignInScreen();
      }
    },
  );

  static final Handler _counterHandlerSegSolicitud = Handler(
    handlerFunc: (context, parameters) {
      final auth = Provider.of<AuthService>(context!, listen: true);
      if (auth.tokenselected == 'Seguridad') {
        return SegSolicitud();
      } else {
        return SignInScreen();
      }
    },
  );

  //-------------PortalDeAcceso----------------

  static final Handler _counterHandler = Handler(
    handlerFunc: (context, parameters) =>
        MyApp(asegurados: obtenerSegurosTotales()),
  );
  static final Handler _counterHandlerCapacitacion = Handler(
    handlerFunc: (context, parameters) => const IngresoDataPersonal(),
  );

  static final Handler _counterHandlerCapacitacionSeguridad = Handler(
      handlerFunc: (context, parameters) => CapacitacionSeguridad(
            cedula: '',
            cd: '',
          ));

  static final Handler _counterHandlerEstadoMilagro = Handler(
    handlerFunc: (context, parameters) => PortalEstadoMilagro(""),
  );

  static final Handler _counterHandlerEstadoBabahoyo = Handler(
    handlerFunc: (context, parameters) => PortalEstadoBabahoyo(""),
  );

  static final Handler _counterHandlerEstadoMachala = Handler(
    handlerFunc: (context, parameters) => PortalEstadoMachala(""),
  );

  static final Handler _counterHandlerEstadoManta = Handler(
    handlerFunc: (context, parameters) => PortalEstadoManta(""),
  );

  static final Handler _counterHandlerportalEstadoQuito = Handler(
    handlerFunc: (context, parameters) => const PortalEstadoQuito(),
  );
  static final Handler _counterHandlerColSolicitudes = Handler(
    handlerFunc: (context, parameters) => const ColSolicitudes(),
  );
  static final Handler _counterHandlerSignInScreen = Handler(
    handlerFunc: (context, parameters) => const SignInScreen(),
  );

  static Handler pageNotFound =
      Handler(handlerFunc: (context, parameters) => View404());
}
