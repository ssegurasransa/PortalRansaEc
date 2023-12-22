import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:portaltransportistas/PortalEpp/provider/auth_provider.dart';
import 'package:portaltransportistas/PortalEpp/provider/gh_registerNew.dart';
import 'package:provider/provider.dart';
import 'package:portaltransportistas/routes/router.dart';

import 'package:portaltransportistas/services/navigation_service.dart';
import 'PortalEpp/pages/gh_registrarEPP.dart';
import 'PortalEpp/provider/col_registerNew.dart';
import 'PortalEpp/widgets/tableActivos.dart';
import 'Screens/portal_estado.dart';

import 'locator.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(MyAppMain());
}

class MyAppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VariablesExtCol()),
        ChangeNotifierProvider(create: (_) => VariablesExt()),
        ChangeNotifierProvider(create: (_) => ColDropdownService()),
        ChangeNotifierProvider(create: (_) => DropdownService()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Ransa',
        theme: ThemeData(
            primarySwatch:
                generateMaterialColor(color: Color.fromARGB(255, 0, 155, 8))),
        initialRoute: "/portalEpp",
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
