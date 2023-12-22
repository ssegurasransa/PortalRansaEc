import 'package:flutter/material.dart';

import '../../widget/separadortitulo.dart';
import '../provider/providerEPP.dart';
import '../widgets/menu_gh.dart';
import '../widgets/message_input.dart';

class GhSolicitudEPPState extends StatefulWidget {
  const GhSolicitudEPPState({super.key});

  @override
  State<GhSolicitudEPPState> createState() => _GhSolicitudEPPStateState();
}

List selectEpp = [];

class _GhSolicitudEPPStateState extends State<GhSolicitudEPPState> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    Future<List<EppSolicitudList>> dataLista = eppSolicitudEppGHRenovar();

    return Scaffold(
      body: Row(
        children: [
          const Gh_menu(),
          SingleChildScrollView(
            child: Column(children: [
              Container(
                width: ancho * 0.8,
                height: 100,
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Image(
                      image: AssetImage('assets/Logo_Ransa.png'), height: 140),
                ),
              ),
              Container(
                height: 50,
              ),
              SeparadorTitulo(
                titulo: 'Solicitudes de EPP',
              ),
              Container(
                height: 50,
              ),
              Container(
                width: ancho * 0.8,
                child: Row(
                  children: [
                    Container(width: ancho * 0.05),
                    Container(
                      width: ancho * 0.7,
                      child: FutureBuilder<List<EppSolicitudList>>(
                          future: dataLista,
                          builder: (context, snapshot) {
                            var filterData = snapshot.data;
                            if (snapshot.hasData) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: DataTable(
                                    dataRowMinHeight: 40,
                                    dataRowMaxHeight: 100,
                                    columnSpacing: 20.0,
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
                                          label: Text("Fecha compra"),
                                          numeric: false,
                                          tooltip: "Fecha compra"),
                                      DataColumn(
                                          label: Text("Fecha de entrega"),
                                          numeric: false,
                                          tooltip: "Fecha de entrega"),
                                      DataColumn(
                                          label: Text("EPP"),
                                          numeric: false,
                                          tooltip: "Nombre Epp"),
                                      DataColumn(
                                          label: Text("Estado"),
                                          numeric: false,
                                          tooltip: "Estado"),
                                      DataColumn(
                                          label: Text("Motivo"),
                                          numeric: false,
                                          tooltip: "Motivo"),
                                      DataColumn(
                                          label: Text("Comentarios"),
                                          numeric: false,
                                          tooltip: "Comentarios"),
                                      DataColumn(
                                          label: Text("Solicitud"),
                                          numeric: false,
                                          tooltip: "Solicitud"),
                                    ],
                                    rows: filterData!
                                        .map(
                                          (valor) => DataRow(
                                              /* selected:
                                                  selectEpp.contains(valor),
                                              onSelectChanged: (isSelected) =>
                                                  setState(() {
                                                    final isAdding =
                                                        isSelected != null &&
                                                            isSelected;
                                                    if (selectEpp.length >= 1 &&
                                                        isAdding) {
                                                      selectEpp.clear();
                                                      isAdding
                                                          ? {
                                                              selectEpp
                                                                  .add(valor),
                                                            }
                                                          : selectEpp
                                                              .remove(valor);
                                                      print(selectEpp);
                                                    } else {
                                                      isAdding
                                                          ? {
                                                              selectEpp
                                                                  .add(valor),
                                                            }
                                                          : selectEpp
                                                              .remove(valor);
                                                      print(selectEpp);
                                                    }
                                                  }), */
                                              cells: [
                                                DataCell(Text(
                                                    valor.nombres.toString())),
                                                DataCell(Text(valor.apellidos)),
                                                DataCell(Text(valor.cedula)),
                                                DataCell(Text(
                                                    "${valor.fechaCompra.day}/${valor.fechaCompra.month}/${valor.fechaCompra.year}")),
                                                DataCell(Text(
                                                    "${valor.fechaDeEntrega.day}/${valor.fechaDeEntrega.month}/${valor.fechaDeEntrega.year}")),
                                                DataCell(Text(valor.nombreEpp)),
                                                DataCell(Text(valor.estado)),
                                                DataCell(Text(
                                                    valor.motivo.toString())),
                                                DataCell(SizedBox(
                                                  height: 80,
                                                  width: 275,
                                                  child: Text(
                                                    valor.comentarios,
                                                    maxLines: 4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                                DataCell(onTap: () {
                                                  mostrarDialogoEntregaRealizada(
                                                      context,
                                                      valor.nombres,
                                                      valor.apellidos,
                                                      valor.cedula,
                                                      valor.fechaCompra,
                                                      valor.fechaDeEntrega,
                                                      valor.nombreEpp,
                                                      valor.estado,
                                                      valor.motivo,
                                                      valor.comentarios,
                                                      valor.id);
                                                },
                                                    Icon(
                                                      Icons.check,
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
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
