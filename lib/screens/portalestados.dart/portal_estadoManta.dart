import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:portaltransportistas/api/provider.dart';
import 'package:portaltransportistas/screens/portalestados.dart/portal_consultaQuito.dart';

import '../../widget/tabla.dart';
import '../portal_estadosconsulta.dart';

class PortalEstadoManta extends StatelessWidget {
  String query;

  PortalEstadoManta(this.query, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<List<TablasMantaConsulta>> dataLista =
        obtenerTablasMantaConsulta(query: query);
    TextEditingController _textoController = TextEditingController(text: "");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Portal de acceso Ransa Manta'),
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
                leading: Icon(Icons.search),
                title: TextField(
                    controller: _textoController,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  PortalEstadoManta(_textoController.text))));
                    },
                    decoration: InputDecoration(
                        hintText: 'Buscar por número de cedula',
                        border: InputBorder.none),
                    onChanged: (value) {}),
                trailing: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  PortalEstadoManta(_textoController.text))));
                    })),
          ),
          Center(
            child: FutureBuilder<List<TablasMantaConsulta>>(
              future: dataLista,
              builder: (context, snapshot) {
                var filterData = snapshot.data;
                if (snapshot.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
//
//------Tabla----------------------------------
//
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
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
                return CircularProgressIndicator();
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
