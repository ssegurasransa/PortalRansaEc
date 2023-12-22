import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import 'package:portaltransportistas/PortalEpp/widgets/PaginaSinTrans.dart';
import 'package:portaltransportistas/PortalEpp/widgets/custom_buttomMenu.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_gh.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tablaCol.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tableActivos.dart';
import 'package:portaltransportistas/locator.dart';
import 'package:portaltransportistas/services/navigation_service.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';

class GH_AlmacenarInventario extends StatefulWidget {
  String query;
  GH_AlmacenarInventario(this.query, {Key? key}) : super(key: key);

  @override
  State<GH_AlmacenarInventario> createState() => _GH_AlmacenarInventarioState();
}

class _GH_AlmacenarInventarioState extends State<GH_AlmacenarInventario> {
  @override
  Widget build(BuildContext context) {
    Future<List<EppActivo>> dataLista =
        eppActivosInventario(query: widget.query);
    TextEditingController _textoController = TextEditingController(text: "");
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          Gh_menu(),
          Container(
            width: ancho * 0.8,
            child: SingleChildScrollView(
              child: Column(children: [
                ImagenRansaTop(ancho: ancho),
                SeparadorTitulo(titulo: "Inventarios de todos los Epp Activos"),
                Container(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      width: ancho * 0.05,
                    ),
                    Container(
                        child: Text(
                      "Buscar:  ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 110, 110, 110),
                          fontSize: 20),
                    )),
                    Container(
                      height: 57,
                      width: 300,
                      child: Card(
                        child: ListTile(
                            title: TextField(
                                controller: _textoController,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 110, 110, 110)),
                                textInputAction: TextInputAction.search,
                                onSubmitted: (_) {
                                  Navigator.of(context).push(customPageRoute(
                                      GH_AlmacenarInventario(
                                          _textoController.text)));
                                },
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                onChanged: (value) {}),
                            trailing: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    MyAppConsulta(_textoController.text)))); */
                                })),
                      ),
                    ),
                    Container(
                      width: 400,
                    ),
                    Container(
                        child: FutureBuilder<List<EppActivo>>(
                      future: dataLista,
                      builder: (context, snapshot) => Text(
                        "Cantidad de registros: ${cantidadLista(snapshot.data)}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 110, 110, 110),
                            fontSize: 20),
                      ),
                    )),
                  ],
                ),
                Container(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: 400,
                  width: 1200,
                  child: FutureBuilder<List<EppActivo>>(
                    future: dataLista,
                    builder: (context, snapshot) {
                      var filterData = snapshot.data;

                      if (snapshot.hasData) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: TablaColInventario(
                                data: filterData,
                              )),
                            )
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
                Container(
                  height: 100,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
