// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:portaltransportistas/api/provider.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_consultaQuito.dart';

import '../../widget/tabla.dart';

class PortalEstadoQuito extends StatefulWidget {

  const PortalEstadoQuito({Key? key}) : super(key: key);

  @override
  State<PortalEstadoQuito> createState() => _PortalEstadoQuitoState();
}

class _PortalEstadoQuitoState extends State<PortalEstadoQuito> {
  @override
  Widget build(BuildContext context) {

    Future<List<TablasQuito>> dataLista = obtenerTablasQuito();
    TextEditingController textoController = TextEditingController(text: "");

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Portal de acceso Ransa'),
        actions: [
          IconButton(
            icon: Image.asset('assets/Logo_Ransa_Blanco.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Card(
            child: ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                    controller: textoController,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ConsultaEstadoQuito(textoController.text))));
                    },
                    decoration: const InputDecoration(
                        hintText: 'Buscar por número de cedula',
                        border: InputBorder.none),
                    onChanged: (value) {}),
                trailing: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ConsultaEstadoQuito(textoController.text))));
                    })),
          ),
          Center(
            child: FutureBuilder<List<TablasQuito>>(
              future: dataLista,
              builder: (context, snapshot) {

                var filterData = snapshot.data;


                if (snapshot.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
//
//------Tabla----------------------------------
//

                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: tablaBodyAllCD3(filterData)),
                      )
                    ],
                  );
/*                 return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(snapshot.data![index].cedula));
                          }); */
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // Por defecto, muestra un loading spinner
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
