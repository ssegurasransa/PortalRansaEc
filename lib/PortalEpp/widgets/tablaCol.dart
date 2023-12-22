import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/provider/col_registerNew.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import 'package:portaltransportistas/PortalEpp/widgets/message_input.dart';
import 'package:provider/provider.dart';
import 'dart:js';

class TablaColSinFirma extends StatefulWidget {
  late List<TablasColFaltaFirmaSel>? data;

  TablaColSinFirma({super.key, required this.data});

  @override
  State<TablaColSinFirma> createState() => _TablaColSinFirmaState();
}

List selectEpp = [];

class _TablaColSinFirmaState extends State<TablaColSinFirma> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 194, 194, 194)),
                    borderRadius: BorderRadius.circular(10)),
                sortColumnIndex: 0,
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(label: Text("ID"), numeric: false, tooltip: "ID"),
                  DataColumn(
                      label: Text("Epp"), numeric: false, tooltip: "Epp"),
                  DataColumn(
                      label: Text("Fecha Compra"),
                      numeric: false,
                      tooltip: "Fecha Compra"),
                  DataColumn(
                      label: Text("Estado"), numeric: false, tooltip: "Estado"),
                  DataColumn(
                      label: Text("Cedula"), numeric: false, tooltip: "Cedula"),
                  DataColumn(
                      label: Text("FechaRenovar"),
                      numeric: false,
                      tooltip: "FechaRenovar"),
                  DataColumn(
                      label: Text("FechaDeEntrega"),
                      numeric: false,
                      tooltip: "FechaDeEntrega"),
                  DataColumn(
                      label: Text("Firmar"), numeric: false, tooltip: "Firmar"),
                ],
                rows: widget.data!
                    .map(
                      (valor) => DataRow(
                          selected: selectEpp.contains(valor),
                          onSelectChanged: (isSelected) => setState(() {
                                final isAdding =
                                    isSelected != null && isSelected;
                                if (selectEpp.length >= 1) {
                                  selectEpp.clear();
                                  isAdding
                                      ? {
                                          selectEpp.add(valor),
                                          colFirmaDocumentoActEntrega(
                                              context,
                                              "Freddy",
                                              "Paladines",
                                              valor.cedula,
                                              valor.nombreEpp,
                                              valor.cedula,
                                              "",
                                              valor.id),
                                        }
                                      : selectEpp.remove(valor);
                                } else {
                                  isAdding
                                      ? {
                                          selectEpp.add(valor),
                                          colFirmaDocumentoActEntrega(
                                              context,
                                              "Freddy",
                                              "Paladines",
                                              valor.cedula,
                                              valor.nombreEpp,
                                              valor.cedula,
                                              "",
                                              valor.id),
                                        }
                                      : selectEpp.remove(valor);
                                }
                              }),
                          cells: [
                            DataCell(Text(valor.id.toString())),
                            DataCell(Text(valor.nombreEpp)),
                            DataCell(Text(
                                "${valor.fechaCompra.day}/${valor.fechaCompra.month}/${valor.fechaCompra.year}")),
                            DataCell(Text(valor.estado)),
                            DataCell(Text(valor.cedula)),
                            DataCell(Text(
                                "${valor.fechaRenovar.day}/${valor.fechaRenovar.month}/${valor.fechaRenovar.year}")),
                            DataCell(Text(
                                "${valor.fechaDeEntrega.day}/${valor.fechaDeEntrega.month}/${valor.fechaDeEntrega.year}")),
                            DataCell(BotonFirmar()),
                          ]),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TablaColInventario extends StatefulWidget {
  late List<EppActivo>? data;

  TablaColInventario({super.key, required this.data});

  @override
  State<TablaColInventario> createState() => _TablaColInventarioState();
}

class _TablaColInventarioState extends State<TablaColInventario> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Container(
            width: ancho * 0.05,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 194, 194, 194)),
                    borderRadius: BorderRadius.circular(10)),
                sortColumnIndex: 0,
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(
                      label: Text("Nombres"),
                      numeric: false,
                      tooltip: "Nombre"),
                  DataColumn(
                      label: Text("Apellidos"),
                      numeric: false,
                      tooltip: "Apellidos"),
                  DataColumn(
                      label: Text("Cedula"), numeric: false, tooltip: "Cedula"),
                  DataColumn(
                      label: Text("Fecha Compra"),
                      numeric: false,
                      tooltip: "Fecha compra"),
                  DataColumn(
                      label: Text("Fecha Renovar"),
                      numeric: false,
                      tooltip: "Fecha renovar"),
                  DataColumn(
                      label: Text("EPP"), numeric: false, tooltip: "EPP"),
                  DataColumn(
                      label: Text("Estado"), numeric: false, tooltip: "Estado"),
                ],
                rows: widget.data!
                    .map(
                      (valor) => DataRow(
                          selected: selectEpp.contains(valor),
                          onSelectChanged: (isSelected) => setState(() {
                                final isAdding =
                                    isSelected != null && isSelected;
                                if (selectEpp.length >= 1) {
                                  selectEpp.clear();
                                  isAdding
                                      ? {
                                          selectEpp.add(valor),
                                          mostrarInventariooBaja(
                                            context,
                                            "Freddy",
                                            "Paladines",
                                            valor.cedula,
                                            valor.nombreEpp,
                                            valor.cedula,
                                            valor.id,
                                          ),
                                        }
                                      : selectEpp.remove(valor);
                                } else {
                                  isAdding
                                      ? {
                                          selectEpp.add(valor),
                                          mostrarInventariooBaja(
                                            context,
                                            "Freddy",
                                            "Paladines",
                                            valor.cedula,
                                            valor.nombreEpp,
                                            valor.cedula,
                                            valor.id,
                                          ),
                                        }
                                      : selectEpp.remove(valor);
                                }
                              }),
                          cells: [
                            DataCell(Text(valor.nombres)),
                            DataCell(Text(valor.apellidos)),
                            DataCell(Text(valor.cedula)),
                            DataCell(Text(valor.fechaCompra.day.toString() +
                                "/" +
                                valor.fechaCompra.month.toString() +
                                "/" +
                                valor.fechaCompra.year.toString())),
                            DataCell(Text(valor.fechaRenovar.day.toString() +
                                "/" +
                                valor.fechaRenovar.month.toString() +
                                "/" +
                                valor.fechaRenovar.year.toString())),
                            DataCell(Text(valor.nombreEpp)),
                            DataCell(EstadosEpp(valor.estado)),
                          ]),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  EstadosEpp(estado) {
    if (estado == "vigente") {
      return Container(
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(
              color: Colors.green,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text("vigente"));
    }
    if (estado == "Renovar") {
      return Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            border: Border.all(
              color: Colors.orange,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text("Renovar"));
    }
    if (estado == "Falta Firmar") {
      return Container(
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(
              color: Colors.red,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text("Falta Firmar"));
    }
    if (estado == "Solicitud") {
      return Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            border: Border.all(
              color: Colors.lightBlue,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text("Solicitud"));
    }
    if (estado == "") {
      return Container(child: Text(""));
    } else {
      return Text("");
    }
  }

  String cantidadLista(List<EppActivo>? data) {
    return ("${data?.length}");
  }
}

class TablaColSolicitud extends StatefulWidget {
  late List<TablasColSelectSolicitudEpp>? data;

  TablaColSolicitud({super.key, required this.data});

  @override
  State<TablaColSolicitud> createState() => _TablaColSolicitudState();
}

class _TablaColSolicitudState extends State<TablaColSolicitud> {
  @override
  Widget build(BuildContext context) {
    final variables = Provider.of<VariablesExtCol>(context, listen: true);

    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 194, 194, 194)),
                    borderRadius: BorderRadius.circular(10)),
                sortColumnIndex: 0,
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(label: Text("ID"), numeric: false, tooltip: "ID"),
                  DataColumn(
                      label: Text("Epp"), numeric: false, tooltip: "Epp"),
                  DataColumn(
                      label: Text("Nombre Epp"),
                      numeric: false,
                      tooltip: "Nombre Epp"),
                  DataColumn(
                      label: Text("Estado"), numeric: false, tooltip: "Estado"),
                  DataColumn(
                      label: Text("Motivo"), numeric: false, tooltip: "Motivo"),
                  DataColumn(
                      label: Text("Solicitud de renovación"),
                      numeric: false,
                      tooltip: "Solicitud de renovación"),
                ],
                rows: widget.data!
                    .map(
                      (valor) => DataRow(
                          selected: variables.selectEpp.contains(valor),
                          onSelectChanged: (isSelected) {
                            setState(() {
                              final isAdding = isSelected != null && isSelected;
                              if (variables.selectEpp.length >= 1 && isAdding) {
                                variables.selectEpp.clear();
                                isAdding
                                    ? {
                                        variables.selectEpp.add(valor),
                                        variables.idfun = valor.id.toString(),
                                        variables.eppfun =
                                            valor.nombreEpp.toString(),
                                      }
                                    : variables.selectEpp.remove(valor);
                              } else {
                                isAdding
                                    ? {
                                        variables.selectEpp.add(valor),
                                        variables.idfun = valor.id.toString(),
                                        variables.eppfun =
                                            valor.nombreEpp.toString(),
                                      }
                                    : variables.selectEpp.remove(valor);
                              }
                            });
                          },
                          cells: [
                            DataCell(Text(valor.id.toString())),
                            DataCell(Text(valor.cedula)),
                            DataCell(Text(valor.nombreEpp)),
                            DataCell(Text(valor.estado)),
                            DataCell(Text(valor.motivo)),
                            DataCell(Text(valor.tieneSolicitud)),
                          ]),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TablaColEppActivo extends StatefulWidget {
  late List<ColSelectActivoEpp>? data;

  TablaColEppActivo({super.key, required this.data});

  @override
  State<TablaColEppActivo> createState() => __TablaColEppActivoState();
}

class __TablaColEppActivoState extends State<TablaColEppActivo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 194, 194, 194)),
                    borderRadius: BorderRadius.circular(10)),
                sortColumnIndex: 0,
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(label: Text("ID"), numeric: false, tooltip: "ID"),
                  DataColumn(
                      label: Text("EPP"), numeric: false, tooltip: "Epp"),
                  DataColumn(
                      label: Text("Estado"), numeric: false, tooltip: "Estado"),
                  DataColumn(
                      label: Text("Fecha entrega"),
                      numeric: false,
                      tooltip: "Fecha entrega"),
                  DataColumn(
                      label: Text("Fecha renovar"),
                      numeric: false,
                      tooltip: "Fecha renovar"),
                  DataColumn(
                      label: Text("Firma"), numeric: false, tooltip: "Firma"),
                  DataColumn(
                      label: Text("Solicitud de renovación"),
                      numeric: false,
                      tooltip: "Solicitud de renovación"),
                ],
                rows: widget.data!
                    .map(
                      (valor) => DataRow(cells: [
                        DataCell(Text(valor.id.toString())),
                        DataCell(Text(valor.nombreEpp)),
                        DataCell(Text(valor.estado)),
                        DataCell(Text(
                            "${valor.fechaEntrega.day}/${valor.fechaEntrega.month}/${valor.fechaEntrega.year}")),
                        DataCell(Text(
                            "${valor.fechaRenovar.day}/${valor.fechaRenovar.month}/${valor.fechaRenovar.year}")),
                        DataCell(Text(valor.firma)),
                        DataCell(Text(valor.tieneSolicitud)),
                      ]),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

BotonFirmar() {
  return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          color: Colors.green,
          width: 8,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text("Click firmar"));
}
