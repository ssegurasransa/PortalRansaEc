import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tableActivos.dart';

import '../provider/providerEPP.dart';
import '../widgets/menu_gh.dart';

class GhActivoequipo extends StatefulWidget {
  const GhActivoequipo({super.key});

  @override
  State<GhActivoequipo> createState() => _GhActivoequipoState();
}

class _GhActivoequipoState extends State<GhActivoequipo> {
  @override
  Widget build(BuildContext context) {
    Future<List<EppActivo>> dataLista = eppActivostotales();
    TextEditingController _textoController = TextEditingController(text: "");

    double ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Gh_menu(),
          SingleChildScrollView(
            child: Column(children: [
              Container(
                width: ancho * 0.8,
                height: 100,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image(
                      image: AssetImage('assets/Logo_Ransa.png'), height: 140),
                ),
              ),
              Container(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                      child: Text(
                    "Buscar:  ",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )),
                  Container(
                    height: 57,
                    width: 300,
                    child: Card(
                      child: ListTile(
                          title: TextField(
                              controller: _textoController,
                              style: TextStyle(color: Colors.grey),
                              textInputAction: TextInputAction.search,
                              onSubmitted: (_) {
                                /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    MyAppConsulta(_textoController.text)))); */
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
                      style: TextStyle(color: Colors.grey, fontSize: 20),
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
                            child: Container(child: tablaActivo(filterData)),
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
              Row(
                children: [
                  SizedBox(
                    width: 160,
                    height: 35,
                    child: FutureBuilder<List<EppActivo>>(
                        future: dataLista,
                        builder: (context, snapshot) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff009B3A),
                            ),
                            onPressed: () {
                              print(snapshot.data
                                  ?.map((e) => e.apellidos)
                                  .toList());

                              _exportToExcel(
                                  snapshot.data?.map((e) => e.nombres).toList(),
                                  snapshot.data
                                      ?.map((e) => e.apellidos)
                                      .toList(),
                                  snapshot.data?.map((e) => e.cedula).toList(),
                                  snapshot.data
                                      ?.map((e) => e.fechaCompra)
                                      .toList(),
                                  snapshot.data
                                      ?.map((e) => e.fechaRenovar)
                                      .toList(),
                                  snapshot.data
                                      ?.map((e) => e.nombreEpp)
                                      .toList(),
                                  snapshot.data?.map((e) => e.estado).toList());

                              //_exportToExcel();
                            },
                            child: const Text('Generar reporte CSV'),
                          );
                        }),
                  )
                ],
              ),
              Container(
                height: 50,
              ),
            ]),
          )
        ],
      ),
    );
  }
}

_exportToExcel(
    nombre, apellido, cedula, fechaCompra, fechaRenovar, epp, estado) {
  final excel = Excel.createExcel();
  final sheet = excel.sheets[excel.getDefaultSheet() as String];
  sheet!.setColWidth(2, 50);
  sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
      "Nombre";
  sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0)).value =
      "Apellido";
  sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0)).value =
      "Cedula";
  sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0)).value =
      "Fecha compra";
  sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0)).value =
      "Fecha renovar";
  sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0)).value =
      "EPP";
  sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)).value =
      "Estado";

  for (var row = 1; row < nombre.length; row++) {
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row))
        .value = nombre[row];
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: row))
        .value = apellido[row];
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: row))
        .value = cedula[row];
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: row))
        .value = fechaCompra[row];
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: row))
        .value = fechaRenovar[row];
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: row))
        .value = epp[row];
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: row))
        .value = estado[row];
  }
  excel.save();
}
