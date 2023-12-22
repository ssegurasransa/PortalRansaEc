import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_gh.dart';
import 'package:portaltransportistas/PortalEpp/widgets/message_input.dart';

import '../../widget/separadortitulo.dart';
import '../provider/providerEPP.dart';

class GHActasEntrega extends StatefulWidget {
  const GHActasEntrega({super.key});

  @override
  State<GHActasEntrega> createState() => _GHActasEntregaState();
}

class _GHActasEntregaState extends State<GHActasEntrega> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    Future<List<EppSelectFirmaGH>> dataLista = eppSelectFirmaGH();

    return Scaffold(
      body: Row(
        children: [
          Gh_menu(),
          SingleChildScrollView(
            child: Container(
              height: alto,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: ancho * 0.8,
                      height: 100,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image(
                            image: AssetImage('assets/Logo_Ransa.png'),
                            height: 140),
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                    SeparadorTitulo(
                      titulo: 'Acta de entrega',
                    ),
                    Container(
                      height: 50,
                    ),
                    Container(
                      width: ancho * 0.7,
                      child: FutureBuilder<List<EppSelectFirmaGH>>(
                          future: dataLista,
                          builder: (context, snapshot) {
                            var filterData = snapshot.data;
                            if (snapshot.hasData) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: DataTable(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 194, 194, 194)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    sortColumnIndex: 0,
                                    showCheckboxColumn: false,
                                    columns: const [
                                      DataColumn(
                                          label: Text("ID"),
                                          numeric: false,
                                          tooltip: "ID"),
                                      DataColumn(
                                          label: Text("Nombres"),
                                          numeric: false,
                                          tooltip: "Nombres"),
                                      DataColumn(
                                          label: Text("Apellidos"),
                                          numeric: false,
                                          tooltip: "Apellidos"),
                                      DataColumn(
                                          label: Text("Cedula"),
                                          numeric: false,
                                          tooltip: "Cedula"),
                                      DataColumn(
                                          label: Text("EPP"),
                                          numeric: false,
                                          tooltip: "Nombre Epp"),
                                      DataColumn(
                                          label: Text("Estado"),
                                          numeric: false,
                                          tooltip: "Estado"),
                                      DataColumn(
                                          label: Text("Número"),
                                          numeric: false,
                                          tooltip: "Estado"),
                                      DataColumn(
                                          label: Text("Documento"),
                                          numeric: false,
                                          tooltip: "UrlFirma"),
                                    ],
                                    rows: filterData!
                                        .map(
                                          (valor) => DataRow(cells: [
                                            DataCell(Text(valor.id.toString())),
                                            DataCell(
                                                Text(valor.nombres.toString())),
                                            DataCell(Text(valor.apellidos)),
                                            DataCell(Text(valor.cedula)),
                                            DataCell(Text(valor.nombreEpp)),
                                            DataCell(Text(valor.estado)),
                                            DataCell(
                                                Text(valor.numeroColaborador)),
                                            DataCell(onTap: () {
                                              mostrarDocumentoActEntrega(
                                                  context,
                                                  valor.nombres,
                                                  valor.apellidos,
                                                  valor.numeroColaborador,
                                                  valor.nombreEpp,
                                                  valor.cedula,
                                                  valor.firma);
                                            },
                                                Icon(
                                                  Icons.description,
                                                  color: Color(0xff009B3A),
                                                )),
                                          ]),
                                        )
                                        .toList(),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return CircularProgressIndicator();
                          }),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
