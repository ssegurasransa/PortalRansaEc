import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_solicitud.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_col.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tablaCol.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';

class ColEppActivo extends StatefulWidget {
  const ColEppActivo({super.key});

  @override
  State<ColEppActivo> createState() => _ColEppActivoState();
}

String cedula = '';
Future<List<ColSelectActivoEpp>> dataLista =
    obtenerColSelectActivoEpp(query: cedula);

class _ColEppActivoState extends State<ColEppActivo> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Row(children: [
      Col_menu(),
      Container(
        width: ancho * 0.8,
        child: SingleChildScrollView(
          child: Column(children: [
            ImagenRansaTop(ancho: ancho),
            SeparadorTitulo(
              titulo: 'Tus EPP activos',
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Container(
                  width: ancho * 0.05,
                ),
                SizedBox(
                  height: 400,
                  width: 1075,
                  child: FutureBuilder<List<ColSelectActivoEpp>>(
                      future: dataLista,
                      builder: (context, snapshot) {
                        var filterData = snapshot.data;
                        if (snapshot.hasData) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            children: <Widget>[
                              Expanded(
                                child: TablaColEppActivo(
                                  data: filterData,
                                ),
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      }),
                ),
              ],
            ),
          ]),
        ),
      )
    ]));
  }
}
